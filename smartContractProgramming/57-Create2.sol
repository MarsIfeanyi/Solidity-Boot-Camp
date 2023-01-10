// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * create2 allows you to easily compute the address of the contract that you are going to deploy.
 *
 * Contract address can be precomputed, before the contract is deployed, using create2
 */

contract DeployWithCreate2 {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
}

contract Create2Factory {
    event Deploy(address addr);

    /**
     * DeployWithCreate2 _contract = new DeployWithCreate2(msg.sender);
     *
     * HOW TO DEPLOY A CONTRACT USING CREATE2
     *
     * Hint: To deploy a contract with create2 after the contract name that we are going to be deploying, we put in curl braces and inside the curl braces we specify the salt. The salt is basically a random 32 bytes of our choice, which determines the address of the contract we are going to deploy
     */

    function deploy(uint _salt) external {
        // deploying a contract using the "new" keyword and assign it to the variable "_contract"... ie deploying another contract inside a contract
        DeployWithCreate2 _contract = new DeployWithCreate2{
            salt: bytes32(_salt)
        }(msg.sender);

        emit Deploy(address(_contract));
    }

    /**
     * HOW TO KNOW THE ADDRESS OF THE CONTRACT TO BE DEPLOYED BEFORE WE DEPLOY IT
     *
     * The address of the contract to be deployed using create2 is determined by taking the keccak256, abi.encodePacked, starting off with 0xff, the address of the deployer, the salt and then the keccak256 of the bytecode.
     */

    // function that gets the address of the contract to be deployed
    function getAddress(
        bytes memory bytecode,
        uint _salt
    ) public view returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                _salt,
                keccak256(bytecode)
            ) // Hint: the bytecode here is the bytecode of the contract to be deployed followed by any parameter to the contract
        );
        return address(uint160(uint(hash)));
    }

    // function that gets the bytecode of the contract to be deployed

    function getBytecode(address _owner) public pure returns (bytes memory) {
        bytes memory bytecode = type(DeployWithCreate2).creationCode;

        return abi.encodePacked(bytecode, abi.encode(_owner));
    }
}
