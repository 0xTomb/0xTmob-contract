import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import TombInfo from "./utils/instance";

describe("配置模块", function () {
  it("name，symbol，owner", async () => {
    const { owner, ERC721Name, ERC721Symbol, TombInstance } = await TombInfo();

    const _name = await TombInstance.name();
    const _symbol = await TombInstance.symbol();
    const _owner = await TombInstance.owner();

    expect(_name).to.equal(ERC721Name);
    expect(_symbol).to.equal(ERC721Symbol);
    expect(_owner).to.equal(owner.address);
  });

  it("contractURI，TokenURI", async () => {
    const { owner, TombInstance, defaultContractURI, TokenInfo } =
      await TombInfo();

    const _contractURI = await TombInstance.contractURI();
    const _tokenURI = await TombInstance.tokenURI(1);

    expect(_contractURI).to.equal(defaultContractURI);
    expect(_tokenURI).to.equal(`${TokenInfo.baseURI}${TokenInfo.hash}.json`);
  });

  it("mint price，sell price，subCycle", async () => {
    const { subPrice, sellPrice, TombInstance } = await TombInfo();

    const _subPrice = await TombInstance.subPrice();
    const _sellPrice = await TombInstance.sellPrice();
    const _subCycle = await TombInstance.subCycle();

    expect(_subPrice.toNumber()).to.equal(subPrice);
    expect(_sellPrice.toNumber()).to.equal(sellPrice);
    expect(_subCycle.toNumber()).to.equal(_subCycle);
  });
});
