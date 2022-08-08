import { ethers, upgrades } from "hardhat";

async function main() {
  const Tomb = await ethers.getContractFactory("Tomb");
  const TombInstance = await upgrades.deployProxy(Tomb, [
    "oxTomb Coin",
    "oxTomb",
  ]);

  const ContractInfo = await TombInstance.deployed();
  console.log(JSON.stringify(ContractInfo.address)); // 部署后的合约地址
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
