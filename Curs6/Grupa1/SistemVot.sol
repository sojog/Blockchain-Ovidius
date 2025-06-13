
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/*

Motiune
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


// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

contract SistemVot {

    string private motiune;
    address public administrator;

    
    uint256 voturi_exercitate = 0; // 0   
    uint256 voturi_pro = 0;  // 0
    uint256 voturi_contra = 0; // 0

    bool este_incheiata_perioada; // False

    // array  - cu cei care au votat  - O (n)


    // mapping - cu cei care au votat - O (1)
    mapping (address => bool) public cei_cu_drept_de_vot;
    mapping(address => bool) public cei_care_au_votat; 


    constructor ( string memory _motiune) {
        motiune = _motiune;
        administrator = msg.sender;
    } 
    modifier onlyAdmin () {
          require(msg.sender == administrator, "Administratorul este singura persoana care poate schimba functia");
          _;
    }

    function adauga_votant ( address votant) onlyAdmin public {
        cei_cu_drept_de_vot[votant] = true;
    }


    function incheie_perioada() onlyAdmin public {
        este_incheiata_perioada = true;
    }

    function deschide_perioada() onlyAdmin public {
        este_incheiata_perioada = false;
    }


    function voteaza(bool este_pro) public {
        require(!este_incheiata_perioada, "Perioada de votare incheiata");
        require (cei_cu_drept_de_vot[msg.sender], "Persoana nu are drept de votare");
        
        require(!cei_care_au_votat[msg.sender], "Persoana a votat deja");
       
       cei_cu_drept_de_vot[msg.sender] = true;
        cei_care_au_votat[msg.sender] = true; 


        if (este_pro == true) {
            voturi_pro++;

        } else {
            voturi_contra++;
        }
        voturi_exercitate++;
    }

    function a_trecut_motiunea () public  view returns (bool) {
        if (voturi_pro > voturi_contra) {
            return true;
        } else {
            return false;
        }
    }




}