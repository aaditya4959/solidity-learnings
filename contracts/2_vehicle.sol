// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract Vehicle {

    string category;

    constructor (string memory _category){
        category = _category;
    }

    function description() public pure virtual returns (string memory){
        return "This is a vehicle contract";
    }
}