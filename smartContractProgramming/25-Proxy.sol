// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * 25-Deploy-Any-Contract.
 *
 * Here you will learn how to deploy any arbitrary contract and then execute it.
 * 
 * Hint: To deploy an arbitrary we will need the assembly {
    // create (v,p,n)
    // v = amount of ETH to send
    // p = pointer in memory to start of code
    // n = size of code
 }
 */

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not Owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    //Event
    event Deploy(address);

    //fallback()external payable{}

    function deploy(
        bytes memory _code
    ) external payable returns (address addr) {
        assembly {
            // create (v,p,n)
            // v = amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            //============
            // callvalue() = msg.value
            // 0x20 = 32...Hint the first 32 bytes encode the length of the code, thus the actaul code starts after 32 bytes
            //add(_code, 0x20), tells solidity to skip the first 32 bytes
            // mload(_code) is the size of the code ie the first 32 bytes

            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }

        // Checking that the contract was successfully deployed
        require(addr != address(0), "Deploy failed");

        emit Deploy(addr);
    }

    // Calling a function from the Proxy contract
    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "Failed");
    }
} //Hint: This is a contract that can deploy any arbitrary contract by simply passing in the byte code of the contract as as input

// Helper contract to get the byte code

contract Helper {
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getBytecode2(
        uint _x,
        uint _y
    ) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address), _owner ");
    }
}
