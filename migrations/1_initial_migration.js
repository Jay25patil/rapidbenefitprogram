var Migrations = artifacts.require("./Migrations.sol");
//var Employee = artifacts.require("./employee.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  //deployer.deploy(Employee);
};
