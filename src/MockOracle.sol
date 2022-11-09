// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MockOracle {

    int mockPrice;
    address owner;

    struct storageDeal {
        address dealId;
        uint64 startTimestamp;
        uint64 endDate;
        uint128 value;
    }

    storageDeal[10] storageDeals;

    mapping (string => storageDeals) storageProvider;

    constructor (int _mockPrice) {
        mockPrice = _mockPrice;
        owner = msg.sender;
    }

    function latestRoundData() external view returns (uint80, int, uint, uint, uint80) {
        uint80 roundID = 1;
        int price = mockPrice;
        uint startedAt = block.timestamp - 5;
        uint timeStamp = block.timestamp;
        uint80 answeredInRound = 1;
        return (roundID, price, startedAt, timeStamp, answeredInRound);
    }

    function updateMockPrice(int _mockPrice) external {
        require (msg.sender == owner, "Only owner can update price");
        mockPrice = _mockPrice;
    }

}