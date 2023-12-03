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
    }
}
