pragma solidity ^0.8.0;

contract Auction {
    address payable public owner;
    uint public auctionEndTime;
    uint public minBidIncrement;
    uint public highestBid;
    address public highestBidder;
    mapping (address => uint) public bids;

    constructor() public {
        owner = payable(msg.sender);
        auctionEndTime = block.timestamp + 30 minutes; // 30 minutes auction duration
        minBidIncrement = 0.1 ether; // minimum bid increment
    }

    function bid(uint _amount) public {
        require(msg.sender!= owner, "Owner cannot bid");
        require(block.timestamp < auctionEndTime, "Auction has ended");
        require(_amount > highestBid, "Bid must be higher than current highest bid");
        require(_amount - highestBid >= minBidIncrement, "Bid increment is too low");

        highestBid = _amount;
        highestBidder = msg.sender;
        bids[msg.sender] = _amount;
    }

    function withdraw() public {
        require(msg.sender == highestBidder, "Only highest bidder can withdraw");
        require(block.timestamp > auctionEndTime, "Auction has not ended yet");

        highestBidder.transfer(highestBid);
        highestBid = 0;
        highestBidder = address(0);
    }

    function getHighestBid() public view returns (uint) {
        return highestBid;
    }

    function getHighestBidder() public view returns (address) {
        return highestBidder;
    }
}















    
