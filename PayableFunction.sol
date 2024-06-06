// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./ownable.sol";
import "./SelfDestruct.sol";

contract Bank is Owner, Kill {
    // Mapping to store balances of addresses
    mapping(address => uint) balanceOf;
    // Variable to store the total balance in the bank
    uint totalBalance;
    // Array to store addresses of depositors
    address[] public depositers;

    // Event to log balance additions
    event addEventBalance(uint amount, address depositedTo);

    // Function to deposit Ether into the bank
    function Deposit() payable public returns(uint) {
        balanceOf[msg.sender] += msg.value;
        totalBalance += msg.value;
        emit addEventBalance(msg.value, msg.sender);
        return balanceOf[msg.sender];
    }

    // Function to get the balance of the caller
    function getBalance() public view returns(uint) {
        return balanceOf[msg.sender];
    }

    // Function to get the total balance in the bank
    function getTotalBalance() public view returns(uint) {
        return totalBalance;
    }

    // Function to transfer balance to another address, restricted to the owner
    function transfer(address recipent, uint amount) public onlyOwner {
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance"); // Check for sufficient balance
        require(msg.sender != recipent, "You can't Fund Yourself"); // Prevent self-funding
        uint senderPreviousBalance = balanceOf[msg.sender];
        payable(recipent).transfer(amount); 
        balanceOf[msg.sender] -= amount;
        balanceOf[recipent] += amount;
        assert(balanceOf[msg.sender] == senderPreviousBalance - amount); // Check for correct balance update
    }
}