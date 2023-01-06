// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
        // function selector is the frist 4 btye of the hash of the function

        return bytes4(keccak256(bytes(_func)));
    }
} // Hint: When deploy this contrac t and call the getSelector() with "transfer()" ie function in the Receiver contract we will get same 0xa9059cbb... This is basically how a data is encoded when you call a smart contract, the first 4 bytes encodes the function to call, by taking the keccak256 of the function signature and takes the first 4 bytes. The rest of the data encodes the parameters to pass to the function

contract Receiver {
    event Log(bytes data);

    // Hint: the first 4 bytes encode the function to call

    function transfer(address _to, uint _amount) external {
        emit Log(msg.data);

        // 0xa9059cbb ... funtion to call ie transfer
        //0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc ... address that was passed it... This is the function selector
        //400000000000000000000000000000000000000000000000000000000000000c8 ... the amount that was passed in
    }
}
