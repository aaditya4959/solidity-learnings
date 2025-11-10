// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


contract Events {
    event Transfer(address indexed from , address indexed to, uint value);

    function transfer (address to , uint value ) public {
        emit Transfer( msg.sender, to, value);
    }
}