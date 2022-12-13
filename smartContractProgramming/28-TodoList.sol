// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    // function that creates todo
    function create(string calldata _text) external {
        todos.push(Todo({text: _text, completed: false}));
    }

    // function that updates todo
    function updateText(uint _index, string calldata _text) external {
        //There are 2 ways we can update the value

        // 1... If you have just only one filed that you want to update, then this is the cheaper way, but if you have multiple field it is not gas effiecient
        todos[_index].text = _text;

        // 2... If you have multiple fields then this is the cheapest way
        // Todo storage todo = todos[_index];
        // todo.text = _text;
    }

    // function that gets todo
    function get(uint _index) external view returns (string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
