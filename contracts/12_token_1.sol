// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// As ERC-20 is aready written so we can write this contract by extending the abse ERC-20 only.


contract BirCoin {
    string public name = "BirCoin";
    uint public supply = 0;
    address public owner;

    mapping(address => uint) public balances;
    // the allowance mapping
    mapping(address => mapping( address => uint ) ) public allowance;

    //events according to the ERC-20

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approve(address indexed owner, address indexed spender, uint256 value);

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

    //Allowance Function
    function allow (address to, uint amount ) public {
        allowance[msg.sender][to] += amount;
        emit Approve(msg.sender, to, amount);
    }

    // Transfer allowance function 
    function transferFrom( address from , address to, uint amount ) public {
        uint balance = balances[from];
        require(balance >= amount , "Balance is insufficient");
        uint allowedAmount = allowance[from][msg.sender];
        require(allowedAmount >= amount );
        balances[from] -= amount;
        balances[to] += amount;
        allowance[from][msg.sender] -= amount;
        emit Transfer(from, to, amount);
    }

    function transfer( address to , uint amount ) public {
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