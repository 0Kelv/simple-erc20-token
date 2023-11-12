// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {SimpleToken} from "../src/SimpleToken.sol";

contract SimpleTokenTest is Test {
    SimpleToken public token;

    function setUp() public {
        token = new SimpleToken(msg.sender);
    }

    function test_Mint() public {
        vm.startPrank(msg.sender);
        assertEq(token.balanceOf(msg.sender), 0);
        token.mint(msg.sender, 777 * (10 ** 18));
        assertEq(token.balanceOf(msg.sender), 777 * (10 ** 18));
        vm.stopPrank();
    }
}
