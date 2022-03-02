pragma solidity >=0.7.0 <0.9.0;

/*
Solidity provides an option to use assembly language to write inline assembly within Solidity source code.

Assembly is a low level language that allows you to directly manipulate the EVM (more dangerous and not recommended)

EVM = smart contracts are not the real code in the blockchain - solidity code is compiled to a lower level language.

To see the opecode go to:https://ethervm.io/
*/

contract LearnAssembly {
    function addToEVM() external {
        uint256 x;
        uint256 y;
        // uint z = x + y;

        // all of this is compiled to low level instructions (opcodes - in total there is around 100)

        // how to use assembly
        assembly {
            // declares an assembly block
            // inside we can manipulate variables declared outside
            // no semi colon, = is actually := and we can bring in opcodes
            let z := add(x, y)
        }

        // load data for a specific slot
        // let a := mload(0x40)

        // store something temporarily to memory(thus will delete after the function is run)
        //  mstore(a,4) // a = value, 4 = payload

        // persistance storage (Permanent Storage)
        //   sstore(a,100)
    }

    // in EVM everything is stored in slots of 256 bits (a uint occupies one slot) whereas mapping or array is several

    function addToEVM2() public view returns (bool success) {
        uint256 size;
        address addr;

        /*Using Assembly to check whether an address contains any bytes of code or not, thus if it returns true then the address is a contract ie it contains codes, but if it returns false the it is just an address . However a hacker might hide it inside a constructor and it will see the contract as an address */
        assembly {
            size := extcodesize(addr)
        }
        if (size <= 0) {
            return true;
        } else {
            return false;
        }
    }

    /*
Exercise:
The function addToEVM3 is attempting to convert data bytes.
It wants to convert using Solidity a data byte into a fixed bytes size. 
However if you run the code the way it is, it will not compile successfully because explicity type conversions are not allowed from bytes memory to bytes32. 

Use Assemby and the mload to convert the data to bytes 32 sucessfully. 
Hint: Bytes in memory size starts at second slot so 
we need to bring in the add 32 to start at the correct position.

Good luck!
*/

    //  SOLUTION
    function addToEVM3() external view {
        bytes memory data = new bytes(10);

        // we cannot convert this into in a fixed size
        // bytes32 dataB32 = bytes32(data);

        // but if we only care about the first 32 bytes we can use assembly! :)

        bytes32 dataB32;
        assembly {
            // bytes in memory is size so data actually starts at the second slot
            dataB32 := mload(add(data, 32))
        }
    }
}
