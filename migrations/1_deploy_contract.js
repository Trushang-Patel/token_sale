var TrushangToken = artifacts.require('./TrushangToken.sol');

module.exports = function(deployer) {
    deployer.deploy(TrushangToken, 1000000);
};