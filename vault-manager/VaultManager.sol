// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VaultManager {
    // Struct to represent a vault, containing owner's address and balance
    struct Vault {
        address owner;
        uint256 balance;
    }

    // Array to store all vaults
    Vault[] public vaults;
    // Mapping to store the IDs of vaults owned by each address
    mapping(address => uint256[]) public vaultsByOwner;

    // Events to log important actions
    event VaultAdded(uint256 indexed id, address owner);
    event VaultDeposit(uint256 indexed id, address owner, uint256 amount);
    event VaultWithdraw(uint256 indexed id, address owner, uint256 amount);

    // Modifier to restrict functions to only the owner of a specific vault
    modifier onlyOwner(uint256 vaultId) {
        require(msg.sender == vaults[vaultId].owner, "Not the owner");
        _;
    }

    // Function to create a new vault and add it to the manager
    function addVault() public returns (uint256 vaultIndex) {
        // Create a new vault with the caller's address as the owner
        Vault memory newVault = Vault(msg.sender, 0);
        // Get the index of the new vault
        vaultIndex = vaults.length;
        // Add the new vault to the array
        vaults.push(newVault);
        // Store the ID of the new vault for the owner's address
        vaultsByOwner[msg.sender].push(vaultIndex);

        // Emit an event to log the addition of a new vault
        emit VaultAdded(vaultIndex, msg.sender);
    }

    // Function to deposit funds into a specific vault
    function deposit(uint256 vaultId) public payable onlyOwner(vaultId) {
        // Require that the deposit amount is greater than 0
        require(msg.value > 0, "Deposit amount must be greater than 0");

        // Update the vault's balance with the deposited amount
        vaults[vaultId].balance += msg.value;

        // Emit an event to log the deposit action
        emit VaultDeposit(vaultId, msg.sender, msg.value);
    }

    // Function to withdraw funds from a specific vault
    function withdraw(uint256 vaultId, uint256 amount) public onlyOwner(vaultId) {
        // Require that the withdrawal amount is valid
        require(amount > 0 && amount <= vaults[vaultId].balance, "Invalid withdrawal amount");

        // Update the vault's balance and transfer the funds to the owner
        vaults[vaultId].balance -= amount;
        payable(msg.sender).transfer(amount);

        // Emit an event to log the withdrawal action
        emit VaultWithdraw(vaultId, msg.sender, amount);
    }

    // Function to get information about a specific vault
    function getVault(uint256 vaultId) public view returns (address owner, uint256 balance) {
        // Return the owner's address and balance of the specified vault
        owner = vaults[vaultId].owner;
        balance = vaults[vaultId].balance;
    }

    // Function to get the total number of vaults in the manager
    function getVaultsLength() public view returns (uint256) {
        // Return the length of the vaults array
        return vaults.length;
    }

    // Function to get the IDs of vaults owned by the caller's address
    function getMyVaults() public view returns (uint256[] memory) {
        // Return the array of vault IDs owned by the caller
        return vaultsByOwner[msg.sender];
    }

    // Function to be used as a placeholder for any main logic needed in a Forge script
    function run() public {
        // Placeholder for any main logic needed in Forge script
        // You can deploy contracts or interact with existing contracts here
    }
}
