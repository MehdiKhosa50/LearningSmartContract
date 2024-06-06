// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./ownable.sol";

contract Kill is Owner {
    // Function to destroy the contract and send remaining funds to the owner
    function kill() public onlyOwner {
        address payable receiver = payable(msg.sender);
        selfdestruct(receiver);
    }
}