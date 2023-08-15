// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Function modifiers allows you to reuse code.
 */

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    //Basic modifiers
    modifier whenNotPaused() {
        require(!paused, "paused");
        _; // Hint: The underscore tells solidity to call the actual function that this modifier wraps... ie we run the rest of the function that called this modifier(funtion where this modifier is added).

        // VIP:  A single modifier can be used by any number of functions.
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    //Modifiers that takes in an input
    modifier cap(uint _x) {
        require(_x < 100, "x >=100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    //Sandwich modifier... Some code will be executed inside the function modifier, call the actual function and then execute more code inside the function modifier

    modifier sandwich() {
        //code here
        count += 10;
        _;

        // more code here
        count *= 2;
    }

    function sandwichInBy() external sandwich {
        count += 1;
    }

    /**
     * Modifiers can take inputs too - you’d just pass the type and name of the input into a modifier.
     *
     * Modifiers are a great way to package up snippets of logic that can be reused in various smart contracts that together power your dApp. Reusing logic makes your code easier to read, maintain and reason about – hence the principle DRY (Don’t Repeat Yourself).
     */

    modifier validAddress(address addr) {
        // address should not be a zero-address.
        require(addr != address(0), "Address invalid");

        // continue with the rest of the logic
        _;
    }

    function transferTokenTo(
        address someAddress
    ) public validAddress(someAddress) {
        // do something....
    }
}
