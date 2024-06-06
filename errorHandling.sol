// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank {
    // Mapping to store balances of addresses
    mapping(address => uint) balanceOf;

    // Function to add balance to the caller's account
    function addBalance(uint _toAdd) public returns(uint) {
        balanceOf[msg.sender] += _toAdd;
        return balanceOf[msg.sender];
    }

    // Function to get the balance of the caller
    function getBalance() public view returns(uint) {
        return balanceOf[msg.sender];
    }

    // Function to transfer balance to another address
    function transfer(address recipent, uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance"); // Check for sufficient balance
        require(msg.sender != recipent, "You can't Fund Yourself"); // Prevent self-funding
        uint senderPreviousBalance = balanceOf[msg.sender];
        balanceOf[msg.sender] -= amount;
        balanceOf[recipent] += amount;
        assert(balanceOf[msg.sender] == senderPreviousBalance - amount); // Check for correct balance update
    }
}