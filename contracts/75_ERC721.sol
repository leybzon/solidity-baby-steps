pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract MyNFT is ERC721Full, ERC721Mintable {
  constructor() ERC721Full("MyNFT1", "MNFT1") public {
  }
 
    /**
    * @dev Mints a token to an address with a tokenURI.
    */
    function mintOne() public onlyOwner {
        uint256 newTokenId = _getNextTokenId();
        _mint(msg.sender, newTokenId);
        //_setTokenURI(newTokenId, _tokenURI);
    }

    /**
    * @dev calculates the next token ID based on totalSupply
    * @return uint256 for the next token ID
    */
    function _getNextTokenId() private view returns (uint256) {
        return totalSupply().add(1); 
    }
}
