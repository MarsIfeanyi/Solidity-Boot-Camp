// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * In English Auction, the seller sets starting price and ending time and then at the end of the auction, the highest bidder wins.
 * 
 * 
 * English auction for NFT.

Auction
- Seller of NFT deploys this contract.
- Auction lasts for 7 days.
- Participants can bid by depositing ETH greater than the current highest bidder.
- All bidders can withdraw their bid if it is not the current highest bid.

After the auction
- Highest bidder becomes the new owner of NFT.
- The seller receives the highest bid of ETH.
 */

interface IERC721 {
    function safeTransferFrom(address from, address to, uint tokenId) external;

    function transferFrom(address, address, uint) external;

    /**
     * Hint: 
     * transferFrom() is a basic function that allows tokens to be transferred from one address to another without any additional safety checks.
     
     safeTransferFrom() includes additional safety checks to ensure the transfer can be completed successfully and make sure the recipient is able to handle the tokens.
     */
}

contract EnglishAuction {
    // events
    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event End(address highestBidder, uint amount);

    // state variables
    IERC721 public immutable nft;
    uint public immutable nftId;

    address payable public immutable seller;
    uint32 public endAt; // Hint: uint32 can store upto 100yrs from now.

    // keeping track of the state of the auction
    bool public started; // sets to true when the auction starts
    bool public ended; // sets to true when the auction ends

    address public highestBidder;
    uint public highestBid; // this is the amount
    mapping(address => uint) public bids;

    constructor(address _nft, uint _nftId, uint _startingBid) {
        // initializing the state variables

        nft = IERC721(_nft); // _nft from the input
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    // function to start the auction, this function will be called outside the contract
    function start() external {
        require(msg.sender == seller, "not seller");
        require(!started, "started");

        started = true;
        endAt = uint32(block.timestamp + 7 days); // block.timestamp is uint256, thus we are converting it to uint32

        // transferring the ownership of the nft from the seller to this contract, so that this contract will own the nft
        nft.transferFrom(seller, address(this), nftId);

        emit Start();
    }

    function bid() external payable {
        require(started, "not started");
        require(block.timestamp < endAt, "ended");
        require(msg.value > highestBid, "value is less than highest bid");

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid; // bids[address] += amount;
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

    function end() external {
        require(started, "not started");
        require(!ended, "ended");
        require(block.timestamp >= endAt, "not ended");

        ended = true;

        // if there is a highestBidder then:
        if (highestBidder != address(0)) {
            // transfer the  ownership of the nft from this contract to the  highestBidder
            nft.transferFrom(address(this), highestBidder, nftId);
            //transfer highestBid to the seller
            seller.transfer(highestBid);
        }
        // if there is no highestBidder, transfer the ownership of the nft back to the seller
        else {
            nft.safeTransferFrom(address(this), seller, nftId);
        }

        emit End(highestBidder, highestBid);
    }
}
