// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Structures {
    struct Person {
        string name;
        uint age;
    }

    Person public p1;

    function setPerson (string memory _name , uint _age) public {
        p1.name = _name;
        p1.age = _age;
    }

    function getPerson () public view returns (string memory, uint){
        return (p1.name, p1.age);
    }
}