/* How to detect if an address is a smart contract or not using Assembly.
Thus if the size is empty or 0, then it is not a smart contract but if the size is greater than Zero then it is a smart contact.
*/

pragma solidity >=0.7.0 <0.9.0;

contract DetectSmartContract {
    function DetectSize() external {
        uint256 size;
        address addr = msg.sender;

        assembly {
            size := extcodesize(addr)
        }
        if (size > 0) {
            return true;
        } else {
            return false;
        }
    }
}
