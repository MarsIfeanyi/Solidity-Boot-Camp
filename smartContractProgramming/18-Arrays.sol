// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Arrays in solidity can be dynamic or fixed size
 */

// Array - dyanmic or fixed size
// Initialization
// Insert (push), get, update, delate, pop,length
// Creating array in memory
// Returning array from function

contract Array {
    //declaring and initializing an array
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function examples() external {
        nums.push(4); // [1,2,3,4]

        //Hint: push() adds element to the end of the array... You cannot push an element to a fixed array

        //getting array element, by using the index
        uint x = nums[1];

        //updating array element
        nums[2] = 50; //[1,2,50,4]

        // deleting an element from the array
        delete nums[1]; // [1,0,50,4]... Hint: Deleting an element does not change the length of the array, however with pop() the length changes
        nums.pop(); //[1,0,50]
        uint len = nums.length;

        //Create array in memeory...Hint:Array created in memeory is fixed and thus you can use the push() or pop() method on them, however you can update the array or get the value

        uint[] memory a = new uint[](5);

        //updating the Array
        a[1] = 1234;
    }

    function returnArray() external view returns (uint[] memory) {
        return nums;
    } //Hint: Returning the array from a function is not recommended because of gas cost.
}
