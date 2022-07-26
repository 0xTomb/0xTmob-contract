import {loadFixture} from "@nomicfoundation/hardhat-network-helpers";
import {expect} from "chai";
import {ethers} from "hardhat";

describe("oxTomb-service", function () {
    const projectName = "oxTomb";
    const projectSymbol = "OX";

    async function deployOxTombFixture() {
        const [owner, otherAddress] = await ethers.getSigners();
        const oxTomb = await ethers.getContractFactory("oxTomb");
        const oxTombInstance = await oxTomb.deploy(projectName, projectSymbol);
        return {owner, otherAddress, oxTombInstance};
    }

    // 精确到秒
    const unixTimeStamp = () => {
        let time = new Date().getTime() / 1000;
        return Math.floor(time);
    }

    describe("mint", async () => {
        it("mint初始化,tokenID从1开始", async () => {
            const {owner, oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.mint(owner.address);
            const balance = await oxTombInstance.balanceOf(owner.address);
            const tokenOwner = await oxTombInstance.ownerOf(1);
            expect(balance).to.equal(1);
            expect(tokenOwner).to.equal(owner.address);
        })

        it("mint初始化,user为当前用户地址,transferTimes为1,expires为 1 week", async () => {
            const {owner, oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.mint(owner.address);
            const oneWeek = 60 * 60 * 24 * 7;
            const tokenInfo = await oxTombInstance.queryExpiresByTokenId(1);
            const timeDifference = Math.abs(tokenInfo[1].toNumber() - unixTimeStamp() - oneWeek)
            expect(tokenInfo[0]).to.equal(owner.address);
            expect(timeDifference < 60).to.equal(true); // 误差 < 1 minute
            expect(tokenInfo[2].toNumber()).to.equal(1);
        })
    })
})