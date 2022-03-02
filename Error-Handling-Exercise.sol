/*
        Exercise on Error Handling in Solidity- 
1. Create a contract called Vendor with the state variable address seller. 
It should contain a modifier onlySeller that requires the msg.sender to be the seller.
2. Add a function becomeSeller which sets the seller to the msg.sender.
3. Create a function named sell which is payable and checks so see 
if an input of an amount is greater than the msg.value and in the event
to revert that there is not enough ether provided as a throw error. 
*/

// MY SOLUTION

pragma solidity >=0.7.0 <0.9.0;

contract Vendor {
    address seller;

    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can sell this!");
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    }

    function sell(uint256 amout) public payable onlySeller {
        if (amout > msg.value) {
            revert("There is not enough ether provided!");
        }
    }
}
