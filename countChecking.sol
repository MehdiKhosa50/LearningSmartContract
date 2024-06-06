// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    // State variable to store the count
    uint public count;

    // Function to increment the count by 1
    function increment() public {
        count += 1;
    }

    // Function to decrement the count by 1
    function decrement() public {
        count -= 1;
    }
}