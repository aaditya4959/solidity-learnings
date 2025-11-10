// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Persons {

    struct Person {
        string name;
        uint age;
        address add;
    }

    mapping( address => Person ) persons;

    function setPerson (string memory _name, uint _age) public {
        persons[msg.sender] = Person({
            name : _name,
            age : _age,
            add : msg.sender
        });
    }


    function getPerson () public view returns (string memory, uint, address){
        Person memory person = persons[msg.sender];
        return (person.name, person.age, person.add);
    }
}