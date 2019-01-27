var CIDTracker = artifacts.require("./CIDTracker.sol");

module.exports = (deployer) => {
  deployer.deploy(CIDTracker);
};
