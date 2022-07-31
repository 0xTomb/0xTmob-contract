import { HardhatUserConfig } from "hardhat/config";

import "@openzeppelin/hardhat-upgrades";
import "@nomicfoundation/hardhat-toolbox";

import ENV from "./.env";

const settings = {
  optimizer: {
    enabled: true,
    runs: 200,
  },
};

const config: HardhatUserConfig = {
  defaultNetwork: "rinkeby",
  solidity: {
    compilers: [{ version: "0.8.12", settings }],
  },
  networks: {
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/${ENV.ALCHEMY_API_KEY}`,
      accounts: [ENV.ACCOUNT_PRIVATE_KEY],
    },
  },
};

export default config;
