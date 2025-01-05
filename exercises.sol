// this is where we code.

pragma solidity >=0.8.2 <0.9.0;

// create a contract that can store the data and return the data back.


// smart contract in sense of solidity is a collection of code (ie its functions) and data (its state) that resides
// at a specific address on the ethereum blockchain.

contract simpleStorage {

    uint storeData; 

    function set(uint x) public {
        storeData = x;
    }

    function get() public view returns (uint) {
         return storeData; 
    }

}