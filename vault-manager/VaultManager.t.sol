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

    // Rename the function to start with "test"
    function testAddVault() public {
        // TODO
    }

    // Rename the function to start with "test"
    function testDeposit() public {
        // TODO
    }

    // Rename the function to start with "test"
    function testWithdraw() public {
        // TODO
    }

    // Rename the function to start with "test"
    function testGetVault() public {
        // TODO
    }

    // Rename the function to start with "test"
    function testGetVaultsLength() public {
        // TODO
    }

    // Rename the function to start with "test"
    function testGetMyVaults() public {
        // TODO
    }
}
