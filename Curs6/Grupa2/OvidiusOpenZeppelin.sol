// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OvidiusOpenToken is ERC20 {
    constructor() ERC20("Ovidius Open Token", "OVI") {}
}