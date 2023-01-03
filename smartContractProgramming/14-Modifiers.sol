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
        _; // Hint: The underscore tells solidity to call the actual function that this modifier wraps
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
}
