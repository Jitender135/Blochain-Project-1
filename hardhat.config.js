require('@nomiclabs/hardhat-waffle')

module.exports = {
  solidity: '0.8.0',
  networks: {
    lineaSepolia: {
      url: 'https://linea-sepolia.drpc.org',
      accounts: ['fed6e7f9c89f477767d5c7de4047459e72759444c949e1259c0e56e3e8c8befa'],
    },
  },
};
