// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    uint public count;

    function incrementCount() external {
        count += 1;
    }

    function decrementCount() external {
        count -= 1;
    }
}
