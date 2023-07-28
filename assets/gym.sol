// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Election {
    struct Candidate {
        string name;
        uint256 points;
    }

    struct Voter {
        bool authorised;
    
        uint256[] votePres;
        uint256 numPresVoted;

        uint256[] voteGNS;
        uint256 numGNSVoted;

        uint256[] voteSNT;
        uint256 numSNTVoted;

        uint256[] voteMNC;
        uint256 numMNCVoted;

        uint256[] voteANC;
        uint256 numANCVoted;
    
        uint256[] voteSen;
        uint256 numSenVoted;
    }
    
    uint256 public endTime;
    uint256 public startTime;
    uint256 public durationMinutes;
    address public owner;
    string public electionName;
    
    mapping(address => Voter) public voters;

    address[] public voterList;
    Candidate[] public president;
    Candidate[] public gns;
    Candidate[] public snt;
    Candidate[] public mnc;
    Candidate[] public anc;
    Candidate[] public senator;
    // Candidate[] public senatorSorted;
    uint256 public totalVotes;

    ///////////////////////////////// modifiers ////////////////////////////
    modifier ownerOnly() {
        require(msg.sender == owner);
        _;
    }

    modifier electionNotEnded() {
        require(block.timestamp >= startTime && block.timestamp <= endTime, "Voting is not currently active.");
        _;
    }
    
    modifier electionEnded() {
        require(block.timestamp>=endTime, "Election is still ongoing");
        _;
    }

    /////////////////////////// starting election ////////////////////////////
    function startElection(string memory _electionName, uint256 durationInMinutes) public {
        owner = msg.sender;
        electionName = _electionName;
        durationMinutes = durationInMinutes;
        startTime = block.timestamp;
        endTime = startTime + (durationInMinutes*1 minutes);
    }


