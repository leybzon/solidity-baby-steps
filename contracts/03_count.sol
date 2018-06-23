pragma solidity ^0.4.24;

contract Count {
  uint public value = 0;
  
  function plus() public returns (uint) {
     value++;
     return value;
  }
}
