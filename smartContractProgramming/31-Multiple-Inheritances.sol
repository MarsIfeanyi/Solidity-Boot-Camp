// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * When a contract inherits multiple other contracts, then the order of inheritance is important.
 * VIP: Order of inheritance -> most base-like to derived.
 *
 * The contract that is base-like is the contract that inherits the least
 *
 *
 *
 *
 */

contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

//Hint: Here the most base-like is X... VIP, if you switch the order then the contract will not compile
contract Z is X, Y {
    function foo() public pure override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure override(X, Y) returns (string memory) {
        return "Z";
    }
}
