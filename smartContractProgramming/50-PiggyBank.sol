// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 *  PiggyVestBank is a contract where anyone will be able to desposit ETH into this contract and only the owner will be able to withdraw from it.
 *
 * When the owner withdraws from this contract, the PiggyVestBank will be distroyed/deleted and owner becomes a Zero address
 */

contract PiggyVestBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);

    mapping(address => uint256) public balances;
    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);
    }

    function depositFund(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function withdrawFund() external {
        require(msg.sender == owner, "Not Owner");

        emit Withdraw(address(this).balance);

        // destroy the contract after withdrawal
        selfdestruct(payable(msg.sender));
    }
}
