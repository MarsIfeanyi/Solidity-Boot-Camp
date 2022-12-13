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
