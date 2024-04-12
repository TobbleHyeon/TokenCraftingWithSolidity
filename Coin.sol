// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Coin {
    string public name;
    string public symbol;
    mapping(address => uint) public coin;

    address public owner;

    modifier checkCoin(uint _amount) {
        require(coin[msg.sender] >= _amount, "Not enough coin. (send)");
        _;
    }

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
    }

    function mint(uint _coin) public {
        require(owner == msg.sender, "You are not owner!");
        // coin +=_coin;
        coin[msg.sender] += _coin;
    }

    function send(address _to, uint _amount) public checkCoin(_amount) {
        coin[msg.sender] = coin[msg.sender] - _amount;
        coin[_to] = coin[_to] + _amount;
    }

    function burn(uint _amount) public checkCoin(_amount) {
        coin[msg.sender] = coin[msg.sender] - _amount;
    }

}