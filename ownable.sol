// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Owner {
    // Address of the contract owner
    address owner;

    // Modifier to restrict access to the owner
    modifier onlyOwner {
        require(msg.sender == owner, "Only Bank Owner");
        _;
    }

    // Constructor to set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }
}