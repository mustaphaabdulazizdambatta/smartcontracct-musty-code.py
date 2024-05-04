// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    //this get initialized to 0
    uint256 public favoriteNumber;
  

    struct People{
        uint256 favoriteNumber;
        string name;
    }
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual  {
        favoriteNumber = _favoriteNumber;
        retrieve();
       
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function add() public pure returns  (uint256) {
        return(1+1);
    }

    //0xd9145CCE52D386f254917e481eB44e9943F39138
}