const hre = require("hardhat");

async function main() {
  const StorageBridge = await hre.ethers.getContractFactory("StorageBridge");
  const bridge = await StorageBridge.deploy();

  await bridge.waitForDeployment();
  console.log("Storage Bridge deployed to:", await bridge.getAddress());

  // Example: Registering an IPFS CID for a mock NFT
  const entityId = hre.ethers.id("NFT_COLLECTION_1");
  const cid = "QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco";
  
  await bridge.registerData(entityId, 0, cid); // 0 = IPFS
  console.log("Registered IPFS pointer for entity.");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
