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
