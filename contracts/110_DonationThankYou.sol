// SPDX-License-Identifier: MIT
// Created by Gene L. for https://www.meetup.com/Blockchain-Applications-and-Smart-Contracts/
pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.1.0/contracts/token/ERC20/ERC20.sol";



contract ThankYouToken is Context, ERC20 {

    string public constant _name = "Thank You!";
    string public constant _symbol = "THANK_YOU";

    constructor () public ERC20(_name, _symbol) {
        _mint(msg.sender, 1000000000 * 10  ** uint256(decimals()));
    }
}


contract SayThankYou {
    event ThanksEvent(address donor, uint256 amount);
    
    ThankYouToken public token;
    address public owner;

    modifier onlyowner {
        require(owner == msg.sender);
        _;
    }
    constructor() public {
        token = new ThankYouToken();
        owner = msg.sender ;
    }
    
    function transferOwnership(address newOwner) public onlyowner {
        owner = newOwner;
    }
    
    function donate() payable public {
        uint256 donation = msg.value;
        require(donation > 0, "You need to send some Ether");
        
        token.transfer(msg.sender, 10 ** uint256(token.decimals()));
        
        emit ThanksEvent(msg.sender, donation);
    }
    
    fallback() external payable {
        donate(); 
    }
    
    function withdraw() public onlyowner {
        msg.sender.transfer(address(this).balance);
    }
}
