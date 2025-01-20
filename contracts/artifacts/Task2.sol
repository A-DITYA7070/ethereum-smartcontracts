// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// vulnerable contract no proper check for the authorisation means anybody can send the ethers from this sc.
contract Demo {
    address payable public owner;

    // Constructor to set contract owner and accept Ether deposits
    constructor() payable {
        owner = payable(msg.sender);
    }

    // Modifier to restrict access to the owner
    modifier isOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Function to deposit Ether (optional, but allows explicit deposits)
    function deposit() public payable {}

    // Function to withdraw all Ether from the contract (only owner can withdraw)
    function withdraw() public isOwner {
        uint256 amount = address(this).balance;
        require(amount > 0, "No funds available");

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether to another address
    // No proper checks on who can send this ether - anybody can send this ether //modifier isOwner can be used.
    function transferEther(address payable _to, uint256 _amt) public  {
        require(address(this).balance >= _amt, "Insufficient contract balance");
        require(_to != address(0), "Invalid recipient address");

        (bool success, ) = _to.call{value: _amt}("Ether transfered successfully ");
        require(success, "Ether transfer failed");
    }

    function getContractBalance() isOwner public view returns (uint256) {
        return address(this).balance;
    }


    // Fallback function to receive Ether
    receive() external payable {}

}
