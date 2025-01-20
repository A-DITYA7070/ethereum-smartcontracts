// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Testing{
    function multipleToReturn() public pure returns(uint,bool,uint){
        return (10,true,45);
    }

    // we can destructure in sol.
    function desctructuringFunc() public pure returns(uint,bool,uint,uint,uint){
        (uint a,bool b,uint c) = multipleToReturn();
        (uint d,,uint e) = (20,10,57);
        return (a,b,c,d,e);
    }
}