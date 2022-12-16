// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * PAYABLE
 *
 * The "payable" keyword adds functionality to send and recieve ether.
 *
 * Hint: By declaring an address or function as payable, then it will be able to Send and Recieve ether.
 */

contract Payable {
    address payable public owner; //Hint: The "payable" keyword should immediately after the type ie address

    constructor() {
        //Hint: since owner is of type address payable and  msg.sender is of type address, then you need to call payable() on msg.sender, this converts them to the same type
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    // helper function to get the balance

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
