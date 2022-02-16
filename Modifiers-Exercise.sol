/*        Exercise 
 1. create a function modifier called costs for our register function that checks to see 
 that the senders value (hint look up msg.value) requires to be greater than or equal 
 to the price. Second hint: The function modifier should take an argument 
*/

pragma solidity >=0.7.0 <0.9.0;

contract Owner {
    address owner; // state variable

    constructor() public {
        // we use constructors to instantiate the state variables.
        owner = msg.sender;
    }

    modifier onlyOwner() {
        // customizable logic to modify our functions
        require(msg.sender == owner);
        _;
        // the underscore continues with the function
    }
    modifier costs(uint256 price) {
        // what msg.value: gives the amount in wei being sent with a message to a contract
        require(msg.value >= price);
        _;
    }
}

// is is a keyword grabbing inheritance from another contract - Owner

contract Register is Owner {
    mapping(address => bool) registeredAddresses;
    uint256 price;

    constructor(uint256 initialPrice) public {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        // the logic will modify the outcome
        registeredAddresses[msg.sender] = true;
    }

    // onlyOwner is our function modifier that requires
    // only the owner to be able to change the price
    function changePrice(uint256 _price) public onlyOwner {
        price = _price;
    }
}
