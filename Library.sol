pragma solidity >=0.7.0 <0.9.0;

/*
Libraries are similar to Contracts but are mainly intended for reuse. A Library contains functions which other contracts can call. 
Solidity have certain restrictions on use of a Library. Following are the key characteristics of a Solidity Library.

    Library functions can be called directly if they do not modify the state. 
    That means pure or view functions only can be called from outside the library.
                Key Features of a Library
  1.  Library can not be destroyed as it is assumed to be stateless.
  2.  A Library cannot have state variables.
  3.  A Library cannot inherit any element.
  4.  A Library cannot be inherited.
*/

//Library that searches and returns the index of numbers in an array
library Search {
    // we want this loop to return the index value of some integer we are searching for
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
    }
}

contract Test {
    uint256[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent(uint256 val) external view returns (uint256) {
        uint256 value = val;
        //Assigning Library Search to the integer variable Index, to search for the index value of chosen number in the data array and Return the Index Value
        uint256 index = Search.indexOf(data, value);
        return index;
    }
}

/*
The directive using A for B; can be used to attach library functions of library A to a given type B.
These functions will use the caller type as their first parameter (identified using self).

                    Exercise on Library: 
1. Copy over the library Search and the contract Test above
and rename library Search to Search2 and contract Test to Test2. 

2. Using the A for B library pattern assign the new library to an empty array type and rewrite the code so that we can run the same search hardcoded this time to the value of 4 accordingly.  
*/

library Search2 {
    // we want this loop to return the index value of some integer we are searching for
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
    }
}

contract Test2 {
    // using A (library) for B (another element)
    using Search2 for uint256[];
    uint256[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent() external view returns (uint256) {
        //Hardcoded value of 4
        uint256 value = 4;
        uint256 index = data.indexOf(value);
        return index;
    }
}
