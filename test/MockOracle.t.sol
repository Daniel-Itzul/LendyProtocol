// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MockOracle.sol";

contract MockTest is Test {
    MockOracle public mockOracle;

    function setUp() public {
        mockOracle = new MockOracle();
    }

    function testLinkAddress() public {
        mockOracle.linkAddress("f25nml2cfbljvn4goqtclhifepvfnicv6g7mfmmvq","9b01220c2a53893fc4ba690a7cc4897b542729a19406abe2aeca7d4c85cdcdbe7c65633fab4065a140612f18939fc6032c79a422f3a182d009e9c9b9147af30f");
        assertEq(mockOracle.getLinkedAddress(), "f25nml2cfbljvn4goqtclhifepvfnicv6g7mfmmvq");
    }

    function testPushStorageDeal() public {
        mockOracle.linkAddress("f25nml2cfbljvn4goqtclhifepvfnicv6g7mfmmvq","9b01220c2a53893fc4ba690a7cc4897b542729a19406abe2aeca7d4c85cdcdbe7c65633fab4065a140612f18939fc6032c79a422f3a182d009e9c9b9147af30f");
        mockOracle.pushStorageDeal("Fx001289312312",1667818732, 1667818732, 1000, 0);
    }

}