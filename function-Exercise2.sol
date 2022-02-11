pragma solidity >=0.7.0 <0.9.0;

contract learnFunctions {
    //Fuction that Multiplies N-numbers based on the defined  parameters
    function multiplyCalculator(
        uint256 a,
        uint256 b,
        uint256 c,
        uint256 d,
        uint256 e
    ) public pure returns (uint256) {
        uint256 result = a * b * c * d * e;
        return result;
    }

    //Fuction that calculates the Mean N-numbers based on the defined parameters
    function MeanCal(
        uint256 x,
        uint256 y,
        uint256 z,
        uint256 w,
        uint256 v
    ) public pure returns (uint256) {
        uint256 sum = x + y + z + w + v;
        uint256 n = 5;
        uint256 mean = sum / n;
        return mean;
    }

    // function that Calculates the age of a person.
    function AgeCal(uint256 YearofBirth, uint256 PresentYear)
        public
        pure
        returns (uint256)
    {
        uint256 Age = PresentYear - YearofBirth;
        return Age;
    }
}
