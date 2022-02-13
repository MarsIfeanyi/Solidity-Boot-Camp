// Array Exercise: create a function that can fully remove an item from an array ie when the element is removed, the length changes as well

/* 1. Create an Empty array called changeArray
    2. Create a function called removeElement which sets the index argument of the array to the last element in the array
    3. remove the last index from that function with the pop method
    4. Create a function called test which pushes 1 2 3 4 into changeArray
    5. remove the element 2 from the array when the contract is called.
    6. find the length of the new array and return value */

//     MY SOLUTION

pragma solidity >=0.7.0 <0.9.0;

contract Arrays {
    uint256[] changeArray;

    function removeElement(uint256 i) public {
        // setting index argument to the last element of array
        changeArray[i] = changeArray[changeArray.length - 1];
        changeArray.pop();
    }

    function test() public {
        changeArray.push(1);
        changeArray.push(2);
        changeArray.push(3);
        changeArray.push(4);

        // Alternatively using looping to push element

        for (uint256 i = 1; i <= 4; i++) {
            changeArray.push(i);
        }
    }

    function changeArrayLength() public view returns (uint256) {
        // to get the new length of the array after an element has been removed.
        return changeArray.length;
    }
}
