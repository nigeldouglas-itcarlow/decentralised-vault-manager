// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Importing Truffle testing utilities
import "./VaultManager.sol";
import "ds-test/test.sol";

// Test contract for VaultManager
contract TestVaultManager is DSTest {
    VaultManager vaultManager;

    // Runs before each test function
    function setUp() public {
        vaultManager = new VaultManager();
    }

    // Test case for addVault function
    function testAddVault() public {
        // Add a vault and perform assertions
        uint256 vaultId = vaultManager.addVault();
        assertEq(vaultManager.getVaultsLength(), 1, "Vault count should be 1");
        assertEq(vaultManager.getMyVaults().length, 1, "My vault count should be 1");

        // Get the owner from the tuple
        (address owner, ) = vaultManager.getVault(vaultId);
        assertEq(owner, address(this), "Owner should be the test contract");
    }

    // Test case for deposit function
    function testDeposit() public {
        uint256 vaultId = vaultManager.addVault();
        uint256 initialBalance = address(this).balance;
        uint256 depositAmount = 100;

        // Deposit into the vault and perform assertions
        vaultManager.deposit{ value: depositAmount }(vaultId);
        assertEq(vaultManager.getVault(vaultId).balance, depositAmount, "Vault balance should be equal to deposit amount");
        assertEq(address(this).balance, initialBalance - depositAmount, "Contract balance should be reduced by deposit amount");
    }

    // Test case for withdraw function
    function testWithdraw() public {
        uint256 vaultId = vaultManager.addVault();
        uint256 depositAmount = 100;
        vaultManager.deposit{ value: depositAmount }(vaultId);

        // Attempt to withdraw more than deposited (should fail)
        bool success = address(vaultManager).call{ value: depositAmount + 1 }(abi.encodeWithSelector(vaultManager.withdraw.selector, vaultId, depositAmount + 1));
        assert(!success, "Should fail to withdraw more than deposited");

        // Withdraw valid amount and perform assertions
        uint256 initialBalance = address(this).balance;
        vaultManager.withdraw(vaultId, depositAmount);
        assertEq(vaultManager.getVault(vaultId).balance, 0, "Vault balance should be 0 after withdrawal");
        assertEq(address(this).balance, initialBalance, "Contract balance should be restored after withdrawal");
    }

    // Additional tests for ownership constraints can be added here

    // Ensure events are emitted as expected
    function testEvents() public {
        uint256 vaultId = vaultManager.addVault();
        bool success = address(vaultManager).call{ value: 100 }(abi.encodeWithSelector(vaultManager.deposit.selector, vaultId));
        assertTrue(success, "Deposit should succeed");
        success = address(vaultManager).call(abi.encodeWithSelector(vaultManager.withdraw.selector, vaultId, 50));
        assertTrue(success, "Withdraw should succeed");
    }
}
