pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC777/ERC777.sol";

/**
 * @title ERC777 demo token
 */
contract SimpleTokenERC777 is ERC777 {
    string public constant NAME="SimpleToken777";
    string public constant TOKEN="SIM777";
    uint8 public constant DECIMALS = 18;
    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(DECIMALS));
    address[]  operators;

    /**
     * @dev Constructor adds msg.sender to the list of oerators
     */
    constructor () public ERC777(NAME,TOKEN,operators) {
    }
}    
