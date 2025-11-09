// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Map {
    mapping (address => string ) public names;

    function addName ( string memory _name ) public {
        names[msg.sender] = _name;
    }
    
    function getName (address _addr) public view returns(string memory) {
        return names[_addr];
    }
}