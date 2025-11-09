// SPDX-Licence-Identifier: UNLICENCED

pragma solidity ^0.8.0;
import "./2_vehicle.sol";

contract Car is Vehicle{

    uint public numberOfTyres;

    constructor (string memory _category , uint32 _numberOfTyres) Vehicle(_category) {
        numberOfTyres = _numberOfTyres;
    }

    function description() public pure override returns (string memory){
        return "This is from Car Contracts";
    }
}   