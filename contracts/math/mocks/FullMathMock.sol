// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import {
  FullMath,
  FullMathUtils
} from "../FullMath.sol";

contract FullMathMock {

  using FullMathUtils for FullMath.Layout;

  function abs(int256 a) external returns (int256 result) {
    result = FullMathUtils._abs(a);
  } 

}