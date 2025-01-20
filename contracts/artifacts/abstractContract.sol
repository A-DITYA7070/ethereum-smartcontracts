// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// abstract contract can not be deployed it's just like template.
abstract contract Demo{
    event  dummyEvent(string message);
    function callMe() virtual public {}

    function callMe2() public  {
        emit dummyEvent("Inside dummy contract");
    }
}

contract Demo2 is Demo {
    function callMe() public override  {
        emit dummyEvent("Inside Demo2 contract");
    }
}