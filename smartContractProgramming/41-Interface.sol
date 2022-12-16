// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * INTERFACE
 *
 * Solidity allows you to call other contracts without having the code by using interface.
 *
 * Hint: interfaces starts with capital "I"
 *
 * Hint: functions in interfaces does not have parenthesis,{}, but rather they use semicolon... Functions in interface cannot have implementation
 */

contract Counter {
    uint public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

interface ICounter {
    function count() external returns (uint);

    function inc() external;
}

contract CallInterface {
    uint public count;

    function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}
