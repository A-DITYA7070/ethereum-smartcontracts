// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import { CrowdFunding } from "contracts/crowdFunding.sol";

contract CrowdFundingFactory {
    address public owner;
    bool public paused;

    struct Campaign {
        address campaignAddress;
        address campaignOwner;
        string name;
        uint256 creationTime;
    }

    Campaign[] public campaigns;
    mapping(address => Campaign[]) public userCampaigns;

    modifier onlyOwner {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier notPaused {
        require(!paused, "Factory is paused");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function createCampaign(
        string memory _name,
        string memory _description,
        uint256 _goal,
        uint256 _durationInDays
    ) external notPaused {
        CrowdFunding newCampaign = new CrowdFunding(
            msg.sender,
            _name,
            _description,
            _goal,
            _durationInDays
        );

        Campaign memory campaign = Campaign({
            campaignAddress: address(newCampaign),
            campaignOwner: msg.sender,
            name: _name,
            creationTime: block.timestamp
        });

        campaigns.push(campaign);
        userCampaigns[msg.sender].push(campaign);
    }

    function getUserCampaigns(address _user) external view returns (Campaign[] memory) {
        return userCampaigns[_user];
    }

    function getAllCampaigns() external view returns (Campaign[] memory) {
        return campaigns;
    }

    function togglePause() external onlyOwner {
        paused = !paused;
    }
}
