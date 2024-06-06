// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Admin {
    // State variable to store a message
    string public message;

    // Constructor to initialize the message
    constructor(string memory _message) {   
        message = _message;
    }

    // Function to get the address of the sender
    function senderAddress() public view returns(address) {
        return msg.sender; // Return the address of the caller
    }
}
