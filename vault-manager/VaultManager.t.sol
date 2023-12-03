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

    function testAddVault() public {
        uint256 initialVaultsLength = vaultManager.getVaultsLength();
        vaultManager.addVault();
        uint256 newVaultsLength = vaultManager.getVaultsLength();

        assertEq(newVaultsLength, initialVaultsLength + 1, "Vault not added successfully");
    }

    // function testDeposit() public {
    //    uint256 vaultId = vaultManager.addVault();
    //    (address owner, uint256 initialBalance) = vaultManager.getVault(vaultId);

    //    uint256 depositAmount = 100;

    //    (bool success, ) = payable(address(vaultManager)).call{value: depositAmount}("");
    //    require(success, "Deposit failed");

    //    (address newOwner, uint256 newBalance) = vaultManager.getVault(vaultId);

    //    assertEq(newBalance, initialBalance + depositAmount, "Deposit not processed correctly");
    // }

    // function testWithdraw() public {
    //    uint256 vaultId = vaultManager.addVault();
    //    (address owner, uint256 initialBalance) = vaultManager.getVault(vaultId);

    //    uint256 withdrawAmount = 50;

    //    (bool success, ) = payable(address(vaultManager)).call{value: withdrawAmount}("");
    //    require(success, "Withdrawal failed");

    //    (address newOwner, uint256 newBalance) = vaultManager.getVault(vaultId);

    //    assertEq(newBalance, 0, "Withdraw not processed correctly");
    // }

    function testGetVault() public {
        uint256 vaultId = vaultManager.addVault();
        (address owner, uint256 vaultBalance) = vaultManager.getVault(vaultId);

        assertEq(owner, address(this), "Owner should be the test contract address");
        assertEq(vaultBalance, 0, "Initial balance should be 0");
    }

    function testGetVaultsLength() public {
        uint256 initialVaultsLength = vaultManager.getVaultsLength();
        vaultManager.addVault();
        uint256 newVaultsLength = vaultManager.getVaultsLength();

        assertEq(newVaultsLength, initialVaultsLength + 1, "Vaults length not updated correctly");
    }

    function testGetMyVaults() public {
        uint256 vaultId = vaultManager.addVault();
        uint256[] memory myVaults = vaultManager.getMyVaults();

        assertEq(myVaults.length, 1, "There should be 1 vault owned by the test contract");
        assertEq(myVaults[0], vaultId, "Incorrect vault ID in getMyVaults result");
    }
}
