import {time, loadFixture} from "@nomicfoundation/hardhat-network-helpers";
import {anyValue} from "@nomicfoundation/hardhat-chai-matchers/withArgs";
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

    const timeStamp = () => {
        let time = new Date().getTime() / 1000;
        return Math.floor(time);
    }

    describe("mint", async () => {
        it("mint tokenID从1开始", async () => {
            const {owner, oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.mint(owner.address);
            const balance = await oxTombInstance.balanceOf(owner.address);
            const tokenOwner = await oxTombInstance.ownerOf(1);

            expect(balance).to.equal(1);
            expect(tokenOwner).to.equal(owner.address);
        })
        it("mint transferTimes为1，user为当前用户地址", async () => {
            const {owner, oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.mint(owner.address);
            const tokenInfo = await oxTombInstance.queryExpiresByTokenId(1);

            expect(tokenInfo[0]).to.equal(owner.address);
            expect(tokenInfo[2].toNumber()).to.equal(1);
        })
        it("mint 时过期时间默认为+7天(hardhatBug)", async () => {
        })
    })

})