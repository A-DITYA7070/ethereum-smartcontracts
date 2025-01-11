// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract InfiniteSOl{
    uint i=0;
    function runIt() public {
        while(true){
            i=i+1;
        }
    }
}