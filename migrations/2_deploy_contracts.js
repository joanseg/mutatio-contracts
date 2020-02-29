const Mutatio = artifacts.require("Mutatio");
const MaybeDai = artifacts.require("MaybeDai");
const JALToken = artifacts.require("JALToken");

module.exports = function(deployer) {
  deployer.deploy(Mutatio);
  deployer.deploy(MaybeDai);
  deployer.deploy(JALToken);
};