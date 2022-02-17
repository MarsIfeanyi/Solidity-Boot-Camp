/*            Exercise on Function Overloading 
1. Create two functions with the same name that return the sum of their arguments - 
2. One function which takes two arguments and another function which takes three arguments. 
3. Create two additional functions which can call each sum function and return their various sums. 
4. Successfully deploy your contract and test the results of overloading functions! 
*/

// MYSOLUTION

pragma solidity >=0.7.0 <0.9.0;

contract Overloading {
    /* Function overloading = Function with the same name but with different number of arguments*/
    function mySum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function mySum(
        uint256 a,
        uint256 b,
        uint256 c
    ) public pure returns (uint256) {
        return a + b + c;
    }

    function getMySum2() public pure returns (uint256) {
        return mySum(20, 40);
    }

    function getMySum3() public pure returns (uint256) {
        return mySum(100, 50, 30);
    }
}
