// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 *20-ArrayRemove-an-Element-by-Relacing-Last.sol
 */

// remove array element by shifting element to the left
// [1,2,3,4,5,6] -- remove(2) --> [1,2,4,5,6,6] --> [1,2,4,5,6] //Hint: This is not the gas efficient way of removing element however the order is preserved.

contract ArrayReplaceLast {
    uint[] public arr;

    // [1,2,3,4] --> remove(1) --> [1,4,3]
    // [1,4,3]  --> remove(2) --> [1,4]
    //Hint: This is the most gas efficient way of removing element however, the order is not preserved, since we are shuffling the array element.
    //VIP: What this algorithm is doing is: Replacing the element to be removed with the last element and then pop() the last element.Thus this is a more efficient algorithm.

    function remove(uint _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4];
        remove(1);

        // [1,4,3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);

        // [1,4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
