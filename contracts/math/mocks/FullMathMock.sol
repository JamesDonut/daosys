// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import "contracts/math/FullMath.sol";

contract FullMathMock {

  function abs(int256 a) external pure returns (int256 result) {
    result = FullMath._abs(a);
  } 

}
