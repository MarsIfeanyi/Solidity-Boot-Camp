/*      Exercise on inheritance in solidity
  Create two contracts A and B
    1. Contract A should have a state var called innerVal initialized to 100.
    2. Create a  fully accessible function called innerAddTen which returns 10 to any given input
    3. Contract B should inherit from contract A 
    4. Contract B should have a function called outerAddTen which returns the caculation from innerAddTen function in Contract A to any given input
    5. Create a function in contract B which returns the value of innerVal from contract A*/

//    MY SOLUTION

pragma solidity >=0.7.0 <0.9.0;

contract A {
    //initializing the state variable to 100
    uint256 innerVal = 100;

    function innerAddTen(uint256 val) public view returns (uint256) {
        return val + 10;
    }
}

//Contract B inheriting from contract A
contract B is A {
    //function that returns the caculation from innerAddTen function in Contract A to any given input
    function outerAddTen() public view returns () {
        return A.innerAddTen(val);
    }

    //function that returns the value of innerVal from contract A
    function getInnerVal() public view returns (uint256) {
        return A.innerVal;
    }
}
