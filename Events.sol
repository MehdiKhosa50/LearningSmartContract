// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank {
    // Mapping to store balances of addresses
    mapping(address => uint) balanceOf;
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

    // Event to log balance additions
    event addEventBalance(uint amount, address depositedTo);

    // Function to add balance to the caller's account, restricted to the owner
    function addBalance(uint _toAdd) public onlyOwner returns(uint) {
        balanceOf[msg.sender] += _toAdd;
        emit addEventBalance(_toAdd, msg.sender);
        return balanceOf[msg.sender];
    }

    // Function to get the balance of the caller
    function getBalance() public view returns(uint) {
        return balanceOf[msg.sender];
    }

    // Function to transfer balance to another address, restricted to the owner
    function transfer(address recipent, uint amount) public onlyOwner {
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance"); // Check for sufficient balance
        require(msg.sender != recipent, "You can't Fund Yourself"); // Prevent self-funding
        uint senderPreviousBalance = balanceOf[msg.sender];
        balanceOf[msg.sender] -= amount;
        balanceOf[recipent] += amount;
        assert(balanceOf[msg.sender] == senderPreviousBalance - amount); // Check for correct balance update
    }
}