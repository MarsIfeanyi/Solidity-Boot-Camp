// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

// Here we want to build a simple app using the concept of data location

contract SimpleStorage {
    string public text;

    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }
}

//Hint: When you declare storage variables as "public", it automatically creates a getter function
