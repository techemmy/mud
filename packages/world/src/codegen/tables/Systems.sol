// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14("world"), bytes16("Systems")))
);
ResourceId constant SystemsTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0015020014010000000000000000000000000000000000000000000000000000
);

library Systems {
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
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.ADDRESS;
    _valueSchema[1] = SchemaType.BOOL;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "systemId";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "system";
    fieldNames[1] = "publicAccess";
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
   * @notice Get system
   */
  function getSystem(ResourceId systemId) internal view returns (address system) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get system
   */
  function _getSystem(ResourceId systemId) internal view returns (address system) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get system (using the specified store)
   */
  function getSystem(IStore _store, ResourceId systemId) internal view returns (address system) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set system
   */
  function setSystem(ResourceId systemId, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((system)), _fieldLayout);
  }

  /**
   * @notice Set system
   */
  function _setSystem(ResourceId systemId, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((system)), _fieldLayout);
  }

  /**
   * @notice Set system (using the specified store)
   */
  function setSystem(IStore _store, ResourceId systemId, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    _store.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((system)), _fieldLayout);
  }

  /**
   * @notice Get publicAccess
   */
  function getPublicAccess(ResourceId systemId) internal view returns (bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get publicAccess
   */
  function _getPublicAccess(ResourceId systemId) internal view returns (bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get publicAccess (using the specified store)
   */
  function getPublicAccess(IStore _store, ResourceId systemId) internal view returns (bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set publicAccess
   */
  function setPublicAccess(ResourceId systemId, bool publicAccess) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((publicAccess)), _fieldLayout);
  }

  /**
   * @notice Set publicAccess
   */
  function _setPublicAccess(ResourceId systemId, bool publicAccess) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((publicAccess)), _fieldLayout);
  }

  /**
   * @notice Set publicAccess (using the specified store)
   */
  function setPublicAccess(IStore _store, ResourceId systemId, bool publicAccess) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    _store.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((publicAccess)), _fieldLayout);
  }

  /** Get the full data */
  function get(ResourceId systemId) internal view returns (address system, bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data */
  function _get(ResourceId systemId) internal view returns (address system, bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, ResourceId systemId) internal view returns (address system, bool publicAccess) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = _store.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function set(ResourceId systemId, address system, bool publicAccess) internal {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function _set(ResourceId systemId, address system, bool publicAccess) internal {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, ResourceId systemId, address system, bool publicAccess) internal {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    _store.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * Decode the tightly packed blob of static data using this table's field layout
   * Undefined behaviour for invalid blobs
   */
  function decodeStatic(bytes memory _blob) internal pure returns (address system, bool publicAccess) {
    system = (address(Bytes.slice20(_blob, 0)));

    publicAccess = (_toBool(uint8(Bytes.slice1(_blob, 20))));
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (address system, bool publicAccess) {
    (system, publicAccess) = decodeStatic(_staticData);
  }

  /** Delete all data for given keys */
  function deleteRecord(ResourceId systemId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /** Delete all data for given keys */
  function _deleteRecord(ResourceId systemId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, ResourceId systemId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /** Tightly pack static data using this table's schema */
  function encodeStatic(address system, bool publicAccess) internal pure returns (bytes memory) {
    return abi.encodePacked(system, publicAccess);
  }

  /** Tightly pack full data using this table's field layout */
  function encode(address system, bool publicAccess) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(system, publicAccess);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(ResourceId systemId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(systemId);

    return _keyTuple;
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}