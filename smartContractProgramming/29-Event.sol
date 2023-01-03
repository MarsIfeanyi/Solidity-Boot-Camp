// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Events allows to write data on the blockchain
 */

contract Event {
    event Log(string message, uint val);

    // Hint: To search for a particular event by the parameter that was logged, then we use the keyword "indexed"... VIP: upto 3 parameters can be indexed
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("mars", 1234); //When we execute this function, this two parameters will be stored on the blockchain

        emit IndexedLog(msg.sender, 849);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}

/**
 * Hint:
 * Events are stored and saved outside the contract and thus they are cheaper.
 * Events are stored in Log and Smart contracts can access logs.
 * 
 * VIP:Events are stored in a special data structure called Logs.
 * 
 * Each event is tied to the smart contract or the account address that emitted the event in the transaction
 * 
 * When we emit events there are two kinds of parameters:
 * 1. indexed parameters
 * 2. non-indexed parameters
 * 
 * Hint: You can have upto 3 indexed parameter. indexed parameters are also known as topics.
 * 
 * VIP: Indexed parameters = Topics
 * 
 * Indexed parameters are much easier to search for and query than non-indexed parameters.
 * 
 * The non-indexed parameters (Data) are ABI encoded.
 * 
 * Hint:Non-indexed parameter cost less gas, however they are hard to decode if you don't have the ABI
 * 
 * 
 *Defining an event
 event storedNumber(
    uint256 indexed oldNumber,
    uint256 indexed newNumber,
    uint256 addedNumber,
    address sender

 )

 //Emitting an event
 emit storedNumber(
    favoriteNumber,
    _favoriteNumber,
    _favoriteNumber + favoriteNumber,
    msg.sender
 )
 * 
 */
