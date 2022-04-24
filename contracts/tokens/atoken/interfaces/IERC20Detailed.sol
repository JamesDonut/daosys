// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.8.9;

import {IERC20} from "../../erc20/interfaces/IERC20.sol";

interface IERC20Detailed is IERC20 {
  function name() external view returns (string memory);

  function symbol() external view returns (string memory);

  function decimals() external view returns (uint8);
}