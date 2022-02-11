//                     Exercise: 
//1. Create a function in the learnFunctions contract called multiplyCalculator
   // 2. Add five parameters to the function a,b,c,d & e and set them as integers.
   // 3. Grant the function public visibility as well as viewing capability for the IDE.
   // 4. Return an integer for the function
   // 5. Create a variable result that contains the logic to multiply a and b 
   // 6. Return the result 
   // 7. Compile and deploy your very first dApplication and test out the results!! 

   //        Solutions

   pragma solidity >= 0.7.0 < 0.9.0;

contract learnFunctions {

    function multiplyCalculator (uint a, uint b, uint c, uint d,uint e) public view returns(uint){
        uint result = a * b *c * d * e;
        uint sum = a + b + c + d + e;
        return result
    }

    // Write a function that can calculate the mean of the n numbers and return sum based on the number of parameters provided, that returns the result as interger and is publicly visible.

     function MeanCal (uint x, uint y, uint z, uint w, uint v) public pure returns(uint){
       uint  sum = x + y + z + w + v;
       uint n = 5;
       uint  mean = sum/n;
       return mean;
    }
} 
   
