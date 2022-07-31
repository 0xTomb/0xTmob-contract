import {HardhatUserConfig} from "hardhat/config";

import '@openzeppelin/hardhat-upgrades';
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
            {version: "0.8.12", settings},
        ],
    },
};

export default config;
