const Mutatio = artifacts.require("Mutatio");
const MaybeDai = artifacts.require("MaybeDai");

module.exports = function(deployer) {
  deployer.deploy(Mutatio);
  deployer.deploy(MaybeDai);
};