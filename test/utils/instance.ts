import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { ethers, upgrades } from "hardhat";

// 基本实例
async function TombInstance() {
  // 基本配置项
  const ERC721Name = "OxTomb Coin";
  const ERC721Symbol = "OxTomb";
  const subPrice = 888888888888888;
  const sellPrice = 66666666666666;
  const subCycle = 60 * 60 * 24 * 7;

  const defaultContractURI = "https://baidu.com";
  const TokenInfo = {
    baseURI: "https://baidu.com/",
    hash: "0x3gs2",
  };

  const [owner, user] = await ethers.getSigners();
  const Tomb = await ethers.getContractFactory("Tomb");
  const TombInstance = await upgrades.deployProxy(Tomb, [
    ERC721Name,
    ERC721Symbol,
  ]);

  await TombInstance.setSubPrice(subPrice);
  await TombInstance.setSellPrice(sellPrice);
  await TombInstance.setSubCycle(subCycle);

  await TombInstance.changedContractURI(defaultContractURI);
  await TombInstance.setTokenURI(TokenInfo.baseURI);
  await TombInstance.mint(owner.address, 1, TokenInfo.hash);

  return {
    subPrice,
    sellPrice,
    defaultContractURI,
    TokenInfo,
    owner,
    subCycle,
    user,
    TombInstance,
    ERC721Name,
    ERC721Symbol,
  };
}

const TombInfo = async () => await loadFixture(TombInstance);

export default TombInfo;
