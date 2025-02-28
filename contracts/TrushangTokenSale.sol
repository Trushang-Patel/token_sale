// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

import "./TrushangToken.sol";

contract TrushangTokenSale {
    address admin;
    TrushangToken public tokenContract;
    uint256 public tokenPrice;

    constructor(TrushangToken _tokenContract,uint256 _tokenPrice) {
        //Assign an admin
        admin = msg.sender;
        //Token Contract
        tokenContract = _tokenContract;
        //Token Price
        tokenPrice = _tokenPrice;

    }
}