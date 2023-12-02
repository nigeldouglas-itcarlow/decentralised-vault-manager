// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

error Unauthorised();

contract TaskManager {
    enum Status {Todo, Doing, Done, Canceled}

    struct Task {
        string name;
        Status status;
        address owner;
    }

    Task[] public tasks;

    // tasksByOwner:
    // 0x3521678 -> [0]
    // 0xf6adf88 -> [1, 3]
    // 0x345627a -> [2]
    mapping (address => uint256[]) public tasksByOwner;

    event TaskAdded(uint256 id, string name, Status status, address owner);

    modifier onlyOwner (uint256 _taskId) {
        if (tasks[_taskId].owner != msg.sender) {
            revert Unauthorised();
        }

        _;
    }

    function addTask(string memory _name, Status _status) public returns (uint256 taskId) {

        Task memory task = Task({
            name: _name,
            status: _status,
            owner: msg.sender
        });

        tasks.push(task);
        taskId = tasks.length - 1;
        tasksByOwner[msg.sender].push(taskId);
        emit TaskAdded(taskId, _name, _status, msg.sender);
    }

    function updateStatus(uint256 _taskId, Status _status) public onlyOwner(_taskId) {
        tasks[_taskId].status = _status;
    }

    function getTask(uint256 _taskId) public view returns (string memory name, Status
                                                           status, address owner) {
        name = tasks[_taskId].name;
        status = tasks[_taskId].status;
        owner = tasks[_taskId].owner;
    }

    function getTasksLength() public view returns (uint256) {
        return tasks.length;
    }

    function getMyTasks() public view returns (uint256[] memory) {
        return tasksByOwner[msg.sender];
    }
}
