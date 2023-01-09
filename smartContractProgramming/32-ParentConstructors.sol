// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * CALLING PARENT CONSTRUCTORS
 *
 * When a contract inherits from the parent contract, how do you call the constructor of the parent.
 *
 * There are two ways of calling or initialzing constructors:
 *
 * 1. Static Inputs
 * 2. Dynamic Inputs: Dynamic inputs will be determined when the contract is deployed
 *
 * ORDER OF INITIALIZATION
 * The order of initialization of the parent contract is not determined by the order of initialization of the constructor, rather it is determined by the order of inheritance. Thus the order in which the parent constructors are called is based on the order of inheritance
 *
 */

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Static Inputs: first way of initializing parent constructors...Hint: This only works when you know the input to pass to the constructors when you are writing the code
contract U is S("s"), T("t") {

}

// Dynamic Inputs... Hint: You use this when you don't know the inputs to the constructors
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {} // VIP The order is not important
}

//Hint: You can also use a combination of static inputs and dynamic inputs

contract VV is S("s"), T {
    constructor(string memory _text) T(_text) {}
}

// Order of execution
// 1. S
// 2. T
// 3. V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {}
}

// Order of execution
// 1. T
// 2. S
// 3. V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {}
}

// Order of execution
// 1. T
// 2. S
// 3. V3
contract V3 is T, S {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}
