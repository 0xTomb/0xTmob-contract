import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import TombInfo from "./utils/instance";

describe("风化模块", function () {
  it("token 风化次数查询", async () => {
    const { TombInstance } = await TombInfo();
    const _times = await TombInstance.WeatheringTimes(1);
    expect(_times.toNumber()).to.equal(1);
  });

  it("token mint 初始化风化次数为1", async () => {
    const { TombInstance } = await TombInfo();
    const _times = await TombInstance.WeatheringTimes(1);
    expect(_times.toNumber()).to.equal(1);
  });

  it("token transfer 交易次数等于风化次数", async () => {
    const { owner, user, TombInstance } = await TombInfo();

    await TombInstance.transferFrom(owner.address, user.address, 1);
    await TombInstance.connect(user).transferFrom(
      user.address,
      owner.address,
      1,
    );

    const _times = await TombInstance.WeatheringTimes(1);

    expect(_times.toNumber()).to.equal(3);
  });
});
