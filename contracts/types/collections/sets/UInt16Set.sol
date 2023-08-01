// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import {
    UInt16,
    UInt16Utils
} from "contracts/types/primitives/UInt16.sol";

/* -------------------------------------------------------------------------- */
/*                             SECTION UInt16Set                              */
/* -------------------------------------------------------------------------- */

library UInt16Set {

    struct Enumerable {
    // 1-indexed to allow 0 to signify nonexistence
    mapping( uint16 => uint256 ) _indexes;
    uint16[] _values;
    uint16 _maxValue;
  }

    // 1-indexed to allow 0 to signify nonexistence
    struct Layout {
        UInt16Set.Enumerable UInt16Set;
    }

}

/* -------------------------------------------------------------------------- */
/*                             !SECTION UInt16Set                             */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                            SECTION UInt16SetOps                            */
/* -------------------------------------------------------------------------- */

library UInt16SetUtils {

    using UInt16SetUtils for UInt16Set.Layout;
    using UInt16Utils for UInt16.Layout;

    bytes32 constant private STRUCT_STORAGE_SLOT = keccak256(type(UInt16Set).creationCode);

    function _structSlot() pure internal returns (bytes32 structSlot) {
        structSlot = STRUCT_STORAGE_SLOT
            ^ UInt16Utils._structSlot();
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
    ) pure internal returns (UInt16Set.Layout storage layout) {
        bytes32 saltedSlot = _saltStorageSlot(salt);
        assembly{ layout.slot := saltedSlot }
    }

    function _at(
        UInt16Set.Layout storage layout,
        uint value
    ) view internal returns (uint16) {
        
    }



   // move last value to now-vacant index

    // clear last index

}

/* -------------------------------------------------------------------------- */
/*                            !SECTION UInt16SetOps                           */
/* -------------------------------------------------------------------------- */