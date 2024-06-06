// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Array {
    // State variable to store array of unsigned integers
    uint[] public array;

    // Function to add an element to the array
    function addElement(uint num) public {
        array.push(num);
    }

    // Function to get the current size of the array
    function size() public view returns(uint) {
        return array.length;
    }

    // Function to remove an element at a specific index
    function removeElement(uint index) public {
        require(index < array.length, "Index out of bounds"); // Check if index is within bounds
        delete array[index]; // Set the element at index to its default value (0 for uint)
    }
}
