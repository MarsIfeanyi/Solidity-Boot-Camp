// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * This task extends the functionality of the previous contract by allowing users to save their additional info into the smart contract as a KYC measure.

The contract should now contain the following:

setUserDetails(string calldata name, uint256 age) this function accepts 2 arguments that represent the details of the user calling the smart contract and it saves them into a defined struct,
getUserDetail() this function retrieves and returns the details saved for the user calling the contract.
 */

contract SaveUserBalanceKYC {
    struct UserDetails {
        string userName;
        uint256 userAge;
    }

    // array of Struct type
    UserDetails[] public details;

    // state variable of Struct type
    UserDetails public detail;

    //mapping of address to uint256
    mapping(address => uint256) public balances;
    address public owner = msg.sender;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    /**
     * setUserDetails(string calldata name, uint256 age) this function accepts 2 arguments that represent the details of the user calling the smart contract and it saves them into a defined struct,
     */

    function setUserDetails(string calldata name, uint256 age) public {
        details.push(UserDetails({userName: name, userAge: age}));
    }

    /**
     * getUserDetail() this function retrieves and returns the details saved for the user calling the contract.
     */

    function getUserDetail()
        public
        view
        returns (string memory userName, uint256 userAge)
    {
        return (details[0].userName, details[1].userAge);
    }
}
