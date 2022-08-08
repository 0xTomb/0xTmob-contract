import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import TombInfo from "./utils/instance";

describe("刻字模块", function () {
  it("token 默认为未刻字状态", async () => {
    const { TombInstance } = await TombInfo();
    const _times = await TombInstance.hasLetter(1);
    expect(_times).to.equal(false);
  });

  it("token 刻字，且仅有一次机会", async () => {
    let canLetterAgain = false;
    const { TombInstance } = await TombInfo();
    await TombInstance.tokenLetter(1);

    try {
      await TombInstance.tokenLetter(1);
      canLetterAgain = true;
    } catch (error) {
      canLetterAgain = false;
    }

    const _letterState = await TombInstance.hasLetter(1);

    expect(canLetterAgain).to.equal(false);
    expect(_letterState).to.equal(true);
  });

  it("token transfer 后可重新刻字", async () => {
    let canLetterAgain = false;
    let _letterState;
    const { user, owner, TombInstance } = await TombInfo();

    await TombInstance.transferFrom(owner.address, user.address, 1);
    await TombInstance.tokenLetter(1); // 刻字

    await TombInstance.connect(user).transferFrom(
      user.address,
      owner.address,
      1,
    );

    try {
      _letterState = await TombInstance.hasLetter(1);
      await TombInstance.tokenLetter(1); // 再次刻字
      canLetterAgain = true;
    } catch (error) {
      canLetterAgain = false;
    }

    expect(_letterState).to.equal(false);
    expect(canLetterAgain).to.equal(true);
  });
});
