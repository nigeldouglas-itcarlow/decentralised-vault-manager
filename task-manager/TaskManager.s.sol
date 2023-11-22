// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TaskManager.sol";

contract TaskManagerTest is Test {
    TaskManager public taskManager;
    address public alice;
    address public bob;

    function setUp() public {
        taskManager = new TaskManager();
        alice = makeAddr("Alice");
        bob = makeAddr("Bob");
    }

    function run() public { // Implement the run function
        testInitial();
        testSingleTask();
        testMultipleTasks();
    }

    function testInitial() public {
        // TODO
    }

    function testSingleTask() public {
        // TODO
    }

    function testMultipleTasks() public {
        // TODO
    }
}
