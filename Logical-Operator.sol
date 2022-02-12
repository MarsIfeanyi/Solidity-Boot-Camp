//   Logical Operators Exercise
// 1. Create a function which will multiply a by b and divide the result by b
// 2. Only return the multiplication of the function if b is greater than a AND a does not equal b otherwise return x, where x is a divided by b
// 3. initialize a = 17 and b to 32

// MY SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract LogicalOperators {
    function MultiplyLogic() public view returns (uint256) {
        uint256 a = 17;
        uint256 b = 32;
        uint256 x = a / b;
        uint256 result = a * b;
        if (b > a && a != b) {
            return result;
        } else {
            return x;
        }
    }
}
