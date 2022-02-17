/*  Exercise (Secure the Random Functionality From Miner Manipulation): 
1. Create a contract Oracle with an address datatype called admin and a public integer called rand. 
2. Create a constructor and set the admin to the current caller. 
3. Write a function which takes the input of an integer and sets the state variable rand to that integer. 
4. Require that the current caller must equal the admin.
5. Set the Oracle contract to a new variable called oracle in the GenerateRandomNumber contract (hint calling contracts)
6. Write a constructor in the GenerateRandomNumber contract which sets the oracle to a deployment address of the Oracle 
7. Modify the hash return so that the miners greatly lesson control manipulation to the random generation. 
8. Successfully deploy and test the results.*/

pragma solidity >=0.7.0 <0.9.0;

// Oracles are the dynamically changing datas that we feed into smart contracts, they databases that feeds live information to the smart contracts.

contract Oracle {
    address admin;
    uint256 public rand;

    constructor() public {
        //setting admin to current caller.
        admin = msg.sender;
    }

    //function that takes inputs and sets
    function feedRand(uint256 _rand) external {
        // requires that current caller must be equal to admin
        require(msg.sender == admin);
        rand = _rand;
    }
}

contract GenerateRandomNumber {
    // Setting the Oracle contract to a new variable, oracle (inheritance)
    Oracle oracle;

    constructor(address oracleAddress) public {
        // Setting the oracle to a deployment address of the Oracle
        oracle = Oracle(oracleAddress);
    }

    //Modifing the hash return so that the miners greatly lesson control manipulation to the random generation

    function randMod(uint256 range) external view returns (uint256) {
        /* To grab information from the blockchain randomly to generate random numbers - we need something dynamically changing, thus we use "abi.encodePacked". abi.encodePacked concatonates arguments nicely*/
        //keccak256 = Cryptographic hash function
        //  Oracle adds additional security for our generator
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        oracle.rand(),
                        block.timestamp,
                        block.difficulty,
                        msg.sender
                    )
                )
            ) % range; // % = Modulo
    }
}
