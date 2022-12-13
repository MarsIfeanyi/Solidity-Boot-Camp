// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * There are 3 ways to throw an Error in solidity
 * 1. require
 * 2. assert
 * 3. revert
 *
 * require is mostly used to validate inputs and for access control.
 *
 * assert is used to check for conditions that should always be true. if the condition is false then there might be a bug in your smart contract.
 * Hint:Use assert to check for conditions that should always be true. When an error is thrown there will be a gas refund and state variable updates will be reverted
 *
 * Hint: Using custom errors helps to save more gas...The longer the error message the more gas it will use, thus with custom errors we can save gas
 */

//custom Error
error MyError(address caller, uint i);

contract Error {
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10");
        //code
    }

    function testRevert(uint _i) public pure {
        if (_i > 10) {
            revert("i > 10");
        }
    }

    uint public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }

    function testCustomError(uint _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}
