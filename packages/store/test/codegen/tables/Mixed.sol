// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "../../../src/IStore.sol";
import { StoreSwitch } from "../../../src/StoreSwitch.sol";
import { StoreCore } from "../../../src/StoreCore.sol";
import { Bytes } from "../../../src/Bytes.sol";
import { Memory } from "../../../src/Memory.sol";
import { SliceLib } from "../../../src/Slice.sol";
import { EncodeArray } from "../../../src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "../../../src/FieldLayout.sol";
import { Schema, SchemaLib } from "../../../src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "../../../src/PackedCounter.sol";
import { ResourceId } from "../../../src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "../../../src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14("store"), bytes16("Mixed")))
);
ResourceId constant MixedTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0014020204100000000000000000000000000000000000000000000000000000
);

struct MixedData {
  uint32 u32;
  uint128 u128;
  uint32[] a32;
  string s;
}

library Mixed {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](4);
    _valueSchema[0] = SchemaType.UINT32;
    _valueSchema[1] = SchemaType.UINT128;
    _valueSchema[2] = SchemaType.UINT32_ARRAY;
    _valueSchema[3] = SchemaType.STRING;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](4);
    fieldNames[0] = "u32";
    fieldNames[1] = "u128";
    fieldNames[2] = "a32";
    fieldNames[3] = "s";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get u32
   */
  function getU32(bytes32 key) internal view returns (uint32 u32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get u32
   */
  function _getU32(bytes32 key) internal view returns (uint32 u32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get u32 (using the specified store)
   */
  function getU32(IStore _store, bytes32 key) internal view returns (uint32 u32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set u32
   */
  function setU32(bytes32 key, uint32 u32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((u32)), _fieldLayout);
  }

  /**
   * @notice Set u32
   */
  function _setU32(bytes32 key, uint32 u32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((u32)), _fieldLayout);
  }

  /**
   * @notice Set u32 (using the specified store)
   */
  function setU32(IStore _store, bytes32 key, uint32 u32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((u32)), _fieldLayout);
  }

  /**
   * @notice Get u128
   */
  function getU128(bytes32 key) internal view returns (uint128 u128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint128(bytes16(_blob)));
  }

  /**
   * @notice Get u128
   */
  function _getU128(bytes32 key) internal view returns (uint128 u128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint128(bytes16(_blob)));
  }

  /**
   * @notice Get u128 (using the specified store)
   */
  function getU128(IStore _store, bytes32 key) internal view returns (uint128 u128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint128(bytes16(_blob)));
  }

  /**
   * @notice Set u128
   */
  function setU128(bytes32 key, uint128 u128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((u128)), _fieldLayout);
  }

  /**
   * @notice Set u128
   */
  function _setU128(bytes32 key, uint128 u128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((u128)), _fieldLayout);
  }

  /**
   * @notice Set u128 (using the specified store)
   */
  function setU128(IStore _store, bytes32 key, uint128 u128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((u128)), _fieldLayout);
  }

  /**
   * @notice Get a32
   */
  function getA32(bytes32 key) internal view returns (uint32[] memory a32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Get a32
   */
  function _getA32(bytes32 key) internal view returns (uint32[] memory a32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Get a32 (using the specified store)
   */
  function getA32(IStore _store, bytes32 key) internal view returns (uint32[] memory a32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Set a32
   */
  function setA32(bytes32 key, uint32[] memory a32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((a32)));
  }

  /**
   * @notice Set a32
   */
  function _setA32(bytes32 key, uint32[] memory a32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((a32)));
  }

  /**
   * @notice Set a32 (using the specified store)
   */
  function setA32(IStore _store, bytes32 key, uint32[] memory a32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((a32)));
  }

  /**
   * @notice Get length of a32
   */
  function lengthA32(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get length of a32
   */
  function _lengthA32(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get length of a32 (using the specified store)
   */
  function lengthA32(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get an item of a32
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItemA32(bytes32 key, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Get an item of a32
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function _getItemA32(bytes32 key, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Get an item of a32 (using the specified store)
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItemA32(IStore _store, bytes32 key, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Push an element to a32
   */
  function pushA32(bytes32 key, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to a32
   */
  function _pushA32(bytes32 key, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to a32 (using the specified store)
   */
  function pushA32(IStore _store, bytes32 key, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from a32
   */
  function popA32(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Pop an element from a32
   */
  function _popA32(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Pop an element from a32 (using the specified store)
   */
  function popA32(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Update an element of a32 at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateA32(bytes32 key, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of a32 at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function _updateA32(bytes32 key, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of a32 (using the specified store) at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateA32(IStore _store, bytes32 key, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      _store.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get s
   */
  function getS(bytes32 key) internal view returns (string memory s) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Get s
   */
  function _getS(bytes32 key) internal view returns (string memory s) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Get s (using the specified store)
   */
  function getS(IStore _store, bytes32 key) internal view returns (string memory s) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getDynamicField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /**
   * @notice Set s
   */
  function setS(bytes32 key, string memory s) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, bytes((s)));
  }

  /**
   * @notice Set s
   */
  function _setS(bytes32 key, string memory s) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, bytes((s)));
  }

  /**
   * @notice Set s (using the specified store)
   */
  function setS(IStore _store, bytes32 key, string memory s) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setDynamicField(_tableId, _keyTuple, 1, bytes((s)));
  }

  /**
   * @notice Get length of s
   */
  function lengthS(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get length of s
   */
  function _lengthS(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get length of s (using the specified store)
   */
  function lengthS(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of s
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItemS(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of s
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function _getItemS(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of s (using the specified store)
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItemS(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to s
   */
  function pushS(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Push a slice to s
   */
  function _pushS(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Push a slice to s (using the specified store)
   */
  function pushS(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from s
   */
  function popS(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Pop a slice from s
   */
  function _popS(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Pop a slice from s (using the specified store)
   */
  function popS(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Update a slice of s at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateS(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of s at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function _updateS(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of s (using the specified store) at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateS(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _encoded = bytes((_slice));
      _store.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (MixedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data */
  function _get(bytes32 key) internal view returns (MixedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (MixedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = _store.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function set(bytes32 key, uint32 u32, uint128 u128, uint32[] memory a32, string memory s) internal {
    bytes memory _staticData = encodeStatic(u32, u128);

    PackedCounter _encodedLengths = encodeLengths(a32, s);
    bytes memory _dynamicData = encodeDynamic(a32, s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function _set(bytes32 key, uint32 u32, uint128 u128, uint32[] memory a32, string memory s) internal {
    bytes memory _staticData = encodeStatic(u32, u128);

    PackedCounter _encodedLengths = encodeLengths(a32, s);
    bytes memory _dynamicData = encodeDynamic(a32, s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 key, uint32 u32, uint128 u128, uint32[] memory a32, string memory s) internal {
    bytes memory _staticData = encodeStatic(u32, u128);

    PackedCounter _encodedLengths = encodeLengths(a32, s);
    bytes memory _dynamicData = encodeDynamic(a32, s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, MixedData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.u32, _table.u128);

    PackedCounter _encodedLengths = encodeLengths(_table.a32, _table.s);
    bytes memory _dynamicData = encodeDynamic(_table.a32, _table.s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using the data struct */
  function _set(bytes32 key, MixedData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.u32, _table.u128);

    PackedCounter _encodedLengths = encodeLengths(_table.a32, _table.s);
    bytes memory _dynamicData = encodeDynamic(_table.a32, _table.s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, MixedData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.u32, _table.u128);

    PackedCounter _encodedLengths = encodeLengths(_table.a32, _table.s);
    bytes memory _dynamicData = encodeDynamic(_table.a32, _table.s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * Decode the tightly packed blob of static data using this table's field layout
   * Undefined behaviour for invalid blobs
   */
  function decodeStatic(bytes memory _blob) internal pure returns (uint32 u32, uint128 u128) {
    u32 = (uint32(Bytes.slice4(_blob, 0)));

    u128 = (uint128(Bytes.slice16(_blob, 4)));
  }

  /**
   * Decode the tightly packed blob of static data using this table's field layout
   * Undefined behaviour for invalid blobs
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (uint32[] memory a32, string memory s) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    a32 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint32());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    s = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(
    bytes memory _staticData,
    PackedCounter _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (MixedData memory _table) {
    (_table.u32, _table.u128) = decodeStatic(_staticData);

    (_table.a32, _table.s) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /** Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /** Delete all data for given keys */
  function _deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /** Tightly pack static data using this table's schema */
  function encodeStatic(uint32 u32, uint128 u128) internal pure returns (bytes memory) {
    return abi.encodePacked(u32, u128);
  }

  /** Tightly pack dynamic data using this table's schema */
  function encodeLengths(uint32[] memory a32, string memory s) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(a32.length * 4, bytes(s).length);
    }
  }

  /** Tightly pack dynamic data using this table's schema */
  function encodeDynamic(uint32[] memory a32, string memory s) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((a32)), bytes((s)));
  }

  /** Tightly pack full data using this table's field layout */
  function encode(
    uint32 u32,
    uint128 u128,
    uint32[] memory a32,
    string memory s
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(u32, u128);

    PackedCounter _encodedLengths = encodeLengths(a32, s);
    bytes memory _dynamicData = encodeDynamic(a32, s);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    return _keyTuple;
  }
}