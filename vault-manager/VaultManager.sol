// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VaultManager {
    // Vault struct
    struct Vault {
        uint256 id;
        address owner;
        uint256 balance;
    }

    // Vaults array
    Vault[] public vaults;

    // Mapping to track vaults by owner
    mapping(address => uint256[]) public vaultsByOwner;

    // Events
    event VaultAdded(uint256 id, address owner);
    event VaultDeposit(uint256 id, address owner, uint256 amount);
    event VaultWithdraw(uint256 id, address owner, uint256 amount);

    // Modifier to ensure only the owner can perform certain operations
    modifier onlyOwner(uint256 _vaultId) {
        require(vaults[_vaultId].owner == msg.sender, "Unauthorized");
        _;
    }

    // Function to add a new vault with a bounty
    function addVaultWithBounty() payable public returns (uint256 vaultIndex) {
        require(msg.value > 0, "Bounty amount must be greater than 0");

        Vault memory newVault = Vault({
            id: vaults.length,
            owner: msg.sender,
            balance: 0
        });

        vaults.push(newVault);
        vaultIndex = vaults.length - 1;
        vaultsByOwner[msg.sender].push(vaultIndex);

        // Update the bounty for the new vault
        vaults[vaultIndex].balance += msg.value;

        emit VaultAdded(vaultIndex, msg.sender);
        emit VaultDeposit(vaultIndex, msg.sender, msg.value);
    }

    // Function to deposit into a vault
    function deposit(uint256 _vaultId) public onlyOwner(_vaultId) payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        vaults[_vaultId].balance += msg.value;

        emit VaultDeposit(_vaultId, msg.sender, msg.value);
    }

    // Function to withdraw from a vault
    function withdraw(uint256 _vaultId, uint256 _amount) public onlyOwner(_vaultId) {
        require(_amount > 0 && _amount <= vaults[_vaultId].balance, "Invalid withdrawal amount");

        vaults[_vaultId].balance -= _amount;

        // Transfer Ether to the owner
        payable(msg.sender).transfer(_amount);

        emit VaultWithdraw(_vaultId, msg.sender, _amount);
    }

    // Function to get information about a specific vault
    function getVault(uint256 _vaultId) public view returns (address owner, uint256 balance) {
        owner = vaults[_vaultId].owner;
        balance = vaults[_vaultId].balance;
    }

    // Function to get the number of vaults
    function getVaultsLength() public view returns (uint256) {
        return vaults.length;
    }

    // Function to get the vault IDs owned by the caller
    function getMyVaults() public view returns (uint256[] memory) {
        return vaultsByOwner[msg.sender];
    }
}
