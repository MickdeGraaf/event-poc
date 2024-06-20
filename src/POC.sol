// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";

contract POC {
    
    ERC20Mock public erc20Mock;

    constructor() {
        erc20Mock = new ERC20Mock();
        erc20Mock.mint(address(this), 1e18);
    }

    function poc(address to) public {
        address(this).call(abi.encodeWithSelector(this.fakeTransfer.selector, to));
    }

    function fakeTransfer(address to) public {
        erc20Mock.transfer(to, 1e18);
        revert();
    }
}