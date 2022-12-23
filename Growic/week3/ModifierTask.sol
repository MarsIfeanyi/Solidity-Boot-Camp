// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

// Custom errors
error NotaDepositorAlready();
error AmountTooSmall();
error InsufficientBalance();

contract SaveUserBalanceKYC {
    address public owner;

    uint private constant FEE = 10;

    struct UserDetail {
        string userName;
        uint256 userAge;
    }

    // Mapping of address to Struct
    mapping(address => UserDetail) public usersDetail;

    //mapping of address to uint256
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    // functions that saves the amount a user is depositing into a mapping
    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    // function that searches for user balance inside the mapping and returns the balance of who calls the contract.
    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // function that saves the details of the user calling the smart contract into defined struct
    function setUserDetails(string calldata name, uint256 age) public {
        usersDetail[msg.sender] = UserDetail({userName: name, userAge: age});
    }

    // function retrieves and returns the details saved for the user calling the contract.
    function getUserDetail() public view returns (string memory, uint256) {
        UserDetail memory userDetail = usersDetail[msg.sender];
        return (userDetail.userName, userDetail.userAge);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner Allowed");
        _;
    }

    modifier checkWithdrawalBalance(uint256 amount) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        _;
    }

    // function that allows only the owner to withdraw funds
    function withdrawFunds(
        uint256 amount
    ) public onlyOwner checkWithdrawalBalance(amount) {
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal Failed");
        //Todo: The withdrawFunds doesn't decrease the amount after withdraw, fix this bug
        balances[msg.sender] -= amount; // There is bug here not working
    }

    modifier onlyDepositor() {
        if (balances[msg.sender] < 0) {
            revert NotaDepositorAlready();
        }
        _;
    }

    modifier validateAmount(uint256 _amount) {
        if (_amount <= FEE) {
            revert AmountTooSmall();
        }
        _;
    }

    // function that allows only users that have deposited, to increase their balance on the mapping
    function addFund(
        uint256 _amount
    ) public onlyDepositor validateAmount(_amount) {
        balances[msg.sender] += _amount;
    }
}

/**
 * 
Add a withdraw function and create a modifier that only allows the owner of the contract to withdraw the funds.
Add an addFund function and create a modifier that only allows users that have deposited using the deposit function, to increase their balance on the mapping. The function should accept the amount to be added and update the mapping to have the new balance
Hint: if their balance is zero on the mapping, it should revert

Hint: theMapping[userId] = theMapping[userId] + _amount;

Create a modifier that accepts a value(uint256 _amount):
Create a private constant variable called Fee
In the modifier check if the value(_amount) it accepts is less than the Fee, revert with a custom error AmountToSmall()
Add it to the addFund function
Hint: addFund(uint256 _amount)..........
 */
