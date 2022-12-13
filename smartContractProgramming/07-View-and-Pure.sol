// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ViewAndPureFunctions {
    /**
     *  The difference between view and pure functions is that:
     * View function can Read data from the blockchain while Pure function cannot Read data from the blockchain
     */

    uint public num;

    function viewFunc() external view returns (uint) {
        //Reading the state variable from the blockchain
        return num;
    }

    function pureFunc() external pure returns (uint) {
        return 1;

        //Hint:pure functions does not modify the state of the blockchain. Its does not Read any data from the state variables or any other information on the blockchain or smart contract
    }

    function addToNum(uint x) external view returns (uint) {
        //Reads the State variable
        return num + x;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}
