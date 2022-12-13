// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

// Mapping
// How to declare a mapping (simple and nested)
// Set, get, deleted

/**
 * Hint: Mapping is like a dictionary in python, it allows for easy lookup
 * mapping is a key-value pairs
 *
 * mapping(keyType => valueType) mappingName
 */

contract Mapping {
    mapping(address => uint) public balances; //Thus with the address as key, you can quickly lookup the balance of the address

    // Nested Mapping
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // Setting keys to ceratin values.
        balances[msg.sender] = 123;

        // Getting values from mapping
        uint bal = balances[msg.sender]; // gets the balance of msg.sender(ie the address that deployed the contract)

        // Getting the values for mapping we have not set yet
        uint bal2 = balances[address(1)]; // Return the default value ie 0

        // Updating mapping
        balances[msg.sender] += 456; // 123 + 456

        // Clearing the value stored in a mapping
        delete balances[msg.sender]; // Resets it to the default value ie 0

        isFriend[msg.sender][address(this)] = true;
    }
}
