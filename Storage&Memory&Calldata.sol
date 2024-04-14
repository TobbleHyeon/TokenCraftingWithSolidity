// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract A {
    struct Tree {
        uint level;
        string color;
        string shape;
    }

    mapping(uint => Tree) trees;

    function setColor(uint _treeId, string calldata _color) public {
        Tree storage tree = trees[_treeId];

        tree.color = _color;
    }

    function getColor(uint _treeId) public view returns (string memory) {
       Tree memory tree = trees[_treeId];

       return tree.color;
    }

    // blockchain 의 어떤 값을 업데이트 하기 위해서는 storage를 사용.
    // 단순히 값만 출력하는 형태는 memory 변수를 사용해 주고, input Data는 calldata를 사용해서 가스비를 절약.
}