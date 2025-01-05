
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract calculator {

    uint result;
    string err = "you are good to go ";

    function getError() view public returns(string memory){
        return err;
    }

    function add(uint x,uint y) public {
        result = 0;
        result = x+y;
    }

    function subtract(uint x,uint y) public {
        // require(x >= y, "Underflow Error: x should be greater than or equal to y.");
        result = 0;
        if(x < y){
            err = "UnderFlow Error X should be greater than or equal to y ";
        }else{
            err = "you are good to go";
            result = x-y;
        }
    }

    function mulitiply(uint x,uint y) public {
        result = 0;
        result=(x*y);
    }

    function divide(uint x,uint y) public {
        result = 0;
        // require(y!=0, "Exception occured y(denominator can not be zero ");
        if(y <= 0 ){
            err = "Exception occured";
        }else{
            err = "You are all good ";
            result = x/y;
        }
    }

    function getResult() view public returns(uint){
        return result;
    }

}