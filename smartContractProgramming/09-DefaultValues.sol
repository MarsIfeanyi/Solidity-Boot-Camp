// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DefaultValues {
    /**
     * State variables and Local variables in Solidity have default values. If you don't assign a value to the variable then, it will have the default values
     *
     * Default Values:
     *
     * boolean = false
     * uint = 0
     * int = 0
     * address = 0
     *
     */

    bool public b; // false
    uint public u; // 0
    int public i; // 0
    address public a; //0x0000000000000000000000000000000000000000
    bytes32 public b32; //0x0000000000000000000000000000000000000000000000000000000000000000
}
