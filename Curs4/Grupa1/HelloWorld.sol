// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract HelloWorld {

    string private denumire = "Rosu";
    uint8 private numar_privat = 200;

    // @dev Returns the string "Hello World!".
    function hello_pure() public pure returns (string memory) {
        return "Hello World!";
    }


    function hello_public () public view returns (uint8) {
        return numar_privat;
    }

    function setNume (string memory _denumire) public {
        denumire = _denumire;
    }

}


