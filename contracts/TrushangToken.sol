// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract TrushangToken{
    //Name 
    string public name = "Trushang Token";
    //Symbol
    string public symbol = "TRU";
    //Standard
    string public standard = "Trushang Token v1.0";

    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
    //transfer

    mapping(address => uint256) public balanceOf;
    //allowance
    mapping(address => mapping(address => uint256)) public allowance;

    //approve
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
        );
        
    //Constructer
    constructor(uint256 _initialSupply){
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        //allocate the initial supply
    }
     
     //Transfer
    function transfer(address _to, uint256 _value) public returns(bool success) {
        // Check for valid address
        require(_to != address(0), "Invalid recipient address");
        
        // Check if sender has enough balance with revert message
        require(balanceOf[msg.sender] >= _value, "Insufficient balance, transfer rejected");
        
        // Transfer tokens
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        // Emit transfer event
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }

    //Approve
    function approve(address _spender, uint256 _value) public returns(bool success){
        //allowance
        //Approval event
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    //TransferFrom
    
}