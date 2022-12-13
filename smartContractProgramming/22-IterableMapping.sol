// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Hint: We can't get the size of a mapping and we can't itrate it to get all the elements of the mappings.
 */

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _val) external {
        balances[_key] = _val; // Updates the balances mapping

        //if _key is not yet inserted, then set inserted to true and then push the _key to the keys array
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    // How the get the size of the balances mapping
    function getSize() external view returns (uint) {
        return keys.length;
    }

    // Getting the values in the balances mapping

    // The first element
    function first() external view returns (uint) {
        return balances[keys[0]];
    }

    // The last element
    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    // The ith element
    function get(uint _i) external view returns (uint) {
        return balances[keys[_i]];
    }
}
