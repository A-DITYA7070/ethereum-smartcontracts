// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract Events {
    
    event Log(address indexed addr,string message,uint a);
    event Log2();

    function testEvents() public {
        emit Log(msg.sender,"Welcome to Ethereum",1);
        emit Log(msg.sender,"Learning BlockChain",0);
        emit Log2();
    }
}