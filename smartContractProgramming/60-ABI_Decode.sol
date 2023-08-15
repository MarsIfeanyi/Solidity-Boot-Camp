// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Application Binary Interface is the interface that specifies how to interact with a deployed smart contract. ABI-encoding is the process of converting a given element from the ABI into bytes so that the EVM can process it.
 *The EVM runs computation on bits and bytes.
 * Encoding is the process of converting structured input data into bytes so that a computer can operate on it. Decoding is the reverse process of converting bytes back into structured data. Sometimes, encoding is also referred to as “serializing”.
 *
 *
 * https://emn178.github.io/online-tools/keccak_256.html
 *
 *
 * Thus, the purpose of encoding is to convert data into the bytes data type that the EVM needs to process data. And decoding brings it back into the human readable structured data that we developers can work with.
 */

contract EncodeDecode {
    // Encode each of  the arguments into bytes
    function encode(
        uint x,
        address addr,
        uint[] calldata arr
    ) external pure returns (bytes memory) {
        return abi.encode(x, addr, arr);
    }

    function decode(
        bytes calldata bytesData
    ) external pure returns (uint x, address addr, uint[] memory arr) {
        (x, addr, arr) = abi.decode(bytesData, (uint, address, uint[]));
    }
}
