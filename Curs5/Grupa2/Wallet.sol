
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import "hardhat/console.sol";

contract Portofel {

    address private owner;

    constructor() {

        console.log("Portofelul a fost creat");
        owner = msg.sender;
        console.log("Ownerul Portofelului este: ", owner);

    }


    function depunde () public payable {
        console.log("Deponentul a pus:", msg.value);
    }

    function depune_minim_1_ether () public payable  {
        if (msg.value < 1 ether ) {
            console.log("Nu a putut fi depusa suma");
            revert();
           
        } else {
             console.log("Suma mai mare de 1 ether a fost depusa");
        }

    }

    function citeste_balanta ()  public view returns (uint){
        return  address(this).balance;
    }

    function citire_balanta_doar_de_catre_owner () public view returns (uint) {
        require(msg.sender == owner, "Nu oricine poate citi balanta acestui contract!!!! ");
        return  address(this).balance;
    }

}