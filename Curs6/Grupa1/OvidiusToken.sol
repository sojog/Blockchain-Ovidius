
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db





contract GenericERC20Token {

    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    address private owner;
    
    mapping(address => uint256) public balanceOf;


    constructor (string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply )  {
        name = _name;
        symbol = _symbol;
        decimals =  _decimals;
        
        owner = msg.sender;
        balanceOf[owner]=_totalSupply;
    
        totalSupply = _totalSupply;
    }


    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        
        require(_from != address(0));


        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        return true;
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {

        require(_to != address(0));
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        return true;
    }
}


contract OvidiusToken  is GenericERC20Token {

    constructor () GenericERC20Token("OvidiusToken", "OVUS", 18, 1000) { 

    }

}