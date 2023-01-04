// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * contract A should have a variable called owner and it should be immutable
Set the owner as the person deploying the contract in the constructor
contract A should accept a parameter in its constructor called uint _fee and should be assigned to a variable called FEE
contract B should inherit contract A and pass in the required constructor parameters that A requires

 */

contract A {
    address public immutable owner;
    uint256 public FEE;

    constructor(uint _fee) {
        owner = msg.sender;
        FEE = _fee;
    }
}

contract B is A {
    address public immutable i_owner;

    constructor(uint _fee) A(_fee) {
        i_owner = msg.sender;
    }
}
