// How does a contract find out if another address is a contract?

//                 MY SOLUTION
// An address is a contract, if there are bytes of code greater than zero.
pragma solidity >=0.7.0 <0.9.0;

contract detectContract {
    function isItAContract() public view returns (bool) {
        uint32 size;
        address a = msg.sender;
        // inline assembly accesses EVM at a low level
        assembly {
            // extcodesize retrieves the size of the code
            size := extcodesize(a)
        }
        return (size > 0);
    }
}

/*  However this is not a perfect example as we can hack the contract by using constructor.
How do we invade the detection of the byte:  if we want to bypass the detectContract into thinking that it is not a contract we will just execute the address in a constructor
Thus if you call the address from a constructor, there are no byte codes
*/

contract Hacker {
    bool public TrickedYou;
    Victim victim;

    constructor(address _v) public {
        victim = Victim(_v);
        trickedYou = !victim.isItAContract();
    }
}
