// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//THE SMART CONTRACT
contract Casino {
    // GLOBAL VARIABLES
    address public accountOwner; // public address from Metamask account

    uint256 public minimumBet; // Minimum price of a bet
    uint256 public totalBet; // Total amount of ether accumulated from bets
    uint256 public numberOfBets; // number of bets
    uint256 public maxAmountOfBets = 100; // maximum number of bets

    address[] public players; // array of people who have place bets

    struct Player {
        // keep track of how much ether a user has bet and for what number.
        uint256 amountBet; // amount placed on the bet
        uint256 numberSelected; // the number that was bet on : 1 - 10 (both inclusive)
    }

    // mapping called playerInfo
    // address is the “key” to access Player such as amountBet and numberSelected
    mapping(address => Player) public playerInfo;

    constructor(uint256 _minimumBet) {
        // set up owner of the contract as account owner
        accountOwner = msg.sender;

        // define the minimum bet for the game
        if (_minimumBet != 0) minimumBet = _minimumBet;
    }

    function kill(address ownerAddress) public {
        // destroy contract when needed e.g. when contract has been hacked
        // only account owner (contract owner) can kill it
        // any Ether remaining in the contract will be sent to owner's account

        require(ownerAddress == msg.sender, "only the owner can call this");
        selfdestruct(payable(ownerAddress));
    }

    function checkPlayerExists(address player) public view returns (bool) {
        // checks that the user has not played already
        // a person plays once per game

        // does not require gas to run because it’s returning an already existing value from the blockchain i.e. it’s reading a value.
        for (uint256 i = 0; i < players.length; i++) {
            if (players[i] == player) return true;
        }
        return false;
    }

    // the betting function
    function bet(uint256 numberSelected) public payable {
        // payable is a modifier used to indicate that
        // this function can receive ether when you executed

        // verify that the player hasn’t placed a bet
        require(!checkPlayerExists(msg.sender));
        // verify that the number is in range
        require(numberSelected >= 1 && numberSelected <= 10);
        // verify that the bet placed is greater than or equal to the minimum bet.
        require(msg.value >= minimumBet);

        // msg.sender = address
        // msg.value is the amount of ether that is paid when executing this payable function.
        playerInfo[msg.sender].amountBet = msg.value;
        playerInfo[msg.sender].numberSelected = numberSelected;
        numberOfBets++; // increase number of placed bets
        players.push(msg.sender); // adds a new player to the end of the array
        totalBet += msg.value; // increment the total amount bet

        if (numberOfBets >= maxAmountOfBets) generateNumberWinner();
    }

    // Generates a number between 1 and 10 that will be the winner
    // Solidity does not generate randomness
    // Here we at least try to generate some random number as winner
    function generateNumberWinner() public {
        uint256 numberGenerated = (block.number % 10) + 1; // This isn't secure

        distributePrizes(numberGenerated);
    }

    // Sends the corresponding ether to each winner depending on the total bets
    function distributePrizes(uint256 numberWinner) public {
        address payable[100] memory winners; // create a temporary in memory array with fixed size
        
        uint256 count = 0; // count number of winners
        for (uint256 i = 0; i < players.length; i++) {
            // loop through total players
            address playerAddress = players[i];
            if (playerInfo[playerAddress].numberSelected == numberWinner) {
                // add to winners list
                winners[count] = payable(playerAddress);
                count++;
            }
            // clear players list so the game can restart
            delete playerInfo[playerAddress];
        }
        // also clear the players array - should reset the array length to zero
        delete players;
        
        // Calculate how much each winner gets : total bet amount / number of winners
        // array.length is read-only
        uint256 winnerEtherAmount = totalBet / winners.length; 
        for (uint256 j = 0; j < count; j++) {
            if (winners[j] != address(0))
                // Check that the address in this fixed array is not empty
                // send the corresponding amount of ether for each winner 
                winners[j].transfer(winnerEtherAmount);
        }
    }

    // increases the treasury of this contract
    // executed when ether is sent to the contract
    // save the ether sent to the contract instead of rejecting it
   receive() external payable {}
}
