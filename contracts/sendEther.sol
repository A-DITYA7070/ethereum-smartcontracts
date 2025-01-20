// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// Payable is modifier which is used in function to transfer ethers (i.e send/recieve ethers)


contract SendEther{
    mapping(address => uint)balance;

    function addBalance(uint amount) public {
        balance[msg.sender] += amount;
    }

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }

    function transferBalance(address to,uint _amt) payable  public {
        balance[msg.sender] -= _amt;
        balance[to] += _amt;
    }


     function withdraw(uint256 _amt) public payable {
        require(balance[msg.sender] >= _amt, "Insufficient balance");

        balance[msg.sender] -= _amt;
        payable(msg.sender).transfer(_amt);
    }

    //Fallback function to recieve ethers from EOA or other smart contract.
    receive() external payable { 
        balance[msg.sender] += msg.value;
    }

}