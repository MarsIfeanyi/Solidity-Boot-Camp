// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract ForAndWhileLoops {
    function loops() external pure {
        //For LOOP
        for (uint i = 0; i < 10; i++) {
            //code
            //Hint:You can use the "continue" keyword to skip an iteration of the loop
            if (i == 3) {
                continue;
            }
            //more code

            //Hint: the "break" keyword is used to break out of the loop
            if (i == 5) {
                break;
                //Thus the loop will not run for i == 6 and above, since we break the loop at i == 5
            }
        }

        //While LOOP

        uint j = 0;
        while (j < 10) {
            //code
            j++;
        }
    }

    //function that sums all the numbers from 1 to n
    function sum(uint _n) external pure returns (uint) {
        uint s;
        for (uint i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}

//Hint: In solidity, the number of loops that your function might run is something that you need to consider when you are writing your loop, because the bigger the loop, the more gas it will use...Thus keep the number of loops small and then save gas.
