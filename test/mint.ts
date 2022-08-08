import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import TombInfo from "./utils/instance";

describe("铸币模块", function () {
  it("不允许tokenID冲突", async () => {
    /*     const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false); */
  });
  it("不允许mint携带信息为空", async () => {
    /*     const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false); */
  });
  it("付费mint ", async () => {
    /*     const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false); */
  });
  // TODO
  it("白名单mint", async () => {
    /*     const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false); */
  });
});
