// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public accounts;

    function createAccout(address _owner) external payable {
        // deploying another contract
        // Account account = new Account(_owner);
        // accounts.push(account);

        // To make the function accept ether

        Account account = new Account{value: 111}(_owner);
        accounts.push(account);
    }
}

//Hint: Usually when you see contract that deploy another contracts, those contract will have the keyword "Factory" in their name... Just like in Factory we create new stuff, thus in this case we create new contracts
