// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract called{
    event callEvent(address sender,address origin,address from);
    function callThis() public{
        emit callEvent(msg.sender, tx.origin, address(this));
    }
}


contract caller{
    function makeCall(address _contractAddr,address apocalypse) public{
        bytes memory data = abi.encodeWithSignature("destroySc(address)", apocalypse);
        (bool success,) = _contractAddr.call(data);
        require(success,"killing contract failed.");
    }
}