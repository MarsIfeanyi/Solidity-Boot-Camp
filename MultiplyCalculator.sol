pragma solidity >= 0.7.0 < 0.9.0;

//Create a function called multiplyCalculator
// Add three parameters to the function a, b and c and set them to integers.
// Grant the function public visibility as well as viewing capability for the IDE
// Return an integer for the function 
// Create a variable result that contains the logic to multiply a, b and c
// Return the result
// Compile and deploy your DApp and test out the result.

contract Calculator {
    constructor() public{
    }

    function MultiplyCalculator(uint a, uint b, uint c) public view returns(uint){
        uint result = a * b * c;
        return result;
    }
}