// Solidity program to demonstrate
// creating a constructor
pragma solidity ^0.8.0;

/**
 * Facts
The constructor is used to initialize the state of a smart contract.
The constructor is only invoked once during the deployment of a smart contract.
The constructor is optional and If one is not defined the compiler will create a default one.
After a constructor code is executed, the final code is deployed to the blockchain. This code includes public functions and code reachable through public functions. Constructor code or any internal method used only by constructor are not included in final code.

 */

// Creating a contract
contract Constructor {
    // Declaring state variable
    string str;
    uint supply;

    // Creating a constructor
    // to set value of 'str'
    constructor() {
        str = "Growic";
        supply = 7777777;
    }

    // Defining function to
    // return the value of 'str'
    function getValue() public view returns (string memory) {
        return str;
    }

    function getSupply() public view returns (uint) {
        return supply;
    }
}

contract Constructor2 {
    // Declaring state variable
    string str;
    uint supply;

    // Creating a constructor
    // Example passing values during the deployment

    constructor(string memory _str, uint _supply) {
        str = _str;
        supply = _supply;
    }

    // Defining function to
    // return the value of 'str'
    function getValue() public view returns (string memory) {
        return str;
    }

    function getSupply() public view returns (uint) {
        return supply;
    }
}
