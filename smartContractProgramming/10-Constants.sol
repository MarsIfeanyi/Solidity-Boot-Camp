// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Constants {
    /**
     * Hint: When you have a state variable that will not change it is better to declare it as a constant.
     *
     * Hint: Declaring a state varaible as a constant hepls to save gas.
     *
     * For naming convention capitalize the variable name when you declare a state variable as a constant
     */

    // constant state varaible
    address public constant MY_ADDRESS =
        0xC76F962e24F4345301296Bf111529047ec3cA96E;
    uint public constant MY_UINT = 123;
}

contract Var {
    // regular state variable
    address public MY_ADDRESS = 0xC76F962e24F4345301296Bf111529047ec3cA96E;
}

//Hint: Compare the gas cost in both contract
