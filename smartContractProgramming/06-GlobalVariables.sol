// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GlobalVariables {
    /**
     * Global variables stores blockchain information, such as blockchain transactions and account that called the function
     */

    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender; //The person that called this function
        uint timeStamp = block.timestamp;
        uint blockNum = block.number; //current block number
        return (sender, timeStamp, blockNum);
    }
}
