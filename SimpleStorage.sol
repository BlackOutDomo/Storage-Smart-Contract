// SPDX-License-Identifier: MIT

pragma solidity >= 0.6.6;     //for only using compiler version 0.6.6
//pragma solidity ^0.6.0;    diffrent way to write if you want to use any version of compiler 0.6   ex: 0.6.6 or 0.6.7
       
contract SimpleStorage 
{
    uint256 public favoriteNumber; //initialized to 0

    struct People {
        uint256 favoriteNumber;
        string name;  
    }
    //People public person = People({favoriteNumber : 2, name : "Alex"})

    //initialize an array
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    //stores number passed in
    //can be public, external, internal, or private
    function store(uint256 _favoriteNumber) public {  
        favoriteNumber = _favoriteNumber;
    }

    //view functions read off the blockchain
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

     //pure functions do some math but dont dave anything
     function addTogether(uint256 favoriteNumber) public pure{
        favoriteNumber + favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public 
    {
       //add to our people array
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber; 
    }
}