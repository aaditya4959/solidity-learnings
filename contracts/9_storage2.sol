// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

interface Storage {
    function getNum() external view returns (uint);
    function add() external;
}


contract Storage2{

    address private contractAddress;

    constructor(address _contractAddress) {
        contractAddress=_contractAddress;
    }

    function proxyAdd() public  {
        Storage s2 = Storage(contractAddress);

        s2.add();
    }
}

// 0x5e17b14ADd6c386305A32928F985b29bbA34Eff5