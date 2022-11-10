// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MockOracle {

    struct StorageDeal {
        string dealId;
        uint startDate;
        uint endDate;
        uint estimatedRewards;
        uint status;
        bool locked;
    }
    address s_owner;

    //state variables
    mapping ( address => string) s_linkedAddresses;
    mapping ( string => StorageDeal[]) s_storageDeals;

    constructor () {
        s_owner = msg.sender;
    }

    //Oracle functions
    //Public
    function linkAddress (string calldata linkedAddress, string calldata blsSignature) external returns (string calldata) {
        s_linkedAddresses[msg.sender] = linkedAddress;
        return blsSignature;
    }

    //OnlyOwner
    function pushStorageDeal(string calldata dealID, uint startDate, uint endDate, uint estimatedRewards, uint status) external {
        string memory linkedAddress = getLinkedAddress();
        s_storageDeals[linkedAddress].push(StorageDeal(dealID, startDate, endDate, estimatedRewards, status, false));
    }
    //internals 


    //Getter Functions
    function getLinkedAddress() public view returns (string memory){
        return s_linkedAddresses[msg.sender];
    }

    function getStorageDeals () external view returns (StorageDeal[] memory) {
        string memory linkedAddress = getLinkedAddress();
        return s_storageDeals[linkedAddress];
    }

    //modifiers
    modifier onlyOwner() {
        require(msg.sender == s_owner);
        _;
    }


}