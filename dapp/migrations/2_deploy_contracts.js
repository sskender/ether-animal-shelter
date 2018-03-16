var AnimalShelter = artifacts.require("./AnimalShelter.sol");

module.exports = function(deployer) {
  deployer.deploy(AnimalShelter);
};
