// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract StudentDetails {

    struct Book{
        string title;
        string author;
        uint bookId;
        uint price;

    }

    Book book1;

    function setBook(string memory title,string memory author,uint bookId,uint price) public {
        book1=Book(title,author,bookId,price);
    }

    function getBookDetails() view public returns(string memory,string memory,uint){
        return (book1.title,book1.author,book1.price);
    }
    
}
