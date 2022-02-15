pragma solidity >=0.7.0 <0.9.0;

contract LedgerBalance {
    mapping(address => uint256) balance;

    function updatesBalance(uint256 newBalance) public {
        balance[msg.sender] = newBalance;
    }
}

//       Exercise
// 1. create a new contract called Updated
// 2. the contract LedgerBalance above for you
// 3. create a public function called updatesBalance
// 4. instantiate the data type contract LedgerBalance to a new variable called ledgerbalance (similar to struct or enum).
// 5. set the new variable ledgerbalance = new LedgerBalance()
// 6. update the ledgebalance to 30
// 7. deploy both contracts and up then update the ledgerbalance by 30 using the Updated contract

//       MY SOLUTION

contract Updated {
    function updatesBalance() public {
        // instantiating the data type contract LedgerBalance to a new variable called ledgerbalance
        LedgerBalance ledgerBalance = new LedgerBalance();
        // updating the ledgebalance to 30
        ledgerBalance.updatesBalance(30);
    }
}
