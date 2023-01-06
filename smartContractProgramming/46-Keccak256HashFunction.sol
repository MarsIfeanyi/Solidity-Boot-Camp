// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * KECCAK256 HASH FUNCTION
 *
 * Some of the use cases of keccak256 is to sign a signature and come up with a unique Id.
 *
 * It can also be used to create a contract that is protected from front running.
 *
 * Hint: The output of keccak256 hash function is "bytes32"
 *
 */

contract HashFunc {
    function hash(
        string memory text,
        uint num,
        address addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    /**
     * Difference between abi.encode and abi.encodePacked
     *
     * abi.encode, encodes the data into bytes where as abi.encodePacked encodes the data into bytes and also compresses it. The output will be smaller and it reduces some of the information that was contained in abi.encode
     */

    function encode(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    function encodePacked(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    /**
     * Hint: Hash Collision occurs when you pass two dynamic data types into the function abi.encodePacked().
     *
     * To solve this we can replace abi.encodePacked() with abi.encode or alternatively if you have more data rearrange so that so that the dynamic data types are not close to each other
     **/

    function collision(
        string memory text0,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, text1));
    }

    function fixCollision(
        string memory text0,
        uint x,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}
