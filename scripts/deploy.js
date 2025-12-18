const hre = require("hardhat");

async function main() {
  const FinalityAnchor = await hre.ethers.getContractFactory("FinalityAnchor");
  const anchor = await FinalityAnchor.deploy();
  await anchor.deployed();
  console.log("FinalityAnchor deployed to:", anchor.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

