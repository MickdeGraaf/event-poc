// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {POC} from "../src/POC.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract POCTest is Test {
    POC public poc;
    address public mockToken;

    function setUp() public {
        poc = new POC();
        mockToken = address(poc.erc20Mock());
    }

    function test_POC() public {
        vm.expectEmit(true, true, false, false, address(mockToken));
        emit IERC20.Transfer(address(poc), address(address(this)), 1e18);
        poc.poc(address(this));
    }
}