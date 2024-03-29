// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 *
 * DUTCHAUCTION is an auction where the seller sets the price at the start of the auction and the price goes down over time.
 * when the buyer decides that the price is low enough and he buys the auction ends...
 *
 * Here we want to write a dutch auction for an NFT.
 * 
 * 
 * Dutch auction for NFT.

Auction
- Seller of NFT deploys this contract setting a starting price for the NFT.
- Auction lasts for 7 days.
- Price of NFT decreases over time.
- Participants can buy by depositing ETH greater than the current price computed by the smart contract.
- Auction ends when a buyer buys the NFT.
 */

interface IERC721 {
    function transferFrom(address _from, address _to, uint _nftId) external;
}

contract DutchAuction {
    //state variables
    uint private constant DURATION = 7 days;

    IERC721 public immutable nft;
    uint public immutable nftId;

    address payable public immutable seller;
    uint public immutable startingPrice;
    uint public immutable startAt;
    uint public immutable expiresAt;
    uint public immutable discountRate;

    constructor(
        uint _startingPrice,
        uint _discountRate,
        address _nft,
        uint _nftId
    ) {
        seller = payable(msg.sender);
        startingPrice = _startingPrice;
        discountRate = _discountRate;
        startAt = block.timestamp;
        expiresAt = block.timestamp + DURATION;

        require(
            _startingPrice >= _discountRate * DURATION,
            "starting price is less than discount"
        );

        nft = IERC721(_nft);
        nftId = _nftId;
    }

    // function to calcualte the current price of the nft, when the buyer calls the buy function
    function getPrice() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        uint discount = discountRate * timeElapsed;
        return startingPrice - discount;
    }

    function buy() external payable {
        // checks that it hasn't expired yet
        require(block.timestamp < expiresAt, "auction expired");

        uint price = getPrice();
        require(msg.value >= price, "ETH is less than price");

        nft.transferFrom(seller, msg.sender, nftId);

        uint refund = msg.value - price;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }

        // send all the ETH to seller and then close the auction
        selfdestruct(seller);
    }
}
