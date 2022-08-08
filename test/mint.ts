import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import TombInfo from "./utils/instance";

describe("铸币模块", function () {
  it("不允许tokenID冲突", async () => {
    let mintState;
    const { owner, TombInstance } = await TombInfo();

    try {
      await TombInstance.mint(owner.address, 1, "test");
      mintState = true;
    } catch (error) {
      mintState = false;
    }

    expect(mintState).to.equal(false);
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
