// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * CALLING PARENT FUNCTIONS
 *
 * The two ways to call parent functions are:
 * 1. Directly
 * 2. Using the "super" keyword
 *
 */

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");

        // Calling the function directly
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");

        // Using the "super" keyword
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo();
    } //Hint: When we call the Parent function duectly, it only calls the function

    function bar() public override(F, G) {
        super.bar();
    } //Hint: When we call the parent function using "super", it calls all the parent contracts
}
