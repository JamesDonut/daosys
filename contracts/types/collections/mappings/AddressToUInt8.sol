// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import {
    UInt8,
    UInt8String
} from "../primitives/UInt8.sol"

library AddressToUInt8 {

    // NOTE Should only use language primitives as key pending research on the consistency of using a struct.
    struct Layout {

    }

}

library AddressToUInt8Utils {

    using AddressToUInt8Utils for AddressToUInt8.Layout;
    using UInt8Utils for UInt8.Layout;

    bytes32 constant private STRUCT_STORAGE_SLOT = keccak256(type(AddressToUInt8).creationCode);

    function _structSlot() pure internal returns (bytes32 structSlot) {
        structSlot = STRUCT_STORAGE_SLOT
            ^ UInt8Utils._structSlot();
    }

    function _saltStorageSlot(
        bytes32 storageSlotSalt
    ) pure internal returns (bytes32 saltedStorageSlot) {
        saltedStorageSlot = storageSlotSalt
            ^ _structSlot();
    }

   /**
    * @notice Could be optimized by having the exposing interface caclulate and store
    *  the storage slot as a constant.
    *  Storage slot is computed during runtime to facilitate development during
    *  standardization.
    */
    function _layout(
        bytes32 salt
    ) pure internal returns (AddressToUInt8.Layout storage layout) {
        bytes32 saltedSlot = _saltStorageSlot(salt);
        assembly { layout.slot := saltedSlot }
    }

    function _mapValue(
        AddressToUInt8.Layout storage layout,
        address key,
        uint8 newValue
    ) internal {
        layout.value[key]._setValue(newValue);
    }

    function _queryValue(
        AddressToUInt8.Layout storage layout,
        address key
    ) view internal returns (uint8 value) {
        value = layout.value[key]._getValue();
    }

    function _unMapValue(
        AddressToUInt8.Layout storage layout,
        address key
    ) internal {
        layout.value[key]._wipeValue();
        delete layout.value[key];
    }

}






