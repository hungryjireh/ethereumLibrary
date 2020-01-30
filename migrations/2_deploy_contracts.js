//var Adoption = artifacts.require("Adoption");
var Borrow = artifacts.require("Borrow");


module.exports = function(deployer) {
  //deployer.deploy(Adoption);
  deployer.deploy(Borrow);
};