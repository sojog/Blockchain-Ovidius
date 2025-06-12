
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7
// 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;






contract GenericToken{
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    string public name; //= "Ovidius Token";
    string public symbol; //= "OVD";
    uint8 public decimals; //= 18;
    uint256 public totalSupply; // = 1000;
    
    address public owner;

    // mapping (address => bool) cei_care_au_drept_de_vot;    
    mapping (address => uint256) public balanceOf; 

    // permisiuni
    mapping (address => mapping(address => uint256)) public allowance; 

    constructor (string memory _name, string memory _symbol, uint8 _decimals, uint256 initialSupply )  {
        name = _name;
        symbol = _symbol;
        decimals= _decimals;
        totalSupply = initialSupply;

        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;     

    }
    
    function transfer(address _to, uint256 _value)  public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }

    
    // C?? A -> B
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

        require(allowance[_from][msg.sender] >= _value);
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(_from,  _to, _value);
        return true;
    }


    // EU A -> las pe spender (C)  sa transfere valoare _value
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] += _value;
        emit Approval(msg.sender,  _spender,  _value);
        return true;
    }


}

contract OvidiusToken is GenericToken {
    constructor() GenericToken("Ovidius Token", "OVD", 18, 1000) {
        
    }
}