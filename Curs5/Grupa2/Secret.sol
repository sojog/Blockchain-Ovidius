
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


contract Secret {

    uint256 private secret_number;
    address private owner;

    constructor(uint256 _initial_numer) payable  {
        owner = msg.sender;
        secret_number = _initial_numer;
    }

    modifier onlyOwner { 
        require(msg.sender == owner, "Nu oricine poate citi balanta acestui contract!!!! ");
        _;

    }

    function getSecret() onlyOwner public view returns (uint256) {
        return secret_number;
    }

    function setSecret( uint256 _new_secret ) public  onlyOwner { 
        secret_number = _new_secret;
    }


    function getOwner() onlyOwner public view returns (address){
        return owner;
     }


    function getContractBalance() onlyOwner public view returns(uint256){
        return address(this).balance;
    }

}


