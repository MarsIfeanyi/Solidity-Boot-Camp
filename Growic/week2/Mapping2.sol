// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Mapping2 {
    // CREATE AND UPDATE MAPPINGS

    // You can reference a mapping using the variable mapping name and manipulate its values. If you do not set a value it will have a default value assigned to it.

    mapping(address => uint) public balance;

    function setAddressMapping(address _addr, uint _uint) public {
        balance[_addr] = _uint;
        //mappingName[key] = value
    }

    function getAddressMapping(address _addr) public view returns (uint) {
        return balance[_addr];
    }

    function deleteAddressMapping(address _addr) public {
        delete balance[_addr];
    }

    // MAPPING ARRAYS

    // Lets see how we can update an array on a mapping.
    // First lets review how you would normally define an array with solidity.

    uint[] public uintArray = [7, 7, 7];
    string[] public stringArray = ["Bob", "Alice", "Jim"];

    //Now how you would reference an array within a defined mapping.

    mapping(address => string[]) public interests;

    // Then we can simply create functions to showcase this functionality

    function setInterests(
        address _key,
        string memory _i1,
        string memory _i2
    ) external {
        interests[_key] = [_i1, _i2];
    }

    function interestCount(address _key) public view returns (uint) {
        return interests[_key].length;
    }

    // Using the push() method is useful for adding to an existing array.

    function addToInterests(address _key, string memory _i) external {
        interests[_key].push(_i);
    }

    //    NESTED MAPPINGS
    // First, lets look at how you define a nested array in solidity.

    string[][] public deeperArray = [["0x00", "0x01"], ["Guitar", "Reading"]];
    // This is useful if the data types are the same but when they are different you have to deal with changing their type and it can be difficult to manage those correlations.

    // Instead we can look at nested mappings.

    mapping(address => mapping(uint => string)) public _interests;

    function addMyInterest(uint _id, string memory _i) external {
        _interests[msg.sender][_id] = _i;
    }
}
