// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FunctionIntro {
    //function that adds two numbers
    function addNumbers(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function subtractNumbers(uint x, uint y) external pure returns (uint) {
        return x - y;
    }
}

//external means that the function is called outside
// pure means read only, it does write anything to the blockchain
//Hint: you define the type of the return output as well
