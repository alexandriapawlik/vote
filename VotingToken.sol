pragma solidity ^0.4.24;

import "math/SafeMath.sol";
import "token/ERC721.sol";
import "./Voter.sol";

// defines functions and data for voting tokens, inherits from Voter.sol
contract VotingToken is ERC721, Voter 
{
    using SafeMath for uint256;

    constructor() private 
    {
        symbol = "VOTE";
        name = "Voting Token";
        allSupply = 0;
    }

    // creates a new voting token for specified voter ID
    function _createNewToken(uint _voterID) private 
    {
        require(voters[_voterID].numTokens == 0, "Voter already has a token.");

        // link token ID to voter ID
        tokenToVoter[allSupply] == _voterID;
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