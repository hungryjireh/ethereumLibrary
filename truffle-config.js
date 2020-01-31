require('dotenv').config();

const HDWalletProvider = require("@truffle/hdwallet-provider");

const mnemonic = process.env.MNEMONIC;

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 7545
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, process.env.PROJECT_URL)
      },
      network_id: 3
    }
  }
};
