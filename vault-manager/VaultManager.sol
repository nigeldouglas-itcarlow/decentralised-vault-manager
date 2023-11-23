// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VaultManager {
    struct Vault {
        address owner;
        uint256 balance;
    }

    Vault[] public vaults;
    mapping(address => uint256[]) public vaultsByOwner;

    event VaultAdded(uint256 indexed id, address owner);
    event VaultDeposit(uint256 indexed id, address owner, uint256 amount);
    event VaultWithdraw(uint256 indexed id, address owner, uint256 amount);

    modifier onlyOwner(uint256 vaultId) {
        require(msg.sender == vaults[vaultId].owner, "Not the owner");
        _;
    }

    function addVault() public returns (uint256 vaultIndex) {
        Vault memory newVault = Vault(msg.sender, 0);
        vaultIndex = vaults.length;
        vaults.push(newVault);
        vaultsByOwner[msg.sender].push(vaultIndex);

        emit VaultAdded(vaultIndex, msg.sender);
    }

    function deposit(uint256 vaultId) public payable onlyOwner(vaultId) {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        vaults[vaultId].balance += msg.value;

        emit VaultDeposit(vaultId, msg.sender, msg.value);
    }

    function withdraw(uint256 vaultId, uint256 amount) public onlyOwner(vaultId) {
        require(amount > 0 && amount <= vaults[vaultId].balance, "Invalid withdrawal amount");

        vaults[vaultId].balance -= amount;
        payable(msg.sender).transfer(amount);

        emit VaultWithdraw(vaultId, msg.sender, amount);
    }

    function getVault(uint256 vaultId) public view returns (address owner, uint256 balance) {
        owner = vaults[vaultId].owner;
        balance = vaults[vaultId].balance;
    }

    function getVaultsLength() public view returns (uint256) {
        return vaults.length;
    }

    function getMyVaults() public view returns (uint256[] memory) {
        return vaultsByOwner[msg.sender];
    }
}
