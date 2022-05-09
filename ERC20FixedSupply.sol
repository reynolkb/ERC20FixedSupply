// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20FixedSupply is ERC20 {
    uint256 public maxSupply = 2000;
    uint256 public cost = 0.01 ether;

    constructor() ERC20("Fixed", "FIX") {
        _mint(msg.sender, 1000);
    }

    function mint(uint256 _mintAmount) public payable {
        uint256 supply = totalSupply();
        require(supply + _mintAmount <= maxSupply, "The current supply plus your mint amount has to be less then or equal to the max supply.");
        require(msg.value == cost * _mintAmount, "Please send 0.1 ETH per ERC-20 you want to mint.");

        _mint(msg.sender, _mintAmount);
    }
}