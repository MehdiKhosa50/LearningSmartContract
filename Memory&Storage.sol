// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MemoryAndStorage {
    // Mapping to store user information by user ID
    mapping(uint => User) users;

    // Struct to define a user with an ID and balance
    struct User {
        uint id;
        uint balance;
    }

    // Function to add a new user with a specific ID and balance
    function addUser(uint id, uint balance) public {
        users[id] = User(id, balance);
    }

    // Function to update the balance of an existing user
    function updateBalance(uint id, uint balance) public {
        User storage user = users[id];
        user.balance = balance;
    }

    // Function to get the balance of a user by ID
    function getBalance(uint id) public view returns (uint) {
        return users[id].balance;
    }
}