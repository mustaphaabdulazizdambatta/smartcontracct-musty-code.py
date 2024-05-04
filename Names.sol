// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract players_names {
    string public player;
    uint256 numbers;

    function players(string memory player_name, uint256 players_numbers) public {
        player = player_name;
        numbers = players_numbers;
    }
}