// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Todo {
    uint256 todoId;

    struct Task{
        uint256 id;
        string item;
        bool completed;
    }

    Task[] public tasks;

    function addTodo(string memory _item) public{
        tasks.push(Task(todoId, _item, false));
        todoId++;
    }

    function viewTask(uint256 _todoId) public view returns(string memory, bool){
        require(_todoId < tasks.length, "Index out of bounds");
        Task memory item = tasks[_todoId];
        return(item.item, item.completed);
    }

    function updateTask(uint256 _todoId, string memory _item, bool _completed) public {
        require(_todoId < tasks.length, "Index out of bounds");
        Task storage todo = tasks[_todoId];
        todo.item = _item;
        todo.completed = _completed;
    }

    function deleteTask(uint256 _todoId) public{
        require(_todoId < tasks.length, "Index out of bounds");
        tasks[_todoId] = tasks[tasks.length-1];
        tasks.pop();

        // the above code will make the array unordered.
        // To get the result in ordered
        // for(uint256 i=_todoId; i< tasks.length-1;i++){
        //     tasks[_todoId] = tasks[_todoId+1];
        // }
        // tasks.pop();
    }
        
}
