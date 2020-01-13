pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract MyNFT is ERC721Full, ERC721Mintable {
  constructor() ERC721Full("IPFS", "IPFS_DEMO") public {
  }
  
  function mint1(uint256 _uid) public{
      _mint(msg.sender, _uid);
  }
  
  function mintUniqueTokenTo(
    address _to,
    uint256  _tokenId,
    string  memory _tokenURI
    ) public
    {
        super._mint(_to, _tokenId);
        super._setTokenURI(_tokenId, _tokenURI);
    }
}
