var TrushangToken = artifacts.require('./TrushangToken.sol');
var TrushangTokenSale = artifacts.require('./TrushangTokenSale.sol');

module.exports = function(deployer) {
    deployer.deploy(TrushangToken, 1000000).then(function() {
        // Token price is 0.001 Ether
        var tokenPrice = 1000000000000000;
        return deployer.deploy(TrushangTokenSale,TrushangToken.address,tokenPrice);
    });
    
};