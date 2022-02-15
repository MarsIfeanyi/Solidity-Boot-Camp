pragma solidity >=0.7.0 <0.9.0;

contract nestedMapping {
    // Nested Mapping Syntax = mapping(key =>mapping(key2 => value2)) nestedMap
    mapping(address => mapping(uint256 => Movie)) public myMovie; //Nested Mapping

    struct Movie {
        string title;
        string director;
    }

    function addMyMovie(
        uint256 id,
        string memory title,
        string memory director
    ) public {
        //setting it up specifically to an address ie using msg.sender (Sends only to a specific address)
        myMovie[msg.sender][id] = Movie(title, director); //for nested mapping
        // msg.sender is a global variable accessible throughout solidity which captures the address that
        // is calling the contract
    }
}
