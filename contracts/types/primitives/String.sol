// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;


/* -------------------------------------------------------------------------- */
/*                             SECTION String                                 */
/* -------------------------------------------------------------------------- */

library String {

  struct Layout {
    string value;
  }

}
/* -------------------------------------------------------------------------- */
/*                             !SECTION String                                */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                             SECTION StringUtils                            */
/* -------------------------------------------------------------------------- */

library StringUtils {

  bytes32 constant internal STRUCT_STORAGE_SLOT = keccak256(type(String).creationCode);

  function _structSlot() pure internal returns (bytes32 structSlot) {
    structSlot = STRUCT_STORAGE_SLOT;
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
  function _layout( bytes32 salt ) pure internal returns ( String.Layout storage layout ) {
    bytes32 saltedSlot = _saltStorageSlot(salt);
    assembly{ layout.slot := saltedSlot }
  }
  
  function _setValue(
    String.Layout storage layout,
    string memory newValue
  ) internal {
    layout.value = newValue;
  }

  function _getValue(
    String.Layout storage layout
  ) view internal returns (string memory value) {
    value = layout.value;
  }

  function _wipeValue(
    String.Layout storage layout
  ) internal {
    delete layout.value;
  }

  /**
   * @notice Provides consistent encoding of address types.
   * @dev Intended to allow for consistent packed encoding.
   * @param value The address value to be encoded into a bytes array.
   * @return encodedValue The value encoded into a bytes array.
   */
  // TODO Refactor to packed encoding when Address._unmarshall() is refactored to packed decoding.
  function _marshall(
    string memory value
  ) internal pure returns(bytes memory encodedValue) {
    // Will be changed to packed encoding 
    encodedValue = abi.encode(value);
  }

  /**
   * @notice Named specific to the decoded type to disambiguate unmarshalling functions between libraries.
   * @notice Expects the value to have been marshalled with this library.
   * @dev Intended to provide consistent usage of packed encoded addressed.
   * @dev Used to minimze data size when working with fixed length types that would not require padding to differentiate.
   * @dev Should NOT be used with other encoding, ABI and otherwise, unless you know what you are doing.
   * @param value The bytes array to be decoded as an address
   * @return decodedValue The decoded address.
   */
  // TODO Refactor to decode packed encoding.
  function _unmarshallAsString(
    bytes memory value
  ) internal pure returns(string memory decodedValue ) {
    // TODO Will be tested with manual decoding from "packed" encoding.
    decodedValue = abi.decode(value, (string));
  }
/**
  function toHexString(uint256 value) internal pure returns (string memory) {
    unchecked {
      return toHexString(value, Math.log256(value) + 1);
    }
  }
*/
    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
/*
  function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
    bytes memory buffer = new bytes(2 * length + 2);
    buffer[0] = "0";
    buffer[1] = "x";
    for (uint256 i = 2 * length + 1; i > 1; --i) {
      buffer[i] = _SYMBOLS[value & 0xf];
      value >>= 4;
    }
    require(value == 0, "Strings: hex length insufficient");
    return string(buffer);
  }
**/
}
/* -------------------------------------------------------------------------- */
/*                            !SECTION StringUtils                            */
/* -------------------------------------------------------------------------- */