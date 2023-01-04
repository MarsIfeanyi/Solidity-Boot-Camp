// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * DELEGATECALL
 *
 *Delegatecall executes call in another contract in the context of the contract that called it.

 delegatecall means is going to be executing the code in the contract that is being called with the state variable and other context of the contract that called.

       Regular Call:

A calls B, sends 100 wei
        B calls C, sends 50 wei
A ---> B ---> C
               msg.sender = B
               msg.value = 50
               execute code on C's state variables
               use ETH in C

A calls B, sends 100 wei
        B delegatecall C 
A ---> B ---> C
               msg.sender = A
               msg.value = 100
               execute code on B's state variables 
               use ETH in B       


 */

contract TestDelegateCall {
    // address public owner; // if you add this here for delegate, you will get a weird output, this changes the storage layout
    uint public num;
    address public sender;
    uint public value;

    //Adding a new state variable after deploying a contract you want to use delegatecall on.
    address public owner; // However adding it below will not change the storage Layout

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _test, uint _num) external payable {
        // _test.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));

        //Hint: This is another way of using delegatecall... delegate call returns two values

        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );

        require(success, "delegatecall failed");
    }
}

//Hint: Since we are using delegatecall, all the state variables in  TestDelegateCall contract will not be initialized, is only the state variable in Delegatecall contract that will be initialized and updated.

//Hint VIP: When you are using delegatecall to update your contract logic, then all the state variables have to be the same and in the exact same order. If the state variable are not the same and in the exact same order you will get a weired result, beacuse the Storage layout has changed.

//Hint: When you are using delegatecall to update your contract code make sure that the original state variables are declared in the same order. However if you want to add a new state variable then add it below thr order state variables, don't change the orginal order
