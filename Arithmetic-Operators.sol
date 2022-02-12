//          Arithmetic Operators Exercise
// 0. create a contract called ArithmeticOperations.
// 1. initialize 3 state variables a, b, f
// 2. assign each variable the following: a should equal 300, b should equal 12, and f should equal 47
// 3. create a function called Arithmetic that is public and viewable which returns a local variable d
// 4. ininitialize d to 23
// 5. return d in short handed assignment form to multiply itself by itself and then subtracted by b
// 6. make the function conditional so that it will only return the multiplcation if a is greather than b and b is less than f otherwise d should return 23

//        MY SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract ArithmeticOperations {
    uint256 a = 300;
    uint256 b = 12;
    uint256 f = 47;

    function Arithmetic() public view returns (uint256) {
        uint256 d = 23;
        if (a > b && b < f) {
            d *= d;
            return d - b;
        } else {
            return d;
        }
    }
}
