// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StateVariables {
    /**
     * Hint: There are 3 types of variables in solidity
     * 1. Local - Variables who values are present till function execution
     * 2. Global - Variables used to get information about the blockchain. Hint: Global varaibles are implemented directly in the protocol.
     * 3. State - Varibles whose values are permanently stored in a contract storage
     *
     * VIP: State variables are variables that stores data on the blockchain.
     *
     * VIP: Local varaibles are declared inside the functions and they exist only when the function is executing.
     *
     * Hint: How to declare state variables: State variables are declared inside the contract but outside of functions
     */

    uint public myUint = 123; //State Variable

    function localVar() external pure returns (uint) {
        //local variable
        uint notStateVar = 459;
        return notStateVar;
    }
}
