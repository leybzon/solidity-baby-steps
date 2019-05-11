pragma solidity ^0.5.0;
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/Ownable.sol';

contract DoggoTime is ERC721Full {
    using Counter for Counter.Index;
    Counter.Index private tokenId;

    constructor(
        string name,
        string symbol,
    )
        ERC721Full(name, symbol)
        public
    {}

    function createDoggoTimeframe(
        string tokenURI
    )
        public
        returns (bool)
    {
        uint256 doggoTokenId = tokenId.next();
        _mint(msg.sender, doggoTokenId);
        _setTokenURI(doggoTokenId, tokenURI);
        return true;
    }
}
