// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract PeopleStore {

    uint256 favoriteNumber;

    People[] public people;

    mapping(string => uint256) public nameTofavoriteNumber;
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // function addPeople(string memory _name, uint256 _favoriteNumber) public {
    //     People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
    //     people.push(newPerson);
    // }

     function addPeople(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameTofavoriteNumber[_name] = _favoriteNumber;
    }
}