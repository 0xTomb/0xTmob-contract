import {ethers} from "hardhat";

async function main() {

    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);     // 部署人的地址
    console.log("Account balance:", (await deployer.getBalance()).toString()); // 部署人的balance

    // 选择合约
    const Token = await ethers.getContractFactory("oxTomb");
    // 部署合约
    const token = await Token.deploy("666w1", "666w2");

    console.log("Token address:", token.address);   // 部署后的合约地址
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });