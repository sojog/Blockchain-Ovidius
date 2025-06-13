
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract HelloWorld {

    uint256 private value  = 400;

    function hello() public pure returns (string memory) {
        return "Hello World!";
    }


    function setValue(uint256 _newValue) public {
        value = _newValue;
    }

    function getValue() public view returns (uint256) {
        return value;
    }



}

