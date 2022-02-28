pragma solidity >=0.7.0 <0.9.0;

contract RestrictedAcces {
    //initializing the state variables to the current caller
    address public owner = msg.sender;

    /*write a modifier called onlyBy that will require the current caller to be equal to an account address which we set as an input in the modifier and if the requirement fails send a message that says - Sender not authorized!*/

    //MyHint: onlyBy, means that only the mentioned caller can call this function.
    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender not authorized!");
        _;
    }

    /* write a function that will change the owner address.
 MyHint: Owner was our state variable address, now change it to a new address using a function */
    function changeOwnerAddress(address _newAddress) public onlyBy(owner) {
        owner = _newAddress;
    }
}
