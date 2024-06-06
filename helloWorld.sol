// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

contract helloWorld {
    // Function to return a greeting message
    function hello() public pure returns(string memory) {
        return "Hello from SmartContract";
    }
}