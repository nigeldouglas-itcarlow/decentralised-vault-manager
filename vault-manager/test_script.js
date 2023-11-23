// test_script.js
const { deployContract, executeScript } = require("@openzeppelin/cli");
const { readNetworkConfig } = require("@openzeppelin/cli/utils");
const { toWad } = require("@openzeppelin/test-helpers");

module.exports = async function ({ network, ethers }) {
  console.log("Running test script...");

  const { signer } = await readNetworkConfig({ network }, { ethers });

  // Deploy VaultManager
  const vaultManager = await deployContract({
    from: signer,
    name: "VaultManager",
    args: [],
  });

  console.log("VaultManager deployed at:", vaultManager.address);

  // Your test logic can be included in the run() function
  run: async () => {
    // Add your test logic here
    // ...
  };

  console.log("Test script complete.");
};
