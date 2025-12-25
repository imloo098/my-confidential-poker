# Confidential Poker Demo

A 2-player confidential poker prototype using Zama's fhEVM for the Builder Track (December 2025).

## Features
- Players join the game
- Submit encrypted hole cards (euint8[2] — fully private!)
- Public community cards

## Meaningful FHE Usage
Hole cards stay encrypted on-chain — perfect for hidden hands in poker (Zama's flagship example!).

## Local Test & Deploy
- Deployed locally at: **0x5fDB2315678aFecb367f032d93F642f64180aa3**
- Tested with Hardhat: Game join successful, private cards submitted

Contract: contracts/ConfidentialPoker.sol (or your file name)

Frontend + full hand evaluation next month.

Thanks Zama team! 🚀
