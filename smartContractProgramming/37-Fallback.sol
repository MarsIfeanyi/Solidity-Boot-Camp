// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * FALLBACK
 *
 * Fallback is a special function that get called when the funtion you called does not exist inside the contract.
 *
 * Hint: The main use case of fallback function is to enable direct sending ether.
 * Fallback contract is mostly used to enable smart contract to receive ether.
 * When another account or a contract tries to directly send ether to this contract, then this function will be executed
 *
 * There are to variations of Fallbacks:
 *
 * 1. fallback
 * 2. receive
 *
 * Difference between Receive and Fallback
 *
 * Receive is executed when the data that was sent (msg.data) is empty
 * Fallback is executed if the data that was sent is not empty and also is executed when the "receive" function does not exist
 *
 *
 * Summary:
 * 1. The fallback function is executed when you try to call a function that does not exist.
 * 2. It is mostly used to receive direct sending of ether.
 * 3. The fallback function will be called if message.data is not empty.
 */

contract Fallback {
    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}
