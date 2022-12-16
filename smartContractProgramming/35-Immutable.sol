// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * IMMUTABLE
 *
 * with immutable you can create a state variable that is like constant except that you can initialize it when the contract is deployed.
 *
 * Hint: immutable state variable can only be set once when the contract is deployed and you won't be able to change it later on
 *
 * VIP: Just like constant, declaring state variables as immutable you will be able to save some gas
 *
 */

contract Immutable {
    // declaring immutable state variable
    address public immutable owner;

    // Initializing immutable state variable
    constructor() {
        owner = msg.sender;
    }

    uint public x;

    function foo() external view {
        require(msg.sender == owner);
        x + 1;
    }
}
