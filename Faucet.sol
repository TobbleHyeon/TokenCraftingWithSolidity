// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Faucet {
    uint public faucetBalance = 0;
    // 10^18 wei = 1 eth
    uint public faucetAmount = 1 * 10**17;

    mapping(address => uint) public faucetTimes;

    function aid() public payable {
        faucetBalance += msg.value;
    }

    function faucet() public {
        require(faucetTimes[msg.sender] <= block.timestamp, "Too early");
        require(faucetBalance >=  faucetAmount, "Not enough Matic.");

        payable(msg.sender).transfer(faucetAmount);
        faucetBalance -= faucetAmount; // faucetBalance = faucetBalance - faucetAmount;

        faucetTimes[msg.sender] = block.timestamp + 30;
    }
}