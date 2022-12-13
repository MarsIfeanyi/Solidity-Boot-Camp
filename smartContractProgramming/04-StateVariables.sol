// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StateVariables {
    /**
     * Hint: There are 3 types of variables in solidity
     * 1. Local
     * 2. Global
     * 3. State
     *
     * VIP: State variables are variables that store data on the blockchain.
     *
     * VIP: Local varaibles are declared inside the functions and they exist only when the function is executing.
     *
     * Hint: How to declare state variables: State variables are declared inside the contract but outside of functions
     */

    uint public myUint = 123; //State Variable

    function localVar() external pure {
        //local variable
        uint notStateVar = 459;
    }
}
