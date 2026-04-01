# Decentralized Storage Bridge (Arweave/IPFS)

A professional-grade architectural bridge for Web3 data. This repository provides a unified on-chain registry that maps smart contract entities (NFTs, DAOs, Users) to their decentralized storage URIs. It includes specialized logic for handling Arweave's transaction IDs and IPFS Content Identifiers (CIDs).

## Core Features
* **Universal Registry:** A single source of truth for mapping on-chain IDs to off-chain data.
* **Content Addressing:** Ensures data integrity by strictly enforcing URI formats (ipfs:// or ar://).
* **Metadata Versioning:** Track the history of metadata changes for evolving dApps.
* **Flat Structure:** Optimized for integration as a base layer for NFT marketplaces or social protocols.

## Storage Logic
* **IPFS:** Best for hot storage and fast retrieval via gateways.
* **Arweave:** Best for permanent, "pay-once-store-forever" data like historical records or high-value NFT media.

## Setup
1. `npm install`
2. Deploy `StorageBridge.sol`.
3. Link your frontend to the `registerData` function to sync storage URIs.
