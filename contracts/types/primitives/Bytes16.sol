// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

/**
 * @title Library of utility functions for dealing with bytes16 and bytes16[].
 * @author cyotee doge
 */
// TODO Write NatSpec comments.
// TODO Complete unit testinfg for all functions.

/* -------------------------------------------------------------------------- */
/*                               SECTION Bytes32                              */
/* -------------------------------------------------------------------------- */
library Bytes16 {

    struct Layout {
        bytes16 value;
    }

}

/* -------------------------------------------------------------------------- */
/*                              !SECTION Bytes16                              */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                            SECTION Bytes16Utils                            */
/* -------------------------------------------------------------------------- */

library Bytes16Utils {

    bytes32 constant internal STRUCT_STORAGE_SLOT = keccak256(type(Bytes16).creationCode);

    function _structSlot() pure internal returns (bytes32 structSlot) {
        structSlot = STRUCT_STORAGE_SLOT;
    }

    function _saltStorageSlot(
        bytes32 storageSlotSalt
    ) pure internal returns (bytes32 saltedStorageSlot) {
        saltedStorageSlot = storageSlotSalt
            ^_structSlot();   
    }

  /**
   * @notice Could be optimized by having the exposing interface caclulate and store
   *  the storage slot as a constant.
   *  Storage slot is computed during runtime to facilitate development during
   *  standardization.
   */
    function _layout( bytes32 salt ) pure internal returns ( Bytes16.Layout storage layout ) {
        bytes32 saltedSlot = _saltStorageSlot(salt);
        assembly{ layout.slot := saltedSlot }
    }

    function _setValue(
        Bytes16.Layout storage layout,
        bytes16 newValue
    ) internal {
        layout.value = newValue;
    }

    function _getValue(
        Bytes16.Layout storage layout
    ) view internal returns (bytes16 value) {
        value = layout.value;
    }

    function _wipeValue(
        Bytes16.Layout storage layout
    ) internal {
        delete layout.value;
    }


  /**
   * @dev Merges two array of bytes16. Intended to be used to consilidate the function selectors from a Policy in the array of Gates.
   * @param array1 An array of function bytes16 to be merged with array2.
   * @param array2 An array of function bytes16 to be merged with array1.
   * @return mergedArray The array that will be comprised of the two provided arrays.
   */
  function _mergeArrays(
    bytes16[] memory array1,
    bytes16[] memory array2
  ) internal pure returns(bytes16[] memory mergedArray) {
    // Set the return size to the combined length of both provided arrays.
    mergedArray = new bytes16[](array1.length + array2.length);
    // Iterate through the first provided array until the end of the first provided array.
    for(uint256 iteration = 0; iteration < array1.length; iteration++){
      // Set the members of the first provided array as the first members of the merged array.
      mergedArray[iteration] = array1[iteration];
    }
    // Init an iteration counter for stepping through the second provided array.
    uint256 array2Iteration = 0;
    // Iterate through the second provided array until the end of the merged array.
    for(uint256 iteration = array1.length; iteration < mergedArray.length; iteration++){
      // Set the members of the second provided array as the members of the merged array starting after the last member from the first provided array.
      mergedArray[iteration] = array2[array2Iteration];
      // Increment the second provided array iteration counter for stepping through the array.
      array2Iteration++;
    }
  }

  /**
   * @dev Provided pending testing that abi.decode is safe when used with bytes from EXCTCODECOPY through SSTORE2 and SSTORE2Map.
   * @dev Should be able to handle abi.encodePacked() and abi.encode() data as member elements are of fixed length.
   * @dev Should fail if provided data does not contain a value that can be decoded.
   * @param data The raw bytes to be safelty decoded to an address.
   * @return decodedData The safely decoded provided data as an bytes16[]. Returnssbytes16[](0) is provided data is less than 16 bytes.
   */
  function _safeDecodeArray(
    bytes memory data
  ) internal pure returns(bytes16[] memory decodedData) {
    //            Check if data can contain at least one bytes16
    decodedData = (data.length >= 16)
    // If data can contain at least one bytes16 attempt to abi.decode as an bytes16[]
    ? abi.decode(data, (bytes16[]))
    // If data can not contain at least one bytes16 due to insufficient data return bytes16[](0)
    : new bytes16[](0);
  }

}

/* -------------------------------------------------------------------------- */
/*                            !SECTION Bytes16Utils                           */
/* -------------------------------------------------------------------------- */
