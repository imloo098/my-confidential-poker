# Confidential Poker Demo

A 2-player confidential poker prototype using Zama's fhEVM.

Features:
- Players join the game
- Submit fully encrypted hole cards (euint8[2] — private on-chain!)
- Public community cards dealt automatically

Meaningful FHE usage: Hole cards stay encrypted — perfect for hidden hands in on-chain poker games.

Contract: contracts/ConfidentialPoker.sol
Built for Zama Developer Program Builder Track (December 2025)

Status: Core privacy logic complete. Frontend + hand evaluation next month.