// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 *
 *SENDING ETHER

 There are 3 ways to send ether from 

 1. transfer - 2300 gas, reverts
 2. send - 2300 gas, returns bool
 3. call - all gas, returns bool and data

 Transfer sends 2300 gas and if the send fails for some reason then the whole function fails.

 Send is like transfer, however it returns a boolean value that indicates whether the send is successful or not.

 Call forwards all gas and returns two values, a boolean indicating wether the call was successful or not and some bytes data.

 Hint: To be able to send ether from a contract this contract first needs to be able to recieve ether.
 One way for this contract to receive ether is to pay it when this contract deployed by having a "payable" constructor.
 Another way is to have a payable fallback function
 */

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    function sendViaCall(address payable _to) external payable {
        // (bool success, bytes memory data)=_to.call{value:123}('');

        // ignoring the second value

        (bool success, ) = _to.call{value: 123}("");
        require(success, "call failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}

//Hint: The recommended way to transfer ether is to use "call{}('')"
