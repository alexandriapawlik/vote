pragma solidity ^0.4.24;

import "math/SafeMath.sol";
import "token/ERC721.sol";
import "utils/Ownable.sol";

contract Vote is ERC721, Ownable {

    // links token ID to voter ID
    mapping (uint => uint) private tokenToVoter;
    // links voter ID to address
    mapping (uint => address) private voterToAddress;

    struct Voter {
        uint voterID;
        uint8 age;
        string firstName;
        string middleName;
        string lastName;
        string suffix;
        string gender;
    }

    constructor() public {
        symbol = "VOTE";
        name = "Voting Token";
        allSupply = 0;
    }

    function _createNewToken(address _)

}