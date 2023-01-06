// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * VERIFY SIGNATURE
 *
 * The process of verifying signature using solidity is in 4 steps:
 * 0. message to sign
 * 1. hash(message)
 * 2. sign(hash(message), private key) | offchain using the wallet
 * 3. ecrecover(hash(message), signature) == signer... Check that the signer is actually equal to the signer that signed the message
 */

contract VerifySig {
    // address _signer is the address we expect ecrecover to return

    // 0: message to sign
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sig
    ) external pure returns (bool) {
        // 1: Hash(message)... The hash returned by keccak256 is bytes32
        bytes32 messageHash = getMessageHash(_message);

        // 2: sign(hash(message), private key)
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        // 3: ecrecover(hash(message), signature) == signer
        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(
        string memory _message
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(
        bytes32 _messageHash
    ) public pure returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            ); // This is the actuall message that is signed when you sign a message offchain... \n32 is the size of the signed message
    }

    function recover(
        bytes32 _ethSignedMessageHash,
        bytes memory _sig
    ) public pure returns (address) {
        // splitting the returned signature into 3 parts... The "r" and "s" parameters are cryptographic parameters used for digital signatures... The parameter "v" is something unique to ethereum

        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function _split(
        bytes memory _sig
    ) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        // We do a quick check to make sure that the signature length is equal to 65... Why 65? because bytes32 + bytes32 + uint8 = 65... uint8 = 1 byte

        require(_sig.length == 65, "invalid signature length");

        // Hint: _sig is a dynamic data because it has a dynamic length... VIP: for dynamic data type the first 32 bytes stores the length of the data... mload = load to memeory

        assembly {
            r := mload(add(_sig, 32)) // we skip the first 32 bytes by using add()... Here we are basically saying from the pointer of _sig, skip the first 32 bytes because it holds the length of the array, after skipping the first 32 bytes, store the value for "r" in the next 32 bytes

            s := mload(add(_sig, 64)) // skip the first 32 because it hold the length and also skip the next 32 because it store the values of "r", store the value for "s" in the next 32 (32+32 = 64)

            v := byte(0, mload(add(_sig, 96))) // skip the first 32, the next 64 and store the value of "v" in the next 32 bytes ( 64+32 = 96), however, get the first byte from the 32 bytes after 96, byte(0,.....)
        }
    }
}
