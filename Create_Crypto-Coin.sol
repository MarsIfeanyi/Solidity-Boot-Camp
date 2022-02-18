/* Create a Coin contract, with functions that allows only the Creator to Mint/create new coins but anyone can send coin to an address*/

pragma solidity ^0.8.4;

contract Coin {
    // Create two State Variable for the Minter and Balances
    address public minter;
    mapping(address => uint256) public balances;

    event Sent(address from, address to, uint256 amount);

    constructor() {
        minter = msg.sender; //Msg.sender = Global Variable
    }

    // Function that Sends an amount of newly created coins to an address and Can only be called by the contract creator
    function mint(address receiver, uint256 amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount; //make new coins
    }

    error InsufficientBalance(uint256 requested, uint256 available);

    // Function that Sends an amount of existing coins from any caller to an address
    function send(address receiver, uint256 amount) public {
        if (amount > balances[msg.sender])
            //Logic to protect account
            revert InsufficientBalance({
                requested: amount, //Requested amount
                available: balances[msg.sender] //Balance available in the wallet
            });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
