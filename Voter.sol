pragma solidity ^0.4.24;

import "math/SafeMath.sol";
import "utils/Ownable.sol";

// defines functions and data for voters
contract Voter is Ownable 
{
   
    // event NewTokenForVoter(uint tokenID, uint voterID);

    // links token ID to voter ID
    mapping (uint => uint) private tokenToVoter;
    // links address to voter ID
    mapping (address => uint) private addressToVoter;
    // links address to number of voter IDs, should only ever be one
    mapping (address => uint) private addressToNumVoters;

    struct Voter 
    {
        uint8 age;
        uint8 numTokens;  // should only ever be 0 or 1
        string firstName;
        string middleName;
        string lastName;
        string gender;
        string sex;
    }

    // keep track of # of voters
    Voter[] private voters;

    // creates a new voter profile for an address
    // returns voter ID of new profile
    function _createNewVoter(uint8 _age, string _firstName, string _middleName, string _lastName, string _gender, string _sex) 
        private returns(uint) 
    {
        require(addressToNumVoters[msg.sender] == 0, "Address already has a registered voter ID.");

        // link address to one voter
        addressToNumVoters[msg.sender] = 1;
        // create voter profile
        uint _voterID = voters.push(Voter(_age, 0, _firstName, _middleName, _lastName, _gender, _sex)) - 1;
        // link address to voter ID
        addressToVoter[msg.sender] = _voterID;

        return _voterID;
    }

}