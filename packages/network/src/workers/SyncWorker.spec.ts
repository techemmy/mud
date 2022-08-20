import { JsonRpcProvider } from "@ethersproject/providers";
import { sleep } from "@latticexyz/utils";
import { computed } from "mobx";
import { SyncWorker } from "./SyncWorker";
import { Subject } from "rxjs";
import { NetworkComponentUpdate, SyncWorkerConfig } from "../types";
import { EntityID } from "@latticexyz/recs";
import { createCacheStore, storeEvent } from "./CacheStore";
import * as syncUtils from "./syncUtils";
import "fake-indexeddb/auto";

// Test constants
const cacheBlockNumber = 99;
const cacheEvent = {
  component: "0x10",
  entity: "0x11" as EntityID,
  value: {},
  txHash: "0x12",
  lastEventInTx: true,
  blockNumber: cacheBlockNumber + 1,
};
const snapshotBlockNumber = 9999;
const snapshotEvents = [
  {
    component: "0x42",
    entity: "0x11" as EntityID,
    value: {},
    txHash: "0x12",
    lastEventInTx: true,
    blockNumber: snapshotBlockNumber + 1,
  },
];
const blockNumber$ = new Subject<number>();
const latestEvent$ = new Subject<NetworkComponentUpdate>();
const lastGapStateEventBlockNumber = 999;
const gapStateEvents = [
  {
    component: "0x20",
    entity: "0x21" as EntityID,
    value: {},
    txHash: "0x22",
    lastEventInTx: true,
    blockNumber: lastGapStateEventBlockNumber,
  },
];

// Mocks
jest.mock("../createProvider", () => ({
  ...jest.requireActual("../createProvider"),
  createReconnectingProvider: () => ({
    providers: computed(() => ({
      json: new JsonRpcProvider(""),
    })),
  }),
}));

jest.mock("./CacheStore", () => ({
  ...jest.requireActual("./CacheStore"),
  getIndexDbECSCache: () => ({
    get: (store: string, key: string) => {
      if (store === "BlockNumber" && key === "current") return cacheBlockNumber;
    },
  }),
  loadIndexDbCacheStore: () => {
    const cache = createCacheStore();

    storeEvent(cache, cacheEvent);

    return cache;
  },
}));

jest.mock("../createBlockNumberStream", () => ({
  ...jest.requireActual("../createBlockNumberStream"),
  createBlockNumberStream: () => ({ blockNumber$ }),
}));

jest.mock("./syncUtils", () => ({
  ...jest.requireActual("./syncUtils"),
  createFetchWorldEventsInBlockRange: () => () => Promise.resolve([]),
  createLatestEventStream: () => latestEvent$,
  getSnapshotBlockNumber: () => Promise.resolve(snapshotBlockNumber),
  fetchSnapshot: () => {
    const store = createCacheStore();
    for (const event of snapshotEvents) storeEvent(store, event);
    return store;
  },
  fetchStateInBlockRange: jest.fn((fetchWorldEvents: any, from: number, to: number) => {
    const store = createCacheStore();
    if (to > 1000) {
      for (const event of gapStateEvents) storeEvent(store, event);
    }
    return store;
  }),
}));