//////////////////////////////////////////////////////////////////////////////////////

    /// PRESIDENT
    function addPresident(string memory _presiName) public ownerOnly {
        president.push(Candidate(_presiName, 0));
    }
    function getNumPresident() public view returns (uint256) {
        return president.length;
    }
    function presidentInfo(uint256 index) public view returns (Candidate memory){
        return president[index];
    }
    function votePresident(uint256 candidateIndex) public electionNotEnded {
        require(voters[msg.sender].numPresVoted<3);
        require(voters[msg.sender].authorised);
    
        if(voters[msg.sender].numPresVoted==0){
            president[candidateIndex].points = president[candidateIndex].points +5;
            voters[msg.sender].votePres.push(candidateIndex);
            voters[msg.sender].numPresVoted++;
            totalVotes++;

        }
        else if(voters[msg.sender].numPresVoted==1 && candidateIndex!=voters[msg.sender].votePres[0]){
            president[candidateIndex].points = president[candidateIndex].points +3;
            voters[msg.sender].votePres.push(candidateIndex);
            voters[msg.sender].numPresVoted++;
            totalVotes++;
        }
        else if (voters[msg.sender].numPresVoted==2 && candidateIndex!=voters[msg.sender].votePres[0] && candidateIndex!=voters[msg.sender].votePres[1]){
            president[candidateIndex].points = president[candidateIndex].points +1;
            voters[msg.sender].numPresVoted++;
            totalVotes++;
        }
    }
    function winnerPres() public view electionEnded returns (uint256) {
        uint256 winningPoints = 0;
        uint256 winningCandidateIndex;
        for(uint256 i=0; i<president.length; i++){
            if(president[i].points> winningPoints){
                winningPoints = president[i].points;
                winningCandidateIndex = i;
            }
        }
        return winningCandidateIndex;
    }



    /// GNS
    function addGNS(string memory _secyName) public ownerOnly {
        gns.push(Candidate(_secyName, 0));
    }
    function getNumGNS() public view returns (uint256) {
        return gns.length;
    }
    function gnsInfo(uint256 index) public view returns (Candidate memory){
        return gns[index];
    }
    function voteGNS(uint256 candidateIndex) public electionNotEnded {
        require(voters[msg.sender].numGNSVoted<3);
        require(voters[msg.sender].authorised);
    
        if(voters[msg.sender].numGNSVoted==0){
            gns[candidateIndex].points = gns[candidateIndex].points +5;
            voters[msg.sender].voteGNS.push(candidateIndex);
            voters[msg.sender].numGNSVoted++;
            totalVotes++;

        }
        else if(voters[msg.sender].numGNSVoted==1 && candidateIndex!=voters[msg.sender].voteGNS[0]){
            gns[candidateIndex].points = gns[candidateIndex].points +3;
            voters[msg.sender].voteGNS.push(candidateIndex);
            voters[msg.sender].numGNSVoted++;
            totalVotes++;
        }
        else if (voters[msg.sender].numGNSVoted==2 && candidateIndex!=voters[msg.sender].voteGNS[0] && candidateIndex!=voters[msg.sender].voteGNS[1]){
            gns[candidateIndex].points = gns[candidateIndex].points +1;
            voters[msg.sender].numGNSVoted++;
            totalVotes++;
        }
    }
    function winnerGNS() public view electionEnded returns (uint256) {
        uint256 winningPoints = 0;
        uint256 winningCandidateIndex;
        for(uint256 i=0; i<gns.length; i++){
            if(gns[i].points> winningPoints){
                winningPoints = gns[i].points;
                winningCandidateIndex = i;
            }
        }
        return winningCandidateIndex;
    }

    /// SNT
    function addSNT(string memory _secyName) public ownerOnly {
        snt.push(Candidate(_secyName, 0));
    }
    function getNumSNT() public view returns (uint256) {
        return snt.length;
    }
    function sntInfo(uint256 index) public view returns (Candidate memory){
        return snt[index];
    }
    function voteSNT(uint256 candidateIndex) public electionNotEnded {
        require(voters[msg.sender].numSNTVoted<3);
        require(voters[msg.sender].authorised);
    
        if(voters[msg.sender].numSNTVoted==0){
            snt[candidateIndex].points = snt[candidateIndex].points +5;
            voters[msg.sender].voteSNT.push(candidateIndex);
            voters[msg.sender].numSNTVoted++;
            totalVotes++;

        }
        else if(voters[msg.sender].numSNTVoted==1 && candidateIndex!=voters[msg.sender].voteSNT[0]){
            snt[candidateIndex].points = snt[candidateIndex].points +3;
            voters[msg.sender].voteSNT.push(candidateIndex);
            voters[msg.sender].numSNTVoted++;
            totalVotes++;
        }
        else if (voters[msg.sender].numSNTVoted==2 && candidateIndex!=voters[msg.sender].voteSNT[0] && candidateIndex!=voters[msg.sender].voteSNT[1]){
            snt[candidateIndex].points = snt[candidateIndex].points +1;
            voters[msg.sender].numSNTVoted++;
            totalVotes++;
        }
    }
    function winnerSNT() public view electionEnded returns (uint256) {
        uint256 winningPoints = 0;
        uint256 winningCandidateIndex;
        for(uint256 i=0; i<snt.length; i++){
            if(snt[i].points> winningPoints){
                winningPoints = snt[i].points;
                winningCandidateIndex = i;
            }
        }
        return winningCandidateIndex;
    }

    /// MNC
    function addMNC(string memory _secyName) public ownerOnly {
        mnc.push(Candidate(_secyName, 0));
    }
    function getNumMNC() public view returns (uint256) {
        return mnc.length;
    }
    function mncInfo(uint256 index) public view returns (Candidate memory){
        return mnc[index];
    }
    function voteMNC(uint256 candidateIndex) public electionNotEnded {
        require(voters[msg.sender].numMNCVoted<3);
        require(voters[msg.sender].authorised);
    
        if(voters[msg.sender].numMNCVoted==0){
            mnc[candidateIndex].points = mnc[candidateIndex].points +5;
            voters[msg.sender].voteMNC.push(candidateIndex);
            voters[msg.sender].numMNCVoted++;
            totalVotes++;

        }
        else if(voters[msg.sender].numMNCVoted==1 && candidateIndex!=voters[msg.sender].voteMNC[0]){
            mnc[candidateIndex].points = mnc[candidateIndex].points +3;
            voters[msg.sender].voteMNC.push(candidateIndex);
            voters[msg.sender].numMNCVoted++;
            totalVotes++;
        }
        else if (voters[msg.sender].numMNCVoted==2 && candidateIndex!=voters[msg.sender].voteMNC[0] && candidateIndex!=voters[msg.sender].voteMNC[1]){
            mnc[candidateIndex].points = mnc[candidateIndex].points +1;
            voters[msg.sender].numMNCVoted++;
            totalVotes++;
        }
    }
    function winnerMNC() public view electionEnded returns (uint256) {
        uint256 winningPoints = 0;
        uint256 winningCandidateIndex;
        for(uint256 i=0; i<mnc.length; i++){
            if(mnc[i].points> winningPoints){
                winningPoints = mnc[i].points;
                winningCandidateIndex = i;
            }
        }
        return winningCandidateIndex;
    }

    /// ANC
    function addANC(string memory _secyName) public ownerOnly {
        anc.push(Candidate(_secyName, 0));
    }
    function getNumANC() public view returns (uint256) {
        return anc.length;
    }
    function ancInfo(uint256 index) public view returns (Candidate memory){
        return anc[index];
    }
    function voteANC(uint256 candidateIndex) public electionNotEnded {
        require(voters[msg.sender].numANCVoted<3);
        require(voters[msg.sender].authorised);
    
        if(voters[msg.sender].numANCVoted==0){
            anc[candidateIndex].points = anc[candidateIndex].points +5;
            voters[msg.sender].voteANC.push(candidateIndex);
            voters[msg.sender].numANCVoted++;
            totalVotes++;

        }
        else if(voters[msg.sender].numANCVoted==1 && candidateIndex!=voters[msg.sender].voteANC[0]){
            anc[candidateIndex].points = anc[candidateIndex].points +3;
            voters[msg.sender].voteANC.push(candidateIndex);
            voters[msg.sender].numANCVoted++;
            totalVotes++;
        }
        else if (voters[msg.sender].numANCVoted==2 && candidateIndex!=voters[msg.sender].voteANC[0] && candidateIndex!=voters[msg.sender].voteANC[1]){
            anc[candidateIndex].points = anc[candidateIndex].points +1;
            voters[msg.sender].numANCVoted++;
            totalVotes++;
        }
    }
    function winnerANC() public view electionEnded returns (uint256) {
        uint256 winningPoints = 0;
        uint256 winningCandidateIndex;
        for(uint256 i=0; i<anc.length; i++){
            if(anc[i].points> winningPoints){
                winningPoints = anc[i].points;
                winningCandidateIndex = i;
            }
        }
        return winningCandidateIndex;
    }

    /// SENATOR
    function addSenator(string memory _senatorName) public ownerOnly {
        senator.push(Candidate(_senatorName, 0));
    }
    function getNumSenators() public view returns (uint256) {
        return senator.length;
    }
    function senatorInfo(uint256 index) public view returns (Candidate memory){
        return senator[index];
    }
    function voteSenator(uint256 candidateIndex) public electionNotEnded {
        require(voters[msg.sender].numSenVoted<3);
        require(voters[msg.sender].authorised);
    
        if(voters[msg.sender].numSenVoted==0){
            senator[candidateIndex].points = senator[candidateIndex].points +5;
            voters[msg.sender].voteSen.push(candidateIndex);
            voters[msg.sender].numSenVoted++;
            totalVotes++;

        }
        else if(voters[msg.sender].numSenVoted==1 && candidateIndex!=voters[msg.sender].voteSen[0]){
            senator[candidateIndex].points = senator[candidateIndex].points +3;
            voters[msg.sender].voteSen.push(candidateIndex);
            voters[msg.sender].numSenVoted++;
            totalVotes++;
        }
        else if (voters[msg.sender].numSenVoted==2 && candidateIndex!=voters[msg.sender].voteSen[0] && candidateIndex!=voters[msg.sender].voteSen[1]){
            senator[candidateIndex].points = senator[candidateIndex].points +1;
            voters[msg.sender].numSenVoted++;
            totalVotes++;
        }
    }
    function winnerSen() public view electionEnded returns (uint256) {
        uint256 winningPoints = 0;
        uint256 winningCandidateIndex;
        for(uint256 i=0; i<senator.length; i++){
            if(senator[i].points> winningPoints){
                winningPoints = senator[i].points;
                winningCandidateIndex = i;
            }
        }
        return winningCandidateIndex;
    }

    // function senatorSort() public returns (uint[] memory) {
    //     for (uint i = 0; i < senator.length; i++) {
    //         senatorSorted[i] = senator[i];
    //     }

    //     for (uint i = 0; i < senator.length - 1; i++) {
    //         for (uint j = 0; j < senator.length - i - 1; j++) {
    //             if (senatorSorted[j] > senator[j + 1]) {
    //                 (sortedArr[j], sortedArr[j + 1]) = (sortedArr[j + 1], sortedArr[j]);
    //             }
    //         }
    //     }

    //     return sortedArr;
    // }


////////////////////////////////////////////////////////////////////////////////////////
    function authorizeVoter(address _voterAddress) public ownerOnly {
        voters[_voterAddress].authorised = true;
        voterList.push(_voterAddress);

    }
    
    function getTotalVotes() public view returns (uint256) {
        return totalVotes;
    }

    function getNumVoters() public view returns (uint256) {
        return voterList.length;
    }
    function voterInfo(uint256 index) public view returns (address){
        return voterList[index];
    }
    function isVoterPresent(address targetAddress) public view returns (bool) {
        for (uint256 i = 0; i < voterList.length; i++) {
            if (voterList[i] == targetAddress) {
                return true;
            }
        }
        return false;
    }

    function isElectionEnded() public view returns (bool) {
            if (block.timestamp>endTime) {
                return true;
            }
            else {
                return false;
            }
    }

}
