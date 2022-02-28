pragma solidity >=0.7.0 <0.9.0;

contract RestrictedAcces {
    //initializing the creationTime to the blocks timestamp
    uint256 public creationTime = block.timestamp;
    address public owner = msg.sender;

    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender not authorized!");
        _;
    }
    /*write a modifier called onlyAfter that will require the creationTime to be greater than or equal to an time variable which is set as an input in the modifier and if the requirement fails send a message that says - function is called too early!*/

    //Hint: onlyAfter − called after certain time period.
    modifier onlyAfter(uint256 _time) {
        require(block.timestamp >= _time, "function is called too early!");
        _;
    }

    /*write a function that can disown the current owner, only run the function 4 weeks or 30 seconds after the creation of the contract */

    function disown() public onlyBy(owner) onlyAfter(creationTime + 4 weeks) {
        delete owner;
    }

    /*function disown() public onlyBy(owner) onlyAfter(creationTime + 30 seconds) {
        delete owner;
    }*/
}
