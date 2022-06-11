// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract OasisStack is ERC721URIStorage {
    address private owner;

    constructor() public ERC721("Oasis Stack", "OASISSTACK") {
        owner = msg.sender;
    }

    function ownerMint(uint256 _tokenId, string memory _tokenURI) public {
        require(msg.sender == owner, "Only owner can mint");
        _mint(owner, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
    }

    function mixColor(uint256 _tokenIdA, uint256 _tokenIdB, string memory _tokenURI) public {
        require(ownerOf(_tokenIdA) == msg.sender, "User does not own NFT");
        require(ownerOf(_tokenIdB) == msg.sender, "User does not own NFT");
        uint256 mixTokenId = (_tokenIdA + _tokenIdB) % 255255255;
        _mint(msg.sender, mixTokenId);
        _setTokenURI(mixTokenId, _tokenURI);
    }

}
