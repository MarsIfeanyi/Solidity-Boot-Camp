// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Constrcutors are special functions that is only called once, when the smart contract is deployed.
 * Hint: Constructor is mainly used to initialize the state variables.
 * VIP: The constructor is only called once when we deployed the contract.
 */

contract Constructor {
    //State variables
    address public owner;
    uint public x;

    //Initializing the state variables
    constructor(uint _x) {
        owner = msg.sender; //the deployer of the contract
        x = _x;
    }
}
