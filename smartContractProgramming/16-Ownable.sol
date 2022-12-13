// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Here we want to build an App that covers:
 * 1. state variables
 * 2. global variables
 * 3. function modifiers
 * 4. function
 * 5. error hadling
 * This App will allow you to claim ownership of the contract...This is a simple contract where we can associate ownership to the contract and also controls who get to call the functions.
 */

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid Address");
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {
        // code
    }

    function anyOneCanCall() external {
        // code
    }
}
