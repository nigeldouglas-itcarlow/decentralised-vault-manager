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

    function testInitial() public {
        uint256 tasksLength = taskManager.getTasksLength();
        assertEq(tasksLength, 0);
    }

    function testSingleTask() public {
        vm.prank(alice);
        taskManager.addTask("foo", TaskManager.Status.Todo);
        uint256 tasksLength = taskManager.getTasksLength();
        assertEq(tasksLength, 1);

        (string memory name, TaskManager.Status status, address owner) = taskManager.getTask(0);
        assertEq(name, "foo");
        assertTrue(status == TaskManager.Status.Todo);
        assertEq(owner, alice);

        vm.prank(alice);
        taskManager.updateStatus(0, TaskManager.Status.Doing);
        (, TaskManager.Status updatedStatus,) = taskManager.getTask(0);
        assertTrue(updatedStatus == TaskManager.Status.Doing);

        vm.prank(bob);
        vm.expectRevert(Unauthorised.selector);
        taskManager.updateStatus(0, TaskManager.Status.Todo);
    }

    function testMultipleTasks() public {
        vm.prank(alice);
        taskManager.addTask("foo", TaskManager.Status.Todo);
        vm.prank(bob);
        taskManager.addTask("bar", TaskManager.Status.Canceled);
        vm.prank(alice);
        taskManager.addTask("baz", TaskManager.Status.Done);

        uint256 tasksLength = taskManager.getTasksLength();
        assertEq(tasksLength, 3);

        vm.prank(alice);
        uint256[] memory aliceTasks = taskManager.getMyTasks();
        uint256 aliceTasksLength = aliceTasks.length;
        assertEq(aliceTasksLength, 2);

        vm.prank(bob);
        uint256[] memory bobTasks = taskManager.getMyTasks();
        uint256 bobTasksLength = bobTasks.length;
        assertEq(bobTasksLength, 1);
    }
}
