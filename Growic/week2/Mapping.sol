// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * In Solidity, a mapping is a data type that allows you to store and retrieve values using a key-value pair. A mapping is similar to a hash table or a dictionary in other programming languages, and it is often used to store data that needs to be accessed quickly based on a unique key.
 * 
 * Maps are created with the syntax mapping (keyType => valueType).
VIP: The keyType can be any built-in value type, bytes, string, or any contract.
valueType can be any type including another mapping or an array.
Hint: Mappings are not iterable.

Hint: It's important to note that mappings do not have a fixed size, and they do not preserve the order of the key-value pairs that are added to them. This means that mappings are not suitable for use cases where the order of the data or the total number of key-value pairs is important.


            CRUD OPERATION IN MAPPING

The mapping data type provides several built-in functions that you can use to perform common operations on the data stored in a mapping. These operations are often referred to as C.R.U.D., which stands for create, read, update, and delete. Here's a brief overview of each operation:

Create: To create a new key-value pair in a mapping, you can simply assign a value to a key that does not already exist in the mapping. 
                For example: myMapping[key] = value;

Read: To read the value associated with a key in a mapping, you can simply access the value using the key as an index. 
                For example: value = myMapping[key];

Update: To update the value associated with a key in a mapping, you can simply assign a new value to the key. 
                For example: myMapping[key] = newValue;

Delete: To delete a key-value pair from a mapping, you can use the built-in delete function. 
                For example: delete myMapping[key];

 */

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
        //MappingName[key] = value
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}

// Hint: In Mapping you always use the keys to access the values
