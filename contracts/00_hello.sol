pragma solidity ^0.4.24;

contract Hello {
  constructor() public {
    // constructor
  }

  function sayHello() public pure returns (string) {
     return 'Hello World!';
  }
}
