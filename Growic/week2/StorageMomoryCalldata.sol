// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * STORAGE MEMORY AND CALLDATA
 *When we use a dynamic variable as a data, we need to declare its data location.

 The variables Locations are:
 1. Storage
 2. Memory
 3. Calldata

 Storage means that the variables is a state variable.

 Memory means that the data is loaded unto memory.

 Calldata is like a memory except that it can only be used for function inputs. Hint: Using calldata helps to save gas... You can't modify calldata

 Summary:

 use "storage" to load dynamic data that you will update/modify

 If you only need to read the data or modify it without saving it unto the blockchain, then use "memory"

 For function inputs use "calldata to save gas". when this input is passed to another function it saves gas by avoiding copies.


In Solidity, there are three main data locations where variables can be stored: storage, memory, and calldata.

STORAGE: is a long-term storage area for contract data. It is permanent and remains on the blockchain after the contract has been executed. Variables stored in storage persist between function calls and can be modified by multiple functions within the contract.
Storage is the database layer where contract is stored and its persistent.
Hint: Read/Write are costly in storage... All state variables are stored in the storage

MEMORY: is a temporary storage area for data that is only needed within the context of a single function call. It is wiped clean after the function call completes. 
Hint: Memory is faster to read and write to than storage, but it is more expensive to use because it consumes gas.

CALLDATA: is a special type of read-only memory that stores the input data for a function call. 
Hint: It is used to pass arguments to functions when they are called. Calldata cannot be modified and is only available within the context of a function call.

VIP: It is important to choose the appropriate data location for your variables based on their intended use and lifetime. In general, variables that need to be preserved between function calls should be stored in storage, while temporary variables used within a single function can be stored in memory. Calldata should only be used for read-only input parameters.

 */

contract DataLocation {
    // Creating a struct called "MyStruct"
    struct MyStruct {
        uint foo;
        string text;
    }

    // Creating a mapping of address to struct
    mapping(address => MyStruct) public myStructs;

    function examples(
        uint[] memory y,
        string memory s
    ) external returns (uint[] memory) {
        // variable assignment and initialization
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // Modifying the struct... Hint: You will declare the struct as storage when you want to modify the struct.
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "Mars";

        // Reading the struct without preserving the data or modifying it
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

    function _internal(uint[] calldata y2) private pure {
        uint x = y2[0];
    }
}
