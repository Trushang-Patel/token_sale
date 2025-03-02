const TrushangToken = artifacts.require('./TrushangToken.sol');
const TrushangTokenSale = artifacts.require('./TrushangTokenSale.sol');

module.exports = async function(deployer) {
    try {
        // Deploy Token with initial supply
        await deployer.deploy(TrushangToken, 1000000);
        const tokenInstance = await TrushangToken.deployed();
        
        // Token price is 0.001 Ether
        const tokenPrice = web3.utils.toBN('1000000000000000');
        
        // Deploy TokenSale
        await deployer.deploy(TrushangTokenSale, TrushangToken.address, tokenPrice);
        const tokenSaleInstance = await TrushangTokenSale.deployed();
        
        // Transfer tokens to TokenSale Contract (75% of total supply)
        await tokenInstance.transfer(
            tokenSaleInstance.address,
            web3.utils.toBN('750000')
        );
        
        console.log('Token deployed at:', tokenInstance.address);
        console.log('TokenSale deployed at:', tokenSaleInstance.address);
        console.log('Tokens transferred to sale contract');
        
    } catch (error) {
        console.error('Deployment failed:', error);
        throw error;
    }
};