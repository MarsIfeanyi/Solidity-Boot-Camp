// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AccessControl {
    // events
    event GrantRole(bytes32 indexed role, address indexed account);
    event RevokeRole(bytes32 indexed role, address indexed account);

    // role => account => bool
    mapping(bytes32 => mapping(address => bool)) public roles; // here we define the role as bytes32 because we are going to hash the role

    // Hint: We make this roles private to save some gas... You can make it public to get the hash of the ADMIN and USER and then  turn it back to private
    // 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    // bytes32: 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    // Modifier
    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not authorized");
        _;
    }

    // grant admin role to msg.sender. when the contract is deployed... Thus the deployer of this contract will be able to call the grantRole() to give other roles to other accounts

    constructor() {
        _grantRole(ADMIN, msg.sender);
    }

    function _grantRole(bytes32 _role, address _account) internal {
        // Updating the mapping... Grant role to this account
        roles[_role][_account] = true; // nested mapping

        emit GrantRole(_role, _account);
    }

    // this external function can only be called if the msg.sender has the ADMIN role
    function grantRole(
        bytes32 _role,
        address _account
    ) external onlyRole(ADMIN) {
        _grantRole(_role, _account);
    }

    function revokeRole(
        bytes32 _role,
        address _account
    ) external onlyRole(ADMIN) {
        roles[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }
}
