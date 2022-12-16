// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract CallTestContract {
    // Hint: One of the ways to call a contract is to initialize the contract... VIP: _test is the address of the contract you want to call
    function setX(address _test, uint _x) external {
        TestContract(_test).setX(_x);
    }

    //Hint: Another way to call a contract is to pass the contract into the function as a type, instead of initializing it.

    function setX2(TestContract _test, uint _x) external {
        _test.setX(_x);
    }

    function getX(address _test) external view returns (uint x) {
        x = TestContract(_test).getX();
    }

    // Calling a function on another function and also send Ether
    function setXandSendEther(address _test, uint _x) external payable {
        TestContract(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test) external view returns (uint, uint) {
        (uint x, uint value) = TestContract(_test).getXandValue();
        return (x, value);
    }

    //Another way of returning the value
    function getXandValue2(
        address _test
    ) external view returns (uint x, uint value) {
        (x, value) = TestContract(_test).getXandValue();
    }
}

contract TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}
