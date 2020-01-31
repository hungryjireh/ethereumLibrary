//var Adoption = artifacts.require("Adoption");
var Borrow = artifacts.require("Borrow");
var LibraryDemo = artifacts.require("LibraryDemo");

module.exports = function(deployer) {
  deployer.deploy(Borrow);
  deployer.deploy(LibraryDemo);
};