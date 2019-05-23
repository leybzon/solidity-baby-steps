pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC777/ERC777.sol";


/**
 * @title ERC777
 */
contract SimpleTokenERC777 is ERC777 {
    string public constant NAME="SimpleToken777";
    string public constant TOKEN="SIM777";
    uint8 public constant DECIMALS = 18;
    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(DECIMALS));
    address[]  operators;
    

    /**
     * @dev Constructor mints some tokens and gives them to contructor publisher
     */
    constructor () public ERC777(NAME,TOKEN,operators) {
        address operator=msg.sender;
        address to=msg.sender;
        uint256 amount=INITIAL_SUPPLY;
        bytes memory userData =  new bytes(1);
        bytes memory operatorData =  new bytes(1);
    
       _mint(operator, to, amount, userData, operatorData);
    }
}  
