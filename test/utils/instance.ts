import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { ethers, upgrades } from "hardhat";

// 基本实例
async function TombInstance() {
  const ERC721Name = "Kasoqian Coin";
  const ERC721Symbol = "KC";

  const [proOwner, owner] = await ethers.getSigners();
  const Tomb = await ethers.getContractFactory("Tomb");
  const TombInstance = await upgrades.deployProxy(Tomb, [
    ERC721Name,
    ERC721Symbol,
  ]);

  return { proOwner, owner, TombInstance };
}

const TombInfo = async () => await loadFixture(TombInstance);

export default TombInfo;
