

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract Counter{
    uint count; //unsigned int starts from 0
    
    function Increment() public {
        count++;
    }

    function Decrement() public {
        count--;
    }

    function getCount() public view returns(uint){
        return count;
    }

    function abc() public pure returns(uint) {
        return 2+3;
    }

}