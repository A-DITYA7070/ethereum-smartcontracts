
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract DataTypes {

    // bool public flag=true;
    // uint8 public u=8;
    // int8 public x=-4;
    // uint16 public val=200;
    // uint public val2=12399044;

    // int public minInt = type(int).min;
    // int public maxInt = type(int).max;

    // uint public minUint = type(uint).min;
    // uint public maxUint = type(uint).max;

    // address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    enum FreshJuice {small,medium,large}
    FreshJuice choice;
    FreshJuice constant defaultChoice=FreshJuice.medium;

    function setLarge() public {
        choice=FreshJuice.large;
    }

    function setSmall() public {
        choice=FreshJuice.small;
    }

    function setMedium() public {
        choice=FreshJuice.medium;
    }

    function getChoice() view public returns(FreshJuice){
        return choice;
    }

    function getDefaultChoice() public pure returns (uint){
        return uint(defaultChoice);
    }
    
}