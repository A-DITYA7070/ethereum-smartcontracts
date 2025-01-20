// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// contract Task{
//     string data = "I am Aditya Raj";
//     string[] nums=["Bockchain","Ethereum","Polkadot","AdityaFarm","Bitc$in","Solana"];

//     function addMe(string memory a,string memory b) public {
//         nums.push(a);
//         nums.push(b);
//     }

//     function returnMultipleValues() public returns(uint,bool,string memory,string[] memory){
//         this.addMe("Aditya raj", "Building my own cryptocurrency");
//         return (1,true,data,nums);
//     }

//      function returnMultipleValue() public view returns(uint,bool,string memory,string[] memory){
//         return (1,true,data,nums);
//     }
// }


contract Task {
    string public data = "I am Aditya Raj";
    string[] public nums;

    constructor() {
        // Initialize the array in the constructor
        nums.push("Blockchain");
        nums.push("Ethereum");
        nums.push("Polkadot");
        nums.push("AdityaFarm");
        nums.push("Bitc$in");
        nums.push("Solana");
    }

    function addMe(string memory a, string memory b) internal {
        nums.push(a);
        nums.push(b);
    }

    function addNewValues(string memory a, string memory b) public {
        // Expose the functionality to add values
        addMe(a, b);
    }

    function returnMultipleValues() public view returns (uint, bool, string memory, string[] memory) {
        // Return multiple values without modifying the state
        return (1, true, data, nums);
    }
}
