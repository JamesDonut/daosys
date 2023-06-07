// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.0 (utils/math/SafeMath.sol)
pragma solidity ^0.8.0;

import {
  SafeMath,
  SafeMathUtils
} from "../SafeMath.sol";

contract SafeMath {

    using SafeMathUtils for SafeMath.Layout;

    function tryAdd(uint256 a, uint256 b) external returns ( bool boolean, uint256 number ) {
        boolean, number = SafeMathUtils.tryAdd(a, b);
    }

    function trySub(uint256 a, uint256 b) external returns ( bool boolean, uint256 number ) {
        boolean, number = SafeMathUtils.trySub(a, b);
    }

    function tryMul(uint256 a, uint256 b) external returns ( bool boolean, uint256 number ) {
        boolean, number = SafeMathUtils.tryMul(a, b);
    }

    function tryDiv(uint256 a, uint256 b) external returns ( bool boolean, uint256 number ) {
        boolean, number = SafeMathUtils.tryDiv(a, b);
    }

    function tryMod(uint256 a, uint256 b) external returns ( bool boolean, uint256 number ) {
        boolean, number = SafeMathUtils.tryMod(a, b);
    }

    function add(uint256 a, uint256 b) external returns (uint256) {
        return SafeMathUtils.add(a, b);
    }

    function sub(uint256 a, uint256 b) external returns (uint256) {
        return SafeMathUtils.sub(a, b);
    }

    function mul(uint256 a, uint256 b) external returns (uint256) {
        return SafeMathUtils.mul(a, b);
    }

    function div(uint256 a, uint256 b) external returns (uint256) {
        return SafeMathUtils.div(a, b);
    }

    function mod(uint256 a, uint256 b) external returns (uint256) {
        return SafeMathUtils.mod(a, b);
    }

    function sub( uint256 a, uint256 b, string memory errorMessage ) external returns (uint256) {
        return SafeMathUtils.sub(a, b, errorMessage);
    }

    function div( uint256 a, uint256 b, string memory errorMessage ) external returns (uint256) {
        return SafeMathUtils.div(a, b, errorMessage);
    }

    function mod( uint256 a, uint256 b, string memory errorMessage ) external returns (uint256) {
        return SafeMathUtils.mod(a, b, errorMessage);
    }
}
