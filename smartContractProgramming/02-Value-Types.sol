// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ValueTypes {
    /**
     * Data types in solidity is classified into two
     * 1. Values
     * 2. References
     *
     * The values data types stores values eg int,bool.
     * The references do not store a value, they store a reference of where the actual data is stored Eg: Arrays
     *
     */

    bool public b = true;
    uint public u = 123;
    //Hint: Unsighned Integers(uint), support only numbers greater than zero unit = uint256, 0 to 2**256 -1
    // unit8, 0 to 2**8 -1
    //uint16, 0 to 2**16 -1

    int public i = -123;
    //How to find the minimum and maximum int
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xC76F962e24F4345301296Bf111529047ec3cA96E;
    bytes32 public b32 =
        0xc76f962e24f4345301296bf111529047ec3ca96e000000000000000000000000;
}
