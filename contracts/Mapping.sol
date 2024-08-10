// SPDX-License-Identifier:
pragma solidity ^0.8.0;

contract MyConctract {
  //Mappings

  mapping(uint => string) names;
  mapping (uint => Book) public books;
//nested mapping 
mapping(address => mapping(uint => Book))public myBooks;

    struct Book{
        string title;
        string author;
    }

  constructor () public{
    names[1] = 'salma';
    names[2] = 'john';
    names[3] = 'susan';

  }

  function addBook (uint _id,
   string memory _author,
    string memory _title ) public{
    books[_id] = Book(_author,_title);

  }
  //nested mappings
  function addMyBook (uint _id,
   string memory _author,
    string memory _title ) public{
   myBooks[msg.sender][_id]= Book(_title,_author);

  }

}