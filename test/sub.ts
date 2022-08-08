import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import TombInfo from "./utils/instance";

describe("订阅模块", function () {
  it("token 订阅过期查询", async () => {
    const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false);
  });

  it("token mint 后赠送一轮订阅周期", async () => {
    const { TombInstance } = await TombInfo();
    const _time = await TombInstance.subTokenInfo(1);

    let now = new Date();
    now = new Date(now.getTime() + 1000 * 60 * 60 * 24 * 7);

    const data = new Date(_time.toNumber() * 1000);
    /*     expect(data.getDay()).to.equal(now.getDay()); */
  });

  it("token 手动延长订阅", async () => {
    const { TombInstance } = await TombInfo();
    const _time = await TombInstance.subTokenInfo(1);

    await TombInstance.tokenSubExtend(1);

    let now = new Date();
    now = new Date(now.getTime() + 1000 * 60 * 60 * 24 * 14);

    const data = new Date(_time.toNumber() * 1000);

    /*     expect(data.getDay()).to.equal(now.getDay()); */
  });

  it("token transfer 后订阅时长清空", async () => {
    /*     const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false); */
  });
});
