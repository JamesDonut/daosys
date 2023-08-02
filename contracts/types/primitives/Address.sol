// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import "contracts/types/primitives/Bytecode.sol";
import {
  UInt256,
  UInt256Utils
} from "contracts/types/primitives/UInt256.sol";
import {
  String,
  StringUtils
 } from "contracts/types/primitives/String.sol";

// import "hardhat/console.sol";

/**
 * @title Library to assist with operations upon address variables.
 * @author various, cyotee doge
 * @dev Attribution to many parties that contributed to the various libraries consolidated into this library.
 */
// TODO Write NatSpec comments.
// TODO Complete unit testinfg for all functions.

/* -------------------------------------------------------------------------- */
/*                             SECTION Address                                */
/* -------------------------------------------------------------------------- */

library Address {

  using Bytecode for address;
  using Address for address;

  struct Layout {
    address value;
  }
  
}

/* -------------------------------------------------------------------------- */
/*                             !SECTION Address                               */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                            SECTION AddressUtils                            */
/* -------------------------------------------------------------------------- */

library AddressUtils {

  bytes32 constant internal STRUCT_STORAGE_SLOT = keccak256(type(Address).creationCode);

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
  function _layout( bytes32 salt ) pure internal returns ( Address.Layout storage layout ) {
    bytes32 saltedSlot = _saltStorageSlot(salt);
    assembly{ layout.slot := saltedSlot }
  }

  function _setValue(
    Address.Layout storage layout,
    address newValue
  ) internal {
    layout.value = newValue;
  }

  function _getValue(
    Address.Layout storage layout
  ) view internal returns (address value) {
    value = layout.value;
  }

  function _wipeValue(
    Address.Layout storage layout
  ) internal {
    delete layout.value;
  }

  function _toString(address account) internal pure returns (string memory) {
    bytes32 value = bytes32(uint256(uint160(account)));
    bytes memory alphabet = '0123456789abcdef';
    bytes memory chars = new bytes(42);

    chars[0] = '0';
    chars[1] = 'x';

    for (uint256 i = 0; i < 20; i++) {
      chars[2 + i * 2] = alphabet[uint8(value[i + 12] >> 4)];
      chars[3 + i * 2] = alphabet[uint8(value[i + 12] & 0x0f)];
    }

    return string(chars);
  }

  function _functionCallWithError(address target, bytes memory data, string memory error) internal returns (bool, bytes memory) {
    return __functionCallWithValue(target, data, 0, error);
  }

  function _calculateDeploymentAddressFromAddress(
      address deployer,
      bytes32 initCodeHash,
      bytes32 salt
    ) pure internal returns (address deploymenAddress) {
    deploymenAddress = address(
      uint160(
        uint256(
          keccak256(
            abi.encodePacked(
              hex'ff',
              deployer,
              salt,
              initCodeHash
            )
          )
        )
      )
    );
  }

    /**
   * @notice Provides consistent encoding of address types.
   * @dev Intended to allow for consistent packed encoding.
   * @param value The address value to be encoded into a bytes array.
   * @return encodedValue The value encoded into a bytes array.
   */
  // TODO Refactor to packed encoding when Address._unmarshall() is refactored to packed decoding.
  function _marshall(
    address value
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
  //TODO it needs a unit test.
  function _asAddress(
    bytes memory value
  ) internal pure returns(address decodedValue ) {
    // TODO Will be tested with manual decoding from "packed" encoding.
    decodedValue = abi.decode(value, (address));
  }

  //TODO it needs a unit test.
  function _asAddressArray(
    bytes memory value
  ) internal pure returns(address[] memory array) {
    array = abi.decode(value, (address[]));
  }
  /*
  function _toString(address account)
  internal pure returns (string memory accountAsString) {
    accountAsString = uint256(uint160(account))._toHexString(20);
  }
*/
  //TODO it needs a unit test.
  function _toBytes32(
    address value
  ) internal pure returns(bytes32 castValue) {
    castValue = bytes32(uint256(uint160(value)));
  }

  /**
   * @dev Merges two array of bytes4. Intended to be used to consilidate the function selectors from a Policy in the array of Gates.
   * @param array1 An array of function bytes4 to be merged with array2.
   * @param array2 An array of function bytes4 to be merged with array1.
   * @return mergedArray The array that will be comprised of the two provided arrays.
   */

  //TODO it needs a unit test.
  function _mergeArrays(
    address[] memory array1,
    address[] memory array2
  ) internal pure returns(address[] memory mergedArray) {
    // Set the return size to the combined length of both provided arrays.
    mergedArray = new address[](array1.length + array2.length);
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

  //TODO it needs a unit test.
  function _appendToArray(
    address[] memory array,
    address value
  ) internal pure returns(address[] memory appendedArray) {
    appendedArray = new address[](array.length + 1);
    for(uint256 cursor = 0; cursor < array.length; cursor++) {
      appendedArray[cursor] = array[cursor];
    }
    appendedArray[array.length] = value;
  }

  function _isContract(address account)
  internal view returns (bool isContract) {
    uint256 size = UInt256Utils._stringToUint256(_toString(account));
    isContract = size > 0;
  }

  function _sendValue(address payable account, uint256 amount)
  internal returns (bool success) { 
    (success, ) = account.call{ value: amount }('');
    require(success, 'Address: failed to send value');
  }

  function _functionCall(address target, bytes memory data)
  internal returns (bytes memory returnData) {
    returnData = _functionCall(target, data, 'Address: failed low-level call');
  }

  function _functionCall(
    address target,
    bytes memory data,
    string memory error
  ) internal returns (bytes memory returnData) {
    returnData = _functionCallWithValue(target, data, 0, error);
  }

  function _functionCallWithValue(
    address target,
    bytes memory data,
    uint256 value
  ) internal returns (bytes memory returnData) {
    returnData = _functionCallWithValue(
      target,
      data,
      value,
      'Address: failed low-level call with value'
    );
  }

  function _functionCallWithValue(
    address target,
    bytes memory data,
    uint256 value,
    string memory error
  ) internal returns (bytes memory returnData) {
    require(
      address(this).balance >= value,
      'Address: insufficient balance for call'
    );
    ( ,returnData) = __functionCallWithValue(target, data, value, error);
  }

  //TODO it needs a unit test.
  function __functionCallWithValue(
    address target,
    bytes memory data,
    uint256 value,
    string memory error
  ) private returns (bool success, bytes memory returnData) {
    require(
      _isContract(target),
      'Address: function call to non-contract'
    );

    (success, returnData) = target.call{ value: value }(data);

    if (success) {
      
    } else if (returnData.length > 0) {
      assembly {
        let returnData_size := mload(returnData)
        revert(add(32, returnData), returnData_size)
      }
    } else {
      revert(error);
    }
  }

  //TODO it needs a unit test.
  function _delegateCall(
    address target,
    bytes memory callData
  ) internal returns(bytes memory returnData) {
    bool result;
    (result, returnData) = target.delegatecall(callData);
    // require(result == true, "Address:_delegateCall:: delegatecall failed");
  }

  //TODO it needs a unit test.
  function _delegateCall(
    address target,
    bytes4 func,
    bytes memory args
  ) internal returns(bytes memory returnData) {
    // console.logBytes4(func);
    // console.logBytes(args);
    bool result;
    (result, returnData) = target.delegatecall(bytes.concat(func, args));
    require(result == true, "Address:_delegateCall:: delegatecall failed");
  }

  //TODO it needs a unit test.
  function _delegateCall(
    address target,
    bytes4 func
  ) internal returns(bytes memory returnData) {
    // console.logBytes4(func);
    // console.logBytes(args);
    bool result;
    (result, returnData) = target.delegatecall(abi.encodeWithSelector(func));
    require(result == true, "Address:_delegateCall:: delegatecall failed");
  }


}

/* -------------------------------------------------------------------------- */
/*                            !SECTION AddressUtils                           */
/* -------------------------------------------------------------------------- */
