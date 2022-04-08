// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import {
  UInt256,
  UInt256Utils
} from "../../primitives/UInt256.sol";

library AddressToUInt256 {

  // NOTE Should only use language primitives as key pending research on the consistency of using a struct.
  struct Layout {
    mapping(address => UInt256.Layout) value;
  }

}

library AddressToUInt256Utils {

  using AddressToUInt256Utils for AddressToUInt256.Layout;

  bytes32 constant private STRUCT_STORAGE_SLOT = keccak256(type(AddressToUInt256).creationCode);

  function _structSlot() pure internal returns (bytes32 structSlot) {
    structSlot = STRUCT_STORAGE_SLOT
      ^ UInt256Utils._structSlot();
  }

  function _layout( bytes32 salt ) pure internal returns ( AddressToUInt256.Layout storage layout ) {
    bytes32 saltedSlot =
      salt
      ^ AddressToUInt256Utils._structSlot();
    assembly{ layout.slot := saltedSlot }
  }

}