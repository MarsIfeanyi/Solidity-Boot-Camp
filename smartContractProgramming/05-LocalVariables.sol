// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract LocalVariables {
    // State variables...VIP: State variables are persistent
    uint public i;
    bool public b;
    address public myAddress;

    //Hint: Local variables only exist while the function is executing after execution the data is gone

    function localVar() external {
        uint x = 123;
        bool f = false;

        // more code

        i = 123;
        b = true;
        myAddress = address(1);
    }
}
