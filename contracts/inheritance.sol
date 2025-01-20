// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// interface is just like template, we can share to implement all functionalities.
interface phoneTemplateContract {
    function camera() external view;
    function images() external;
    function systemInformation() external returns(string memory);
    function callData() external;
}

contract Nothing is phoneTemplateContract{
    string systemInfo;
    
    // constructor in solidity runs only once when the contract is deployed on the network.
    constructor(){
        systemInfo="Nothing -> 16GB RAM - 256 GB ROM -> 5000mah";
    }

    function camera () public  view{
        
    }

    function images() public  {

    }

    function systemInformation() public view returns(string memory){
        return systemInfo;
    }

    function callData() public {

    }

}