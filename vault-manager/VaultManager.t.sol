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

    // Commenting out the testAddVault function
    // function testAddVault() public {
    //     uint256 initialVaultsLength = vaultManager.getVaultsLength();
    //     vaultManager.addVault();
    //     uint256 newVaultsLength = vaultManager.getVaultsLength();

    //     assertEq(newVaultsLength, initialVaultsLength + 1, "Vault not added successfully");
    // }

    function testAddVaultWithBounty() public payable {
        uint256 initialVaultsLength = vaultManager.getVaultsLength();
        uint256 bountyAmount = 100;

        vaultManager.addVaultWithBounty{value: bountyAmount}();
        uint256 newVaultsLength = vaultManager.getVaultsLength();
        assertEq(newVaultsLength, initialVaultsLength + 1, "Vault not added successfully with bounty");
    }

    function testGetVault() public {
        // Change this line to use addVaultWithBounty instead
        uint256 vaultId = vaultManager.addVaultWithBounty{value: 100}();
        (address owner, uint256 vaultBalance) = vaultManager.getVault(vaultId);

        assertEq(owner, address(this), "Owner should be the test contract address");
        assertEq(vaultBalance, 100, "Initial balance should be the bounty amount");
    }

    function testGetVaultsLength() public {
        uint256 initialVaultsLength = vaultManager.getVaultsLength();
        vaultManager.addVaultWithBounty{value: 100}();
        uint256 newVaultsLength = vaultManager.getVaultsLength();

        assertEq(newVaultsLength, initialVaultsLength + 1, "Vaults length not updated correctly");
    }

    function testGetMyVaults() public {
        uint256 vaultId = vaultManager.addVaultWithBounty{value: 100}();
        uint256[] memory myVaults = vaultManager.getMyVaults();

        assertEq(myVaults.length, 1, "There should be 1 vault owned by the test contract");
        assertEq(myVaults[0], vaultId, "Incorrect vault ID in getMyVaults result");
    }
}
