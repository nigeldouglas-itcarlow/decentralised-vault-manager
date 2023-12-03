// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "../src/VaultManager.sol";

contract VaultManagerScript is Script {
    function setUp() public {}

    function run() public {
        VaultManager vm = new VaultManager();
        console2.log("Contract Address:", address(vm));
        console2.log("cast call", address(vm), "--rpc-url local");

        console2.log("cast call", address(vm), "\"addVault()\" --rpc-url local");
        console2.log("cast call", address(vm), "\"getVault()\" --rpc-url local");

        console2.log("cast call", address(vm), "\"deposit()\" --rpc-url local");
        console2.log("cast call", address(vm), "\"withdraw()\" --rpc-url local");

        console2.log("cast call", address(vm), "\"getVaultsLength()\" --rpc-url local");
        console2.log("cast call", address(vm), "\"getMyVaults()\" --rpc-url local");

        console2.log("cast balance", address(vm), "--rpc-url https://rpc.ankr.com/eth_sepolia | cast from-wei");
        console2.log("cast lookup-address", address(vm), "--rpc-url https://rpc.ankr.com/eth_goerli");
    }
}
