// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * To start the first thing we need to do is to declare the functions that are going to be inherited by the child class as "virtual" and then in the child contract we "override" it.
 *
 * Hint: the "virtual" keyword shows that the functions can be customized by the child contract
 */

//parent contract
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    // more code here

    function baz() public pure returns (string memory) {
        return "A";
    }
}

// child contract
contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }
}
