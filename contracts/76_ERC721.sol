pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract MyNFT is ERC721Full, ERC721Mintable {
  constructor() ERC721Full("MyNFT1", "MNFT1") public {
  }
  
  function append(string memory a, string memory b) internal pure returns (string memory r) {
    return string(abi.encodePacked(a, b));
  }
  
  function uint2str(uint i) internal pure returns (string memory r){
    if (i == 0) return "0";
    uint j = i;
    uint length;
    while (j != 0){
        length++;
        j /= 10;
    }
    bytes memory bstr = new bytes(length);
    uint k = length - 1;
    while (i != 0){
        bstr[k--] = byte(uint8(48 + i % 10)); 
        i /= 10;
    }
    return string(bstr);
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
    
  function mintTokens(
      address _to,
      uint256  _tokenId,
      string  memory _tokenURI,
      uint256  _tokenCount
      ) public
      {
        for (uint i=0; i<_tokenCount; i++) {
          super._mint(_to, _tokenId+i);
          super._setTokenURI(_tokenId+i, append(_tokenURI, uint2str(i)));
        }
      }
}
