/*                 Pairing Addresses Assignment

Nested mapping can provide many powerful solutions when it comes to working with addresses in Solidity.

It is time to put your new knowledge to the test.

Observe the following contract which has functionality to remove a spender address paired with an owner address:*/


pragma solidity ^0.8.0;
 
contract allowance {
 
    //this function removes the spenders allowance
    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    }
}

/*Your assignment is to build out the rest of the contract functionality. Create a Contract, using nested mapping, to pair two contract addresses together (an address owner and an address spender) with a value of integers to keep track of their index.

One you have successfully set up the map, add additional contract functionality so that the contract can pair up new addresses together (owner and spender) as well as retrieve their mapping value.

Once you've completed the assignment post a screenshot or upload the file solution in the #solidity channel in our online school discord DPO and share your skills with our community!

Good luck!!*/

//                MY SOLUTION
pragma solidity ^0.8.0;
 
contract allowance {
mapping (address => mapping (uint => SAddress)) public OwnerSpender;

struct SAddress{
    string title;
    uint amout; 
}

function Addresses(address _addrOwner, uint _amount1, address _addrSpender, uint _amount2){

    OwnerSpender[msg.sender][_amount1] = SAddress(address _addrOwner);
    OwnerSpender[_amount2] = SAddress(address _addrSpender);
}
    //this function removes the spenders allowance
    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    }
}

