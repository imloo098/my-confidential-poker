// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "fhevm/lib/TFHE.sol";

contract ConfidentialPoker {
    // Encrypted hole cards for 2 players (2 cards each, 0-51 = card ID example)
    euint8[2] private player1HoleCards;
    euint8[2] private player2HoleCards;

    // Public community cards (plain, everyone sees)
    uint8[3] public communityCards;

    address public player1;
    address public player2;
    bool public gameStarted = false;
    bool public cardsDealt = false;
    string public result = "Game not finished";

    // Join the game (first two players)
    function joinGame() public {
        require(!gameStarted, "Game already started");
        if (player1 == address(0)) {
            player1 = msg.sender;
        } else if (player2 == address(0)) {
            player2 = msg.sender;
            gameStarted = true;
        } else {
            revert("Game full (2 players max)");
        }
    }

    // Submit your 2 encrypted hole cards (client-side encryption in full app)
    function submitHoleCards(euint8 card1, euint8 card2) public {
        require(gameStarted, "Game not started");
        require(msg.sender == player1 || msg.sender == player2, "Not a player");

        if (msg.sender == player1) {
            player1HoleCards[0] = card1;
            player1HoleCards[1] = card2;
        } else {
            player2HoleCards[0] = card1;
            player2HoleCards[1] = card2;
        }

        // Simple fake community cards when both submitted (for demo)
        if (TFHE.isInitialized(player1HoleCards[0]) && TFHE.isInitialized(player2HoleCards[0])) {
            communityCards = [14, 27, 40]; // Example: K♠, A♥, 2♦ (change as needed)
            cardsDealt = true;
            result = "Hole cards submitted privately & community dealt!";
        }
    }
}