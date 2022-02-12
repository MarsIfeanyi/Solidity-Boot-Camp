/*
            Exercise on Constructor in solidity
1. Create a contract called Base which stores full accessible (inside and outside) data upon deployment 
2. Create a contract called Derived which derives the data from base and runs a function that always outputs the data to the integer 10. 
*/

// MY SOLUTION

// constructor is where you keep/put you initialization logic

pragma solidity >=0.7.0 <0.9.0;

contract Base {
    uint256 data;

    constructor(uint256 _data) public {
        data = _data;
    }
}

contract Derived is Base(10) {
    function getData() public view returns (uint256) {
        return data;
    }
}
