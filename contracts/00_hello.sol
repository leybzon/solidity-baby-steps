pragma solidity ^0.5.4;

contract Hello {
  constructor() public {
    // constructor
  }

  function sayHello() public pure returns (string) {
     return 'Hello World!';
  }
}
