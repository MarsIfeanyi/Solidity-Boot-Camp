pragma solidity >=0.7.0 <0.9.0;

/*
ABSTRACT CONTRACTS: An abstract Contract is a contract which contains at least one function without any implementation. 
Hint: An abstract contract is used as a base contract. 
Generally an abstract contract contains both implemented as well as abstract functions. 
Derived contract will implement the abstract function and use the existing functions as and when required. */

//An abstract contract without {} in the function definition, thus the keyword abstract in the contract definition
abstract contract Z {
    // since the function has no implementation we should mark it as virtual
    function y() public view virtual returns (string memory);
}

//An abstract contract with {} in the function definition, thus the absence of abstract in the contract definition
contract Member {
    // state variables
    string name;
    uint256 age = 3;

    /*this function makes it abstract since it has no body ie the content of the {} is empty. when you use an empty {} in the function, then no need of putting abstract in the contract definition name.*/
    function setName() public virtual returns (string memory) {}

    // if i define one more function -
    function returnAge() public view returns (uint256) {
        return age;
    }
}

// derived contract

contract Teacher is Member {
    function setName() public view override returns (string memory) {
        return "Francesca";
    }
}

/*
                    Exercise:
1. Create an abstract base contract called Calculator with a read only public function that returns integers 
2. Create a derived contract called Test which derives the Calculator contract and can calculate 1 + 2 and return the result 

*/

contract Calculator {
    function getResult() public view virtual returns (uint256) {}
}

contract Test is Calculator {
    function getResult() public view override returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
