// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Will {
    address public owner;
    address public recipient;
    uint public pingTime = block.timestamp;
    bool public pinged = true;

    constructor(address _owner, address _recipient){
        owner = _owner;
        recipient = _recipient;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier withinYear {
        require(block.timestamp <= pingTime + 365 days, "The will has expired");
        _;
    }

    
    function changeRecipient(address _newRecipient) public onlyOwner {
        recipient = _newRecipient;
    }

    
    function ping() public onlyOwner withinYear {
        pinged = true;
        pingTime = block.timestamp;
    }

    
    function claimInheritance() public {
        require(block.timestamp > pingTime + 365 days, "Owner is still active");
        require(msg.sender == recipient, "Only the recipient can claim");

        owner = recipient;   // Transfer ownership
    }
}
