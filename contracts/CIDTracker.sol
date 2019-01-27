pragma solidity ^0.5.0;

import "./interfaces/ICIDTracker.sol";

contract CIDTracker is ICIDTracker {

    address owner;

    struct CIDData {
        address owner;
        string ipfsCID;
    }

    mapping(uint => CIDData) fullCIDData;
    uint numberOfCIDs = 0;

    event CIDAdded(string ipfsCID);

    constructor() public {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function addCID(string memory ipfsCID) public {
        require(bytes(ipfsCID).length == 46, "incorrect length");
        fullCIDData[numberOfCIDs].owner = msg.sender;
        fullCIDData[numberOfCIDs].ipfsCID = ipfsCID;
        numberOfCIDs++;
        emit CIDAdded(ipfsCID);
    }
}
