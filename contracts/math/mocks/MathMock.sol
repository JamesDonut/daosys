// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import "contracts/math/Math.sol";

contract MathMock {

    function add(uint256 a, uint256 b) external returns (uint256 result) {
        result = Math.add(a, b);
    }

    function sub(uint256 a, uint256 b) external returns (uint256 result) {
        result = Math.sub(a, b);
    }
/*
    function sub(uint256 a, uint256 b, string errorMessage) external returns (uint256 result) {
        result = Math.sub(a, b, errorMessage);
    }
*/
    function mul(uint256 a, uint256 b) external returns (uint256 result) {
        result = Math.mul(a, b);
    }

    function div(uint256 a, uint256 b) external returns (uint256 result) {
        result = Math.div(a, b);
    }
/*
    function div(uint256 a, uint256 b, string errorMessage) external returns (uint256 result) {
        result = Math.div(a, b, string errorMessage);
    } 
*/
    function mod(uint256 a, uint256 b) external returns (uint256 result) {
        result = Math.mod(a, b);
    }
/*
    function mod(uint256 a, uint256 b, string errorMessage) external returns (uint256 result) {
        result = Math.mod(a, b, string errorMessage);
    } 
*/
    function sqrrt(uint256 a) external returns (uint c) {
        c = Math.sqrrt(a);
    }

    function percentageAmount( uint256 total_, uint256 percentage_) external pure returns ( uint256 percentAmount_ ) {
        return percentAmount_ = Math.percentageAmount(total_, percentage_);
    }

    function substractPercentage( uint256 total_, uint256 percentageToSub_) external pure returns ( uint256 result_ ) {
        return result_ = Math.substractPercentage(total_, percentageToSub_);
    }

    function percentageOfTotal( uint256 part_, uint256 total_ ) external pure returns ( uint256 percent_ ) {
        return percent_ = Math.percentageOfTotal(part_, total_);
    }

    function average( uint256 a, uint256 b ) external pure returns ( uint256 result_ ) {
        return result_ = Math.average(a, b);
    }

    function quadraticPricing( uint256 payment_, uint256 multiplier_ ) external pure returns ( uint256 result_ ) {
        return result_ = Math.quadraticPricing(payment_, multiplier_);
    }

    function bondingCurve( uint256 supply_, uint256 multiplier_ ) external pure returns ( uint256 result_ ) {
        return result_ = Math.bondingCurve(supply_, multiplier_);
    }
}

