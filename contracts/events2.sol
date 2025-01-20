// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract EVENTS_IN_SOL {
    event Aditya(address indexed addr,uint a,string str);
    event Log();
    function testEvents() public {
        emit Aditya(msg.sender,1,"I am the man");
        emit Log();
    }
}