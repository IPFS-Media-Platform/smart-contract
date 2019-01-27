pragma solidity ^0.5.0;

contract ICIDTracker {
    function getOwner() public view returns(address);
    function addCID(string memory ipfaCID) public;
}
