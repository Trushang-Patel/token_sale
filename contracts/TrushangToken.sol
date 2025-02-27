// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract TrushangToken{
    //Constructer
    //Set the total number of tokens
    //Read the total number of tokens

    //Name 
    string public name = "Trushang Token";
    //Symbol
    string public symbol = "TRU";
    //Standard
    string public standard = "Trushang Token v1.0";

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply){
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        //allocate the initial supply

    }
    
}
