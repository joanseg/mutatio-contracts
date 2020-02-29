pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MaybeDai is ERC20 {
  string public name = "maybeDai";
  string public symbol = "MDAI";
  uint8 public decimals = 2;
  uint public INITIAL_SUPPLY = 10000;

  function MyTokenFunction() public {
    _mint(msg.sender, INITIAL_SUPPLY);
    emit Transfer(address(0), msg.sender, totalSupply());
  }
}
