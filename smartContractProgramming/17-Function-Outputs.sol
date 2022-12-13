// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Return multiple outputs
// Named Outputs
// Destructuring Assignment

contract FunctionOutputs {
    //returning many output... unamed outputs
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    //returning named outputs
    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    //using destructuring assignment
    function destructuringAssigments() public pure {
        (uint x, bool b) = returnMany();

        //When you are interested in only one parameter
        (, bool _b) = returnMany();
    }
}
