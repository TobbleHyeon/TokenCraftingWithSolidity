// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract A {
    string public myName = "ds34";
    uint private level = 10;
    uint internal age = 33;

    function getLevel() public view returns(uint) {
        return level;
    }
}

contract B is A {
    function getAge() public view returns(uint){
        return age;
    }

    function publicFunc() public pure returns(string memory) {
        return "public";
    }

    function externalFunc() external pure returns(string memory) {
        return "public";
    }

    function callFunc() public pure returns (string memory) {
        return publicFunc();
    }
}