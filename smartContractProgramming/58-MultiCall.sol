// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * The Basic idea of multicall is to have a contract that will call the functions, here func1 and func2 and return both of the result... This helps us to aggregate multiple queries into a single function call.
 */

contract TestMultiCall {
    function func1() external view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function func2() external view returns (uint, uint) {
        return (2, block.timestamp);
    }

    function getData1() external pure returns (bytes memory) {
        // abi.encodeWithSignature('func1()')
        // OR

        return abi.encodeWithSelector(this.func1.selector);
    }

    function getData2() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.func2.selector);
    }
}

contract MultiCall {
    function multiCall(
        address[] calldata targets,
        bytes[] calldata data
    ) external view returns (bytes[] memory) {
        require(targets.length == data.length, "target length != data length");

        // initializing an array of bytes in memory
        bytes[] memory results = new bytes[](data.length);

        // for loop to call each of the target
        for (uint i; i < targets.length; i++) {
            // calling each of the targets
            (bool success, bytes memory result) = targets[i].staticcall(
                data[i]
            ); // Hint: we are using staticall because we want to make this function a view function, and we just want to querry it... however you can remove the "view" and then use "calldata"... VIP: staticcall returns two ouputs; 1. boolean (success or not) and 2. any data that was returned by calling the function
            require(success, "call failed");

            // store the result in the result array if it is successful
            results[i] = result;
        }

        return results;
    }
}
