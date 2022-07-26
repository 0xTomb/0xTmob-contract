import {HardhatUserConfig} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const settings = {
    optimizer: {
        enabled: true,
        runs: 200,
    },
};

const config: HardhatUserConfig = {
    solidity: {
        compilers: [
            {version: "0.8.0", settings},
            {version: "0.8.9", settings},
        ],
    },
};

export default config;
