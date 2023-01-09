// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * In English Auction, the seller sets starting price and ending time and then at the end of the auction, the highest bidder wins
 */

interface IERC721 {
    function transferFrom(address from, address to, uint nftId) external;
}

contract EnglishAuction {
    // event

    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);

    IERC721 public immutable nft;
    uint public immutable nftId;

    address payable public immutable seller;
    uint32 public endAt; // Hint: uint32 can store upto 100yrs from now.

    // keeping track of the state of the auction
    bool public started; // sets to true when the auction starts
    bool public eneded; // sets to true when the auction ends

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(address _nft, uint _nftId, uint _startingBid) {
        nft = IERC721(_nft); // _nft from the input
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        require(msg.sender == seller, "not seller");
        require(!started, "started");

        started = true;
        endAt = uint32(block.timestamp + 60); // block.timestamp is uint256, thus we are converting it to uint32

        // transferring the ownership of the nft from the seller to this contract, so that this contract will own the nft
        nft.transferFrom(seller, address(this), nftId);

        emit Start();
    }

    function bid() external payable {
        require(started, "not started");
        require(block.timestamp < endAt, "ended");
        require(msg.value > highestBid, "value is less than highest bid");

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }
        highestBid = msg.value;
        highestBidder = msg.sender;

        emit Bid(msg.sender, msg.value);
    }

    // function that allows users who are not the highest bidder to withdraw their ETH
    function withdraw() external {
        uint bal = bids[msg.sender];

        // reset the bids mapping before sending ETH. This is to protect from reentrancy. if we transfer ETH before resetting the state variable, then this function will be prone to reentrancy attack
        bids[msg.sender] = 0;

        payable(msg.sender).transfer(bal);

        emit Withdraw(msg.sender, bal);
    }
}
