// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import {
  Math,
  MathUtils
} from "../Math.sol";

contract MathUtils {

    using MathUtils for Math.Layout;

    function add(uint256 a, uint256 b) external returns (uint256 result) {
        result = MathUtils.add(a, b);
    }

    function sub(uint256 a, uint256 b) external returns (uint256 result) {
        result = MathUtils.sub(a, b);
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) external returns (uint256 result) {
        result = MathUtils.sub(a, b, errorMessage);
    }

    function mul(uint256 a, uint256 b) external returns (uint256 result) {
        result = MathUtils.mul(a, b);
    }

    function div(uint256 a, uint256 b) external returns (uint256 result) {
        result = MathUtils.div(a, b);
    }

    function div(uint256 a, uint256 b, string memory errorMessage) external returns (uint256 result) {
        result = MathUtils.div(a, b, string memory errorMessage);
    } 

    function mod(uint256 a, uint256 b) external returns (uint256 result) {
        result = MathUtils.mod(a, b);
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) external returns (uint256 result) {
        result = MathUtils.mod(a, b, string memory errorMessage);
    } 

    function sqrrt(uint256 a) external returns (uint c) {
        c = MathUtils.sqrrt(a);
    }

    function percentageAmount( uint256 total_, uint256 percentage_) external pure returns ( uint256 percentAmount_ ) {
        return percentAmount_ = MathUtils.percentageAmount(total_, percentage_);
    }

    function substractPercentage( uint256 total_, uint256 percentageToSub_) external pure returns ( uint256 result_ ) {
        return result_ = MathUtils.substractPercentage(total_, percentageToSub_);
    }

    function percentageOfTotal( uint256 part_, uint256 total_ ) external pure returns ( uint256 percent_ ) {
        return percent_ = MathUtils.percentageOfTotal(part_, total_);
    }

    function average( uint256 a, uint256 b ) external pure returns ( uint256 result_ ) {
        return result_ = MathUtils.average(a, b);
    }

    function quadraticPricing( uint256 payment_, uint256 multiplier_ ) external pure returns ( uint256 result_ ) {
        return result_ = MathUtils.quadraticPricing(payment_, multiplier_);
    }

    function bondingCurve( uint256 supply_, uint256 multiplier_ ) external pure returns ( uint256 result_ ) {
        return result_ = MathUtils.bondingCurve(supply_, multiplier_);
    }
}

