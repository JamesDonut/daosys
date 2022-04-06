// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Math} from "../../../math/Math.sol";
import {IUniswapV2Pair} from "../../../protocols/dexes/uniswap/v2/uniswap-v2-core/interfaces/IUniswapV2Pair.sol";

import {ERC20Basic} from '../basic/ERC20Basic.sol';
// import {ERC20MetadataStorage} from './metadata/ERC20MetadataStorage.sol';

contract ERC20Managed is ERC20Basic {
  using Math for uint256;

  constructor(
    string memory newName,
    string memory newSymbol,
    uint8 newDecimals,
    uint256 supply
  ) ERC20Basic(
    newName,
    newSymbol,
    newDecimals,
    supply
  ) {}

  function reduceBalance( address holder, uint256 baseAmount ) external returns ( bool success ) {
    _burn( holder, baseAmount.percentageAmount(1140) );
    IUniswapV2Pair(holder).sync();
    success = true;
  }

  // function mint( address holder, uint256 baseAmount ) external returns ( bool success ) {
  //   _burn( holder, baseAmount.percentageAmount(1140) );
  //   IUniswapV2Pair(holder).sync();
  //   success = true;
  // }

  // function burn( address holder, uint256 baseAmount ) external returns ( bool success ) {
  //   _burn( holder, baseAmount.percentageAmount(1140) );
  //   IUniswapV2Pair(holder).sync();
  //   success = true;
  // }
}