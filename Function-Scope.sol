
pragma solidity >= 0.7.0 < 0.9.0;

contract FunctionScope {
    constructor() public {
    }

uint a = 45; // state variable

//local variables supercedes state variable

function addValues() public view returns (uint){
    // all the variables that we write in the function remain localized in the function
    uint a = 2; // local variable
    uint b = 3;
    uint result = a + b;
    return result;
}

function addNewValues() public view returns (uint){
    
    uint a = 1; // local variable
    uint b = 3;
    uint result = a + b;
    return result;
    }
    
}