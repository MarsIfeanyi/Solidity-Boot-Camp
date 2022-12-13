// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 *When we use a dynamic variable as a data, we need to declare its data location.

 The variables Locations are:
 1. Storage
 2. Memory
 3. Calldata

 Storage means that the variables is a state variable.

 Memory means that the data is loaded unto memory.

 Calldata is like a memory except that it can only be used for function inputs. Using calldata helps to save gas.

 Summary:

 use "storage" to load dynamic data that you will update

 If you only need to read the data or modify it without saving it unto the blockchain, then use "memory"

 For function inputs use "calldata to save gas". when this input is passed to another function it saves gas by avoiding copies.

 
 */

contract DataLocation {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(
        uint[] memory y,
        string memory s
    ) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // Modifying the struct... Hint: You will declare the struct as storage when you want to modify the struct.
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "Mars";

        // Reading the struct without modifying it
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456; //Hint: You can modify the data, however when the fuction is done executing the data will be lost

        //Hint: Use "storage" to update data and use "memory" to read the data

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    function examples2(
        uint[] calldata y2,
        string calldata s2
    ) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});
        // Modifying the struct...
        MyStruct storage myStruct2 = myStructs[msg.sender];
        myStruct2.text = "Mars";
        // Reading the struct without modifying it
        MyStruct memory readOnly2 = myStructs[msg.sender];
        readOnly2.foo = 4564;

        _internal(y2);

        uint[] memory memArr2 = new uint[](3);
        memArr2[0] = 234;
        return memArr2;
    }

    function _internal(uint[] calldata y2) private {
        uint x = y2[0];
    }
}