// Tests
describe("Sync.worker", () => {
  let input$: Subject<SyncWorkerConfig>;
  let output: jest.Mock;

  beforeEach(async () => {
    input$ = new Subject<SyncWorkerConfig>();
    const worker = new SyncWorker();

    output = jest.fn();
    worker.work(input$).subscribe(output);
  });

  it("should pass live events to the output", async () => {
    input$.next({
      checkpointServiceUrl: "",
      chainId: 4242,
      worldContract: { address: "0x0", abi: [] },
      provider: { jsonRpcUrl: "", options: { batch: false, pollingInterval: 1000, skipNetworkCheck: true } },
      initialBlockNumber: 0,
    });

    await sleep(0);
    blockNumber$.next(101);
    await sleep(0);

    const event: NetworkComponentUpdate = {
      component: "0x0",
      entity: "0x1" as EntityID,
      value: {},
      txHash: "0x2",
      lastEventInTx: true,
      blockNumber: 111,
    };

    latestEvent$.next(event);

    // Expect output to contain live event
    expect(output).toHaveBeenCalledWith(event);
  });

  it("should sync from the snapshot if the snapshot block number is more than 100 blocks newer than then cache", async () => {
    input$.next({
      checkpointServiceUrl: "http://localhost:50052",
      chainId: 4242,
      worldContract: { address: "0x0", abi: [] },
      provider: { jsonRpcUrl: "", options: { batch: false, pollingInterval: 1000, skipNetworkCheck: true } },
      initialBlockNumber: 0,
    });

    await sleep(0);
    blockNumber$.next(101);
    await sleep(0);

    // Expect output to contain the events from the cache
    expect(output).toHaveBeenCalledTimes(1);
    expect(output).toHaveBeenCalledWith({
      ...snapshotEvents[0],
      blockNumber: snapshotBlockNumber,
      lastEventInTx: false,
      txHash: "cache",
    });
  });

  it("should sync from the cache if the snapshot service is not available", async () => {
    input$.next({
      checkpointServiceUrl: "",
      chainId: 4242,
      worldContract: { address: "0x0", abi: [] },
      provider: { jsonRpcUrl: "", options: { batch: false, pollingInterval: 1000, skipNetworkCheck: true } },
      initialBlockNumber: 0,
    });

    await sleep(0);
    blockNumber$.next(101);
    await sleep(0);

    // Expect output to contain the events from the cache
    expect(output).toHaveBeenCalledTimes(1);
    expect(output).toHaveBeenCalledWith({
      ...cacheEvent,
      blockNumber: cacheBlockNumber,
      lastEventInTx: false,
      txHash: "cache",
    });
  });

  it("should fetch the state diff between cache/snapshot and current block number", async () => {
    input$.next({
      checkpointServiceUrl: "",
      chainId: 4242,
      worldContract: { address: "0x0", abi: [] },
      provider: { jsonRpcUrl: "", options: { batch: false, pollingInterval: 1000, skipNetworkCheck: true } },
      initialBlockNumber: 0,
    });

    const currentBlockNumber = 1001;

    await sleep(0);
    blockNumber$.next(currentBlockNumber);
    await sleep(0);

    // Expect state between cache block number and current block number to have been fetched
    expect(syncUtils.fetchStateInBlockRange).toHaveBeenLastCalledWith(
      expect.anything(),
      cacheBlockNumber,
      currentBlockNumber
    );

    // Expect output to contain the events from the the gap state
    expect(output).toHaveBeenCalledWith({
      ...gapStateEvents[0],
      blockNumber: lastGapStateEventBlockNumber - 1,
      lastEventInTx: false,
      txHash: "cache",
    });
  });

  it("should first load from cache, then fetch the state gap, then pass live events", async () => {
    input$.next({
      checkpointServiceUrl: "",
      chainId: 4242,
      worldContract: { address: "0x0", abi: [] },
      provider: { jsonRpcUrl: "", options: { batch: false, pollingInterval: 1000, skipNetworkCheck: true } },
      initialBlockNumber: 0,
    });

    const firstLiveBlockNumber = 1001;
    const secondLiveBlockNumber = 1002;

    const event1: NetworkComponentUpdate = {
      component: "0x99",
      entity: "0x1" as EntityID,
      value: {},
      txHash: "0x2",
      lastEventInTx: true,
      blockNumber: firstLiveBlockNumber,
    };

    const event2: NetworkComponentUpdate = {
      component: "0x999",
      entity: "0x1" as EntityID,
      value: {},
      txHash: "0x2",
      lastEventInTx: true,
      blockNumber: secondLiveBlockNumber,
    };

    const event3: NetworkComponentUpdate = {
      component: "0x9999",
      entity: "0x1" as EntityID,
      value: {},
      txHash: "0x2",
      lastEventInTx: true,
      blockNumber: 1003,
    };

    await sleep(0);
    // Event 1 and 2 arrive while the initial sync is in progress
    latestEvent$.next(event1);
    blockNumber$.next(firstLiveBlockNumber);
    latestEvent$.next(event2);
    blockNumber$.next(secondLiveBlockNumber);
    await sleep(0);

    // Event 3 arrives after the initial sync
    latestEvent$.next(event3);

    // Expect output to contain all events (cache, gap state, live events)
    expect(output).toHaveBeenCalledTimes(5);

    // Expect output to contain cache events
    expect(output).toHaveBeenNthCalledWith(1, {
      ...cacheEvent,
      blockNumber: secondLiveBlockNumber - 1,
      lastEventInTx: false,
      txHash: "cache",
    });

    // Expect state between cache block number and current block number to have been fetched
    expect(syncUtils.fetchStateInBlockRange).toHaveBeenLastCalledWith(
      expect.anything(),
      cacheBlockNumber,
      firstLiveBlockNumber
    );

    // Expect output to contain the events from the cache and the gap state
    expect(output).toHaveBeenNthCalledWith(2, {
      ...gapStateEvents[0],
      blockNumber: secondLiveBlockNumber - 1,
      lastEventInTx: false,
      txHash: "cache",
    });

    // Expect output to contain live events that arrived before the initial sync was complete
    expect(output).toHaveBeenNthCalledWith(3, { ...event1, lastEventInTx: false, txHash: "cache" });
    expect(output).toHaveBeenNthCalledWith(4, {
      ...event2,
      lastEventInTx: false,
      txHash: "cache",
      blockNumber: secondLiveBlockNumber - 1,
    });

    // Expect output to contain live events that arrived after the initial sync
    expect(output).toHaveBeenNthCalledWith(5, event3);
  });
});