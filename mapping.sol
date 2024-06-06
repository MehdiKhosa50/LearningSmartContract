// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Mapping {
    // Address of the contract deployer
    address public minter;

    // Mapping to store the amount for each address
    mapping(address => uint) public amountOf;

    // Constructor to set the contract deployer as the minter
    constructor() {
        minter = msg.sender;
    }
    
    // Function to set the balance for a specific address
    function setBalance(address _address, uint _amount) public {
        amountOf[_address] += _amount;
    }
}