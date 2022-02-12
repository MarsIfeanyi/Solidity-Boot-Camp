//          Looping Exercise
//1. create a contract myLooping and place all the following code within:
// 2. create a list that ranges from 1 to 30 called longList
// 3. create a list called numbersList of the following numbers: 1, 4, 34, 56,11,8,3,5
// 4. create a function that loops through numbersList and returns a true value if the number
//  that the user inputs exists in the list otherwise it should return false
// 5. create a function that loops trhough and returns how many even numbers there are in the long list

//         MY SOLUTION
pragma solidity >=0.7.0 <0.9.0;

contract myLooping {
    uint256[] longList = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
        30
    ]
    uint256[] numbersList = [1, 4, 34, 56,11,8,3,5];

    //function that returns true if the number user inputs, exist in the numberList array.
    function UserInput(uint256 userNumber) public view returns (bool) {
        bool numberExist = false;
        for (uint256 i = 0; i < numbersList.length; i++) {
            if (numbersList[i] == userNumber) {
                numberExist = true;
            }
        }
        return numberExist;
    }

    // function that loops through the longList array and counts the occurance of only even numbers.
    function EvenNumberCounter() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < longList.length; i++) {
            if (longList[i] % 2 == 0) {
                count++;
            }
        }
        return count;
    }
}
