// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 *  DELETING CONTRACT
 *
 * selfdestruct(): When you call this function in solidity, you can delete the contract from the blockchain.
 * Also when you call selfdestruct, other than deleting the contract, you will also be able to send Ether to any address, even if the address is a contract and doesnot have a fallback function
 *
 * - delete contract
 * - force send Ether to any address
 */

contract Kill {
    function kill() external {
        // constructor() payable {

        // }

        // deletes the contract and send the stored ether to msg.sender
        selfdestruct(payable(msg.sender)); // selfdestruct takes only one input, an address to force Send all the Ether stored in this contract
    }

    function testCall() external pure returns (uint) {
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.kill();
    }
}
