// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

import "./TrushangToken.sol";

contract TrushangTokenSale {
    address admin;
    TrushangToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;
    
    event Sell(address _buyer, uint256 _amount);

    constructor(TrushangToken _tokenContract,uint256 _tokenPrice) {
        //Assign an admin
        admin = msg.sender;
        //Token Contract
        tokenContract = _tokenContract;
        //Token Price
        tokenPrice = _tokenPrice;
    }

    //Multiply
    function multiply(uint x, uint y) internal pure returns (uint z){
        require(y == 0 || (z = x * y) / y == x);
    }

    //Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable{
        //Require that value is equal to tokens
        require(msg.value == multiply(_numberOfTokens,tokenPrice));

        //Require that the contract has enough tokens
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);

        //keep that tokens transfer is successful
         require(tokenContract.transfer(msg.sender, _numberOfTokens));
        
        //Keep track of tokenSold
        tokensSold += _numberOfTokens;
        //Trigger sell event
        emit Sell(msg.sender, _numberOfTokens);
    }

}