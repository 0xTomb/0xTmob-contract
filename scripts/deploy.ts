import { ethers, upgrades } from "hardhat";

async function main() {
  const Tomb = await ethers.getContractFactory("Tomb");
  const TombInstance = await Tomb.deploy("kaso", "qian");

  const result = await TombInstance.deployed();
  console.log(JSON.stringify(result)); // 部署后的合约地址
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
