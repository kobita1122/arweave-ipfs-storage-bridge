// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title StorageBridge
 * @dev Manages the link between on-chain entities and decentralized storage providers.
 */
contract StorageBridge is Ownable {
    enum StorageProvider { IPFS, ARWEAVE, OTHER }

    struct DataPointer {
        StorageProvider provider;
        string uri;
        uint256 timestamp;
        address updater;
    }

    // Mapping from Entity ID (e.g., Token ID or User Hash) to DataPointer
    mapping(bytes32 => DataPointer) public registry;

    event DataRegistered(bytes32 indexed entityId, StorageProvider provider, string uri);

    constructor() Ownable(msg.sender) {}

    /**
     * @dev Register or update a storage pointer for an entity.
     */
    function registerData(
        bytes32 _entityId, 
        StorageProvider _provider, 
        string calldata _uri
    ) external {
        // In a real implementation, you might add access control 
        // to ensure only the entity owner can update.
        
        registry[_entityId] = DataPointer({
            provider: _provider,
            uri: _uri,
            timestamp: block.timestamp,
            updater: msg.sender
        });

        emit DataRegistered(_entityId, _provider, _uri);
    }

    /**
     * @dev Helper to fetch full URI with prefix.
     */
    function getFullURI(bytes32 _entityId) external view returns (string memory) {
        DataPointer memory pointer = registry[_entityId];
        if (pointer.provider == StorageProvider.IPFS) {
            return string(abi.encodePacked("ipfs://", pointer.uri));
        } else if (pointer.provider == StorageProvider.ARWEAVE) {
            return string(abi.encodePacked("ar://", pointer.uri));
        }
        return pointer.uri;
    }
}
