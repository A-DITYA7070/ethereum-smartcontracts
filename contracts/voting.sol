// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract voting{
    struct Candidate{
        uint id;
        string name;
        string party;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint public countCandidates;
    uint256 public votingStart;
    uint256 public votingEnd;

    // returns candidate id;
    function addCandidate(string memory name,string memory party) public returns(uint) {
        countCandidates++;
        candidates[countCandidates] = Candidate(countCandidates,name,party,0);
        return countCandidates;
    }

    function vote(uint candidateId) public {
        require((votingStart <= now) && (votingEnd > now));
        require(candidateId > 0 && candidateId <= countCandidates);
        require(!voters[msg.sender]);

        voters[msg.sender] = true;
        candidates[candidateId].voteCount++;
    }

    
}