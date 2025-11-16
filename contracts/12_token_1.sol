// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract BirCoin {
    string public name = "BirCoin";
    uint public supply = 0;
    address public owner;

    mapping(address => uint) public balances;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require ( msg.sender == owner, "Only owner can perform this operation.");
        _;
    }


    function mintTo( address to, uint amount) public onlyOwner {
        balances[to] += amount;
        supply+= amount;
    }

    function sendTo ( address to , uint amount ) public {
        require (amount <= balances[msg.sender], "Balance is insufficient");
        balances[msg.sender] -=amount;
        balances[to] += amount;
    }

    function burn(uint amount ) public {
        uint balance = balances[msg.sender];
        require (balance >= amount, "Balance is insufficient");
        balances[msg.sender] -= amount;
        supply -= amount;
    }

}