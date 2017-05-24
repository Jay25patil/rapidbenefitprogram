var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Employee = artifacts.require("./SmartCurrency.sol")

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin, Employee);
  deployer.deploy(MetaCoin);
  deployer.deploy(Employee);
};
