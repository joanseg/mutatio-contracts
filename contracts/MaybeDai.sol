pragma solidity ^0.5.0;

import "../node_modules/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract MaybeDai is StandardToken {
  string public name = "maybeDai";
  string public symbol = "MDAI";
  uint8 public decimals = 2;
  uint public INITIAL_SUPPLY = 10000;

  function MyTokenFunction() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    emit Transfer(address(0), msg.sender, totalSupply_);
  }
}
