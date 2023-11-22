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

    // events: these get fired when special things happen
    event TaskAdded(uint256 id, string name, Status status, address owner);

    modifier onlyOwner (uint256 _taskId) {
        if (tasks[_taskId].owner != msg.sender) {
            revert Unauthorised();
        }

        _; // execute the function
    }

    // Adds a new task to the task manager.  You need to provide the
    // name and status of the tasks.  The owner will be set to the
    // creator of the Ethereum transaction.  Returns the unique ID of
    // the task.
    function addTask(string memory _name, Status _status) public returns (uint256 taskId) {
        // 1. Create the task.
        Task memory task = Task({
            name: _name,
            status: _status,
            owner: msg.sender
        });

        // 2. Add the task to the tasks array.
        tasks.push(task);

        // 3. Return the ID of the newly created task.
        taskId = tasks.length - 1;

        // 4. Add the task to the tasksByOwner mapping.
        tasksByOwner[msg.sender].push(taskId);

        // 5. Fire the TaskAdded event.
        emit TaskAdded(taskId, _name, _status, msg.sender);
    }

    // Changes the status of a task.  You need to provide the ID of
    // the task, and the new status.  Only the owner of a task can
    // change the status of the task.  Returns nothing.
    function updateStatus(uint256 _taskId, Status _status) public onlyOwner(_taskId) {
        tasks[_taskId].status = _status;
    }

    // You need to provide the ID of the task.  Returns the name,
    // status, and owner of the task.
    function getTask(uint256 _taskId) public view returns (string memory name, Status
                                                           status, address owner) {
        name = tasks[_taskId].name;
        status = tasks[_taskId].status;
        owner = tasks[_taskId].owner;
    }

    // Returns the number of tasks in the system.
    function getTasksLength() public view returns (uint256) {
        return tasks.length;
    }

    // Returns the IDs of the tasks for which you are the owner.
    function getMyTasks() public view returns (uint256[] memory) {
        return tasksByOwner[msg.sender];
    }
}
