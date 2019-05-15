pragma solidity ^0.5.0;

contract Count {
  uint public value = 0;
  
  event Changed(
        uint _value
  );
  
  function plus() public returns (uint) {
     value++;
     emit Changed(value);
     
     return value;
  }
}
