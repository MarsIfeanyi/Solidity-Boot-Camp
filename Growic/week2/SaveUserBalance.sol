// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Create a smart contract that saves user balance. The contract should have the functions:

deposit (uint256 amount) this function accepts one argument and it saves the amount a user is depositing into a mapping,
checkBalance() this function searches for the user balance inside the balance mapping and returns the balance of whoever is calling the contract (i.e msg.sender). This function does not accept any arguments.

 */

contract SaveUserBalance {
    //mapping of address to uint256
    mapping(address => uint256) public balances;
    address public owner = msg.sender;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
