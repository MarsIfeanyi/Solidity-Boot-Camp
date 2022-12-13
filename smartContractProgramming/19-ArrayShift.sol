// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * When you use delete to clear element from  an array it does not actuall remove the element, it just resets it to its default value.
 */

contract ArrayShift {
    uint[] public arr;

    function example() public {
        arr = [1, 2, 3];
        delete arr[1]; //[1,0,3]
    }

    // [1,2,3] -- remove(1)  --> [1,3,3] -->[1,3]
    // [1,2,3,4,5,6] -- remove(2) --> [1,2,4,5,6,6] --> [1,2,4,5,6]
    //[1] -- remove(0) --> [1] --> []

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        //Copying array element from Right to Left, satrtingnat the index to be removed
        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1]; //copying the element from right to left
        }
        //removing the last duplicate at the end of the array
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        //[1,2,4,5]

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}

//Hint: To remove an element from an array, shift the array element to the from Right to left and then remove the last index
