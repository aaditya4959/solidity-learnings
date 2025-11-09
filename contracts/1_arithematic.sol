// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract Arithematic {

    uint32 number;

    constructor(uint32 _initNumber){
        number = _initNumber;
    }

    function add(uint32 _addNumber) public {
        number += _addNumber;
        getNumber();
    }

    function sub(uint32 _subNumber ) public {
        number -= _subNumber;
        getNumber();
    }

    function mul(uint32 _mulNumber) public {
        number *= _mulNumber;
        getNumber();
    }

    function div(uint32 _divNumber ) public {
        number /= _divNumber;
        getNumber();
    }

    function getNumber() public view returns (uint32){
        return number;
    }
}