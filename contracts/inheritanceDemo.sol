// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// contract Computer{
//     function show() public pure virtual  returns(string memory){
//         return "I am changing the world";
//     }

//     function father() internal pure returns(string memory){
//         return "Charls Babbage is my father";
//     }
// }

// contract Laptop is Computer{
//     function show() public pure override  returns(string memory){
//         return super.show();
//     }

//     function bestCompany() internal pure returns(string memory){
//         return "I am the best company";
//     }
// }

// contract SmartPhone is Laptop {
//     function getInternalCompany() public pure returns(string memory){
//         return bestCompany();
//     }

//     function getFather() public pure returns(string memory){
//         return father();
//     }


// }


// multiple inheritence.

contract P1{
    function show() pure public virtual returns(uint){
        return 1;
    }

}

contract P2{
    function show() pure public virtual  returns(uint){
        return 2;
    }

}

contract P3 is P1,P2{
    function show() pure public override(P1,P2)  returns(uint){
        return super.show();
    }

}