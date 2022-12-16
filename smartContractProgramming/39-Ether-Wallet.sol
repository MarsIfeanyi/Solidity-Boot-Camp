// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/***
 * This is a simple contract that can send and recieve ether.
 * Anyone will be able to send ether into this contract but only the owner will be able to send ether out of the contract
 */

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // allows the contract to receive ether
    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        owner.transfer(_amount);
    }

    //Hint: The above withraw functions works but lets apply gas optimization

    function withdraw2(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount); // since owner = msg.sender, using msg.sender saves more gas

        // OR

        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
