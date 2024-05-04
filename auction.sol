pragma solidity ^0.8.0;

contract Auction {
    address payable public owner;
    uint public auctionEndTime;
    uint public minBidIncrement;
    uint public highestBid;
    address public highestBidder;
    mapping (address => uint) public bids;
    
    
    constructo
    owner = payable(msg.sender);
        auctionEndTime = block.timestamp + 30 minutes; // 30 minutes auction duration
        minBidIncrement = 0.1 ether; // minimum bid increment
}


















    
