// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Example{
    mapping (address => uint) public mp;

    function getMap(address addr) public view returns(uint){
        return mp[addr];
    }

    function setMap(address _addr,uint _i) public {
        mp[_addr] = _i;
    }

    function removeMap(address _addr) public {
        delete mp[_addr];
    }
}