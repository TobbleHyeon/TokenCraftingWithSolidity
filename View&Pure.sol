// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract A {
    string public myName = "hyeonseok";

    function setMyName(string memory _myName) public {
        myName = _myName;
    }

    function getMyName() public view returns(string memory){
        // blockchain 상의 데이터를 사용할때 view 
        return myName;
    }

    function getMySumResult() public pure returns(uint) {
        // blockchain 상의 데이터를 사용하지 않을때 pure
        uint a = 2;
        uint b = 10;

        return a + b;
    }
}