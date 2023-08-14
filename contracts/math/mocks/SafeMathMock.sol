// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.0 (utils/math/SafeMath.sol)
pragma solidity ^0.8.0;

import "contracts/math/SafeMath.sol";

contract SafeMathMock {

    function tryAdd(uint256 a, uint256 b) external pure returns ( bool boolean, uint256 number ) {
        (boolean, number) = SafeMath.tryAdd(a, b);
    }

    function trySub(uint256 a, uint256 b) external pure returns ( bool boolean, uint256 number ) {
        (boolean, number) = SafeMath.trySub(a, b);
    }

    function tryMul(uint256 a, uint256 b) external pure returns ( bool boolean, uint256 number ) {
        (boolean, number) = SafeMath.tryMul(a, b);
    }

    function tryDiv(uint256 a, uint256 b) external pure returns ( bool boolean, uint256 number ) {
        (boolean, number) = SafeMath.tryDiv(a, b);
    }

    function tryMod(uint256 a, uint256 b) external pure returns ( bool boolean, uint256 number ) {
        (boolean, number) = SafeMath.tryMod(a, b);
    }

    function add(uint256 a, uint256 b) external pure returns (uint256) {
        return SafeMath.add(a, b);
    }

    function sub(uint256 a, uint256 b) external pure returns (uint256) {
        return SafeMath.sub(a, b);
    }

    function mul(uint256 a, uint256 b) external pure returns (uint256) {
        return SafeMath.mul(a, b);
    }

    function div(uint256 a, uint256 b) external pure returns (uint256) {
        return SafeMath.div(a, b);
    }

    function mod(uint256 a, uint256 b) external pure returns (uint256) {
        return SafeMath.mod(a, b);
    }

    function subError( uint256 a, uint256 b, string memory errorMessage ) external pure returns (uint256) {
        return SafeMath.subError(a, b, errorMessage);
    }

    function divError( uint256 a, uint256 b, string memory errorMessage ) external pure returns (uint256) {
        return SafeMath.divError(a, b, errorMessage);
    }

    function modError( uint256 a, uint256 b, string memory errorMessage ) external pure returns (uint256) {
        return SafeMath.modError(a, b, errorMessage);
    }
}
