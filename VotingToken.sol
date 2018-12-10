pragma solidity ^0.4.24;

import "math/SafeMath.sol";
import "token/ERC721.sol";
import "./Voter.sol";

// defines functions and data for voting tokens, inherits from Voter.sol
contract VotingToken is ERC721, Voter 
{
    using SafeMath for uint256;

    // use as index
    uint allSupply = 0;

    struct Vote {  // to be linked to token
        uint election;   // index of the election to be used in
        uint voterID;  // index of voter who cast it
        uint tokenID;
    }

    // link voter ID to vote
    mapping(uint => Vote) public voterToVote;

    // creates a new voting token for specified voter ID
    function _createToken(uint _voterID, uint _election) private onlyOwner
    {
        require(voters[_voterID].numTokens == 0, "Voter already has a token.");

        // link voter ID to vote
        voterToVote[_voterID] = Vote(_election, _voterID, allSupply);
        // increment token supply
        allSupply++;
    }

    // returns number of voting tokens for specified address
    function balanceOf(address _owner) public view returns (uint256 _balance) 
    {
        return voters[addressToVoter[_owner]].numTokens;
    }

    // // returns address of voter owning token
    // function ownerOf(uint256 _tokenId) public view returns (address _owner) 
    // {
    //     return tokenToVoter[_tokenId]   //FIX: returns voter ID, not address;
    // }

}