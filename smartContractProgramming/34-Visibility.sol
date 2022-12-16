// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/***
 *  VISIBILITY: Visbility defines how contracts or other contracts have access to state variables and functions
 *
 * Private - Only inside the contract, that defined it
 * Internal - Only inside the contract and child contracts
 * Public  - Inside and Outside the contract
 * External - Only from outside contract ie it can only be called by other contracts
 */

contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externalFunc() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x + y + z;

        //calling the functions
        privateFunc();
        internalFunc();
        publicFunc();

        // Calling external function... You cannot call external function directly inside the contract that defined it, However by using the "this" keyword you call can it inside the contract that defined it

        this.externalFunc(); // Hint: This is gas inefficient, don't do it.
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        y + z;

        internalFunc();
        publicFunc();
    }
}
