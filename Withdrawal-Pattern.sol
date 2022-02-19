/*  Withdraw Pattern and Cybersecurity in Solidity
Write an iterating function called returnFunds that will refund through the transfer method investors to a var 
called funders back to their wallets called contributedAmount. Add a modifier to the signature
that only the owner can execute this function. The function should return a bool success. */

pragma solidity >=0.7.0 <0.9.0;

contract pWithrawal {
    modifier onlyOwner() {
        require(true);
        _;
    }

    function returnFunds() public onlyOwner returns (bool success) {
        for (uint256 i = 0; funders.length; i++) {
            funders[i].transfer(contributedAmount);
        }
        return true;
    }
}
