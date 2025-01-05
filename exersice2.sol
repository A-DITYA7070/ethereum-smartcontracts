

pragma solidity >=0.8.2 <0.9.0;



contract addition{
    uint x;
    uint y;
    uint result;

    function set1(uint first) public{
        x=first;
    }

    function set2(uint second) public{
        y=second;
    }

    function add() private {
        result=uint(x+y);
    }

    function showResult() view public returns(uint){
        return result;
    }
    
}