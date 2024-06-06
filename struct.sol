// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CricketTeam {
    // Array to store player data
    Player[] public PlayersData;

    // Struct to define a player with first name, last name, age, and smoker status
    struct Player {
        string firstName;
        string lastName;
        uint age;
        bool isSmoker;
    }

    // Function to add a new player to the team
    function addPlayer(string memory _firstName, string memory _lastName, uint _age, bool _isSmoker) public {
        PlayersData.push(Player(_firstName, _lastName, _age, _isSmoker));
    }
}