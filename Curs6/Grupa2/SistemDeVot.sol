
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/*
Motiune
    Denumire
Opțiuni
    Pro vs Contra
    Mai multe variante
Votanți
    Drepturi
Perioadă de votare
  Administrator(i)
 Rezultat
 Număr
 Limită de voturi dacă există 
*/



// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7
// 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C


// [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7]

contract SistemDeVot {

    string motiune;

    uint256 public voturi_pro;
    uint256 public voturi_contra;
    uint256 public voturi_totale;
    address public administrator;


    bool public este_activa_perioada = true;

    mapping (address => bool) cei_care_au_votat;
    mapping (address => bool) cei_care_au_drept_de_vot;    

    constructor (address[] memory _cei_cu_drept_de_vot) {
        motiune = "Mers la Plaja";
        administrator = msg.sender;
        for(uint256 i = 0; i < _cei_cu_drept_de_vot.length; i++) {
            cei_care_au_drept_de_vot[_cei_cu_drept_de_vot[i]] = true;
        }
    }


    modifier onlyAdministrator() { 
         require(msg.sender == administrator, "Trebuie sa fii administratorul ca sa poti sa executa aceasta functie");
         _;
    }

    function adauga_votant(address _adresa) onlyAdministrator public  { 
       
        cei_care_au_drept_de_vot[_adresa] = true;
    }

    function inchide_perioada() onlyAdministrator public  {
        este_activa_perioada = false;
    }

    function deschide_perioada() onlyAdministrator public  {
        este_activa_perioada = true;
    }


    function voteaza(bool este_pro) public {

        // Au drep de vot?
        require( cei_care_au_drept_de_vot [msg.sender] == true, "Adresa nu are drept de vot");

        // Au mai votat o data?
       require( cei_care_au_votat[msg.sender] == false, "Votarea poate fi facuta o singura data");

        cei_care_au_votat[msg.sender] = true;
        if (este_pro) {
            voturi_pro ++;
         
        } else {
            voturi_contra ++;
        }
           voturi_totale++;
    }



}