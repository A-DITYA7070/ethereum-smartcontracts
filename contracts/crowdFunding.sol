// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract CrowdFunding {
    string public name;
    string public description;
    uint256 public goal;
    uint256 public deadline;
    address public owner;
    bool public paused;

    enum CampaignState { Active, Successful, Failed }
    CampaignState public state;

    struct Tier {
        string name;
        uint256 amount;
        uint256 backers;
    }

    struct Backer {
        uint256 totalContribution;
        mapping(uint256 => bool) fundedTiers;
    }

    Tier[] public tiers;
    mapping(address => Backer) public backers;

    modifier onlyOwner {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier campaignOpen {
        require(state == CampaignState.Active, "Campaign is not active");
        _;
    }

    modifier notPaused {
        require(!paused, "Contract is paused");
        _;
    }

    constructor(
        address _owner,
        string memory _name,
        string memory _description,
        uint256 _goal,
        uint256 _durationInDays
    ) {
        name = _name;
        description = _description;
        goal = _goal;
        deadline = block.timestamp + (_durationInDays * 1 days);
        owner = _owner;
        state = CampaignState.Active;
    }

    function checkAndUpdateCampaignState() internal {
        if (state == CampaignState.Active) {
            if (block.timestamp >= deadline) {
                state = address(this).balance >= goal ? CampaignState.Successful : CampaignState.Failed;
            }
        }
    }

    function fund(uint256 _tierIndex) external payable notPaused campaignOpen {
        require(_tierIndex < tiers.length, "Invalid tier");
        require(msg.value == tiers[_tierIndex].amount, "Incorrect amount");

        tiers[_tierIndex].backers++;
        backers[msg.sender].totalContribution += msg.value;
        backers[msg.sender].fundedTiers[_tierIndex] = true;

        checkAndUpdateCampaignState();
    }

    function withdraw() external onlyOwner {
        checkAndUpdateCampaignState();
        require(state == CampaignState.Successful, "Campaign not successful");

        uint256 balance = address(this).balance;
        require(balance > 0, "No balance to withdraw");

        payable(owner).transfer(balance);
    }

    function addTier(string memory _name, uint256 _amount) external onlyOwner {
        require(_amount > 0, "Amount must be greater than 0");
        tiers.push(Tier(_name, _amount, 0));
    }

    function removeTier(uint256 _index) external onlyOwner {
        require(_index < tiers.length, "Tier does not exist");
        tiers[_index] = tiers[tiers.length - 1];
        tiers.pop();
    }

    function refund() external {
        checkAndUpdateCampaignState();
        require(state == CampaignState.Failed, "Refund not available");

        uint256 amount = backers[msg.sender].totalContribution;
        require(amount > 0, "No contribution to refund");

        backers[msg.sender].totalContribution = 0;
        payable(msg.sender).transfer(amount);
    }

    function hasFundedTier(address _backer, uint256 _tierIndex) external view returns (bool) {
        return backers[_backer].fundedTiers[_tierIndex];
    }

    function getTiers() external view returns (Tier[] memory) {
        return tiers;
    }

    function togglePause() external onlyOwner {
        paused = !paused;
    }

    function getCampaignStatus() external view returns (CampaignState) {
        if (state == CampaignState.Active && block.timestamp > deadline) {
            return address(this).balance >= goal ? CampaignState.Successful : CampaignState.Failed;
        }
        return state;
    }

    function extendDeadline(uint256 _daysToAdd) external onlyOwner campaignOpen {
        deadline += _daysToAdd * 1 days;
    }
}
