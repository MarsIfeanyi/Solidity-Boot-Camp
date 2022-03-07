/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require('dotenv').config();//loads all the information in your .env file into your development environment.
require("@nomiclabs/hardhat-ethers");//This is for our etherJs, that helps to write our deploy scripts and for Front-end Applications
require("@nomiclabs/hardhat-etherscan");

const { API_URL, PRIVATE_KEY } = process.env;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;


module.exports = {
   solidity: "0.7.3",
   defaultNetwork: "rinkeby",
   networks: {
      hardhat: {},
      rinkeby: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      }
   },

   etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: ETHERSCAN_API_KEY
  }
}
