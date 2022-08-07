import {time, loadFixture} from "@nomicfoundation/hardhat-network-helpers";
import {anyValue} from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import {expect} from "chai";
import {ethers} from "hardhat";

describe("oxTomb-Base", function () {

    const projectName = "Tomb";
    const projectSymbol = "OX";

    // 基本实例
    async function deployOxTombFixture() {
        const [owner, otherAddress] = await ethers.getSigners();
        const oxTomb = await ethers.getContractFactory("Tomb");
        const oxTombInstance = await oxTomb.deploy(projectName, projectSymbol);
        return {owner, otherAddress, oxTombInstance};
    }

    describe("introduce", async () => {
        it("Name, Symbol", async () => {
            const {oxTombInstance} = await loadFixture(deployOxTombFixture);
            const name = await oxTombInstance.name();
            const symbol = await oxTombInstance.symbol();

            expect(name).to.equal(projectName);
            expect(symbol).to.equal(projectSymbol);
        })

    })

    describe("owner", () => {
        it("owner是部署时合约时的地址,且可供外部访问", async () => {
            const {owner, oxTombInstance} = await loadFixture(deployOxTombFixture);
            const oxTombAddress = await oxTombInstance.owner();
            expect(oxTombAddress).to.equal(owner.address);
        })
        it("owner变更新权限方,且变更后有效", async () => {
            const {otherAddress, oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.transferOwnership(otherAddress.address);
            const oxTombAddress = await oxTombInstance.owner();
            expect(oxTombAddress).to.equal(otherAddress.address);
        })
        it("使用onlyOwner对方法进行权限管理", async () => {
            const {otherAddress, oxTombInstance} = await loadFixture(deployOxTombFixture);

            let isOwnerHandle;
            let isNotOwnerHandle;

            try {
                await oxTombInstance.setSellPrice(1000);
                isOwnerHandle = true;
            } catch (e) {
                isOwnerHandle = false;
            }

            try {
                await oxTombInstance.connect(otherAddress).setSellPrice(1000)
                isNotOwnerHandle = false;
            } catch (e) {
                isNotOwnerHandle = true;
            }
            expect(isOwnerHandle && isNotOwnerHandle).to.equal(true);
        })
    })

    describe("contractURI", () => {
        it("contractURI可修改,且外部可访问", async () => {
            const defaultURI = "http://www.baidu.com"
            const {oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.setContractURI(defaultURI);
            const contractURI = await oxTombInstance.contractURI();
            expect(contractURI).to.equal(defaultURI);
        })
    })

    describe("tokenURI", () => {
        it("tokenURI可修改,且外部可访问metadata获取json路径", async () => {
            const defaultURI = "http://www.zhihu.com/"
            const randomTokenID = Math.floor(Math.random() * 100);
            const {oxTombInstance} = await loadFixture(deployOxTombFixture);
            await oxTombInstance.setBaseURI(defaultURI);
            const metadata = await oxTombInstance.tokenURI(randomTokenID);

            expect(metadata).to.equal(defaultURI + randomTokenID + ".json");
        })
    })
})