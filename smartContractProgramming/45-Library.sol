// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * LIBRARY
 *
 * library allows you to reuse code. it also allows you to enhance data types.
 *
 * Hint: You cannot write state variables inside library.
 *
 * functions inside library should be "internal"
 */

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}


contract TestArray{
    // A for B pattern
    uisng ArrayLib for uint[];//Hint: This line of code tells solidity that for this data type, uint[], attach all of the functionalities defined inside the library ArrayLib... ie we are declaring the library we are using on the data type.

    uint[] public arr =[3,2,1]


    function testFind()external view returns(uint i){

        // return ArrayLib.find(arr,2);

        // an easier way... this requires to use the A for B pattern
        return arr.find(2);
    }
}
