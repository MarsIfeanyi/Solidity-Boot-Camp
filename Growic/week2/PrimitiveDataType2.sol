// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract PrimitiveDataTypes {
    // SIGNED INTEGERS (int) : Signed integers are used for numbers below zero. All negative numbers below zero, fall into the signed integers data type.

    // USECASE: Signed Integers(int) can be used to show withdrawal of a certain amount from an account or address

    // declaring a signed integer data type and initializing it to a value
    int256 public amountWithdraw = -100;

    int256 public withdrawalAmount;

    // function that sets withdrawalAmount
    function withdrawFund(int _amount) public {
        withdrawalAmount = _amount;
    }

    // function that gets withdrawalAmount
    function getWithdrawAmount() public view returns (int) {
        return withdrawalAmount;
    }

    // UNSIGNED INTEGERS (uint): Unsigned Integers data types are used for number above zero. All the positive numbers fall into the signed integers data type.

    // USECASE: Unsigned Intergers can be used to show deposited of a certain amount to an account or address

    // declaring an Unsigned integer and initializing it to a value
    uint256 public amoutDeposit = 300;

    uint256 public depositAmount;

    // function that sets depositAmount
    function depositFund(uint _amountDep) public {
        depositAmount = _amountDep;
    }

    // function that gets deposited amount
    function getDepositAmount() public view returns (uint) {
        return depositAmount;
    }

    // BOOLEAN (bool): The boolean data types has only the values of "true" of "false".

    // USECASE: The bool can be used to check if a transaction is successful or not. Thus if a transaction is successful it returns "true" and some set customed message, and if a transaction is not successful it returns "false" and some customed error messages

    bool public validTransaction = true;

    bool public inValidTraction = false;

    // ADDRESSES: The address data type is often used in smart contracts to store the address of an account that is interacting with the contract.

    address public myAddress;

    // funtions that sends ether to an address
    function sendEther(address _addr) public {
        myAddress = _addr;
    }

    // function that gets the address
    function getMyAddress() public view returns (address) {
        return myAddress;
    }

    // ENUM: Enums are user defined data types, Enums are useful for creating a fixed set of options that can be used in your contract.

    enum Color {
        Red,
        White,
        Blue
    }

    // declaring a variable of the enum data type
    Color public favoriteColor;

    //function that sets favoriteColor
    function myFavoiteColor(Color _color) public {
        favoriteColor = _color;
    }

    // function that gets favoriteColor

    function getFavoriteColor() public view returns (Color) {
        return favoriteColor;
    }

    // BYTES: The bytes data type is used to represent a dynamic array of bytes. A byte is a unit of digital information that consists of 8 bits, and an array is a collection of values of the same type.
    //The bytes data type is similar to the string data type, but it is intended for storing raw byte data rather than Unicode text.

    // USECASE: The bytes data type is often used in smart contracts to store data that is not intended to be interpreted as text, such as hashes, digital signatures, or other types of binary data. For example, you might use the bytes data type to store the hash of a document that is being stored on the Ethereum blockchain, or to store the signature of a user who has signed a contract.

    // declaring bytes data type

    bytes32 mySignature;

    // function that sets private key to sign a contract
    function signContract(bytes32 privateKey) public {
        mySignature = privateKey;
    }
}
