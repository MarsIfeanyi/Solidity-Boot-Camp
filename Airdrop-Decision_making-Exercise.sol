//              Exercise in DeFi! :)

// 1. Create a stakingWallet variable as an integer and set it to the value of 10
// 2. Write a function called airDrop which has public visibility, is IDE viewable and returns an integer
// 3. create decision making logic so that if the wallet has a value of 10 then add to the wallet 10 more
// 4. add an else statement so that if the wallet does not equal the value of 10 to add only 1 more
// 4. return the value of the wallet
// 5. deploy the contract the test the results - try changing the value of the wallet to 6 and redeploying for varying results

//              SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract AirdropDecision {
    uint256 stakingWallet = 10;

    function airDrop() public view returns (uint256) {
        if (stakingWallet == 10) {
            return stakingWallet + 10;
        } else {
            return stakingWallet + 1;
        }
    }
}
