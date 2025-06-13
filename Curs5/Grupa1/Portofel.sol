
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Portofel {

    address private owner ;


    int8 valoare_implicita;

    constructor() payable  {
        owner = msg.sender ;
    }

    function read_owner_address() public view returns (address) {
        return owner;
    }


    fallback() external payable { 

    }

    receive() external payable { 

    }


    function depunere  () public payable {

    }

    function citire_balanta () public view returns (uint256) {
        return address(this).balance;
    }

    function primeste_o_valoare(uint256 valoare) public {

    }


    function accesibila_doar_de_owner() public view {
       require( msg.sender == owner, "Acesta functie este accesibila doar owner-ului");

    }

    function cu_o_valoare_minima()  payable public  {
        require ( msg.value >= 1 ether, "Va rugam sa depuneti o valoare de cel putin 1 ethere");
    }


    modifier onlyOwner () { 
        require(msg.sender == owner , "Eroare cauza de modificatorul onlyOwner");
        _;
    }

    function modificata_de_onlyOwner ( int8 _noua_valoare)  onlyOwner public  {    
        valoare_implicita = _noua_valoare;
    }



}