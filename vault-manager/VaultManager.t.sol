// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/VaultManager.sol";

contract VaultManagerTest is Test {
    VaultManager public vaultManager;
    address public alice;

    function setUp() public {
        vaultManager = new VaultManager();
        alice = makeAddr("Alice");
    }

    function testInitial() public {
        uint256 vaultsLength = vaultManager.getVaultsLength();
        assertEq(vaultsLength, 0);
    }

    // Add more test cases as needed
}
