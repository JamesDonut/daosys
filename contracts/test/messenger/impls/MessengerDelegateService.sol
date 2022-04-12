// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0;

import {
  DelegateService,
  IDelegateService,
  DelegateServiceInternal
} from "contracts/service/delegate/DelegateService.sol";
import {
  Messenger,
  IMessenger
} from "contracts/test/messenger/Messenger.sol";

contract MessengerDelegateService
  is
  Messenger,
  DelegateService
{

  constructor() {
    _setServiceDef
  }
}