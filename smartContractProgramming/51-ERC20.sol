// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    // this function detrermines how much a spender is allowed to spend by the owner of the Token
    function allowance(
        address owner,
        address spender
    ) external view returns (uint);

    // The holder of the token allows another account to spend or transfer token on his behalf
    function approve(address spender, uint amount) external returns (bool);

    // once the owner of the token has approved and allowed a spender on his behalf, then you can call this function to transfer the token
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

// Creating ERC20 Token using the Interface

contract ERC20 is IERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    // mapping of owner to spender to amount
    // owner => spender => amount
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimal = 18;

    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // The holder of the token allows another account to spend or transfer token on his behalf
    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }

    // once the owner of the token has approved and allowed a spender on his behalf, then you can call this function to transfer the token
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount; // Hint: if sender has't approved, msg.sender then this will fail
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transfer(sender, recipient, amount);

        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;

        emit Transfer(address(0), msg.sender, amount);
    } // Hint: When you are minting are are zero address to msg.sender

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
    } // Hint: when you are burning are transfering from msg.sender to zero address

    // VIP: mint() and burn() are not part of the ERC20 Token standard but you will usually see them.
}
