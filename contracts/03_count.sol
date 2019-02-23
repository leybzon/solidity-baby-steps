pragma solidity ^0.5.0;

contract Count {
  uint public value = 0;
  
  function plus() public returns (uint) {
     value++;
     return value;
  }
}
