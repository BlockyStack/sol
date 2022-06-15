// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract BlockyStack is ERC721URIStorage {
    address private owner;

    constructor() public ERC721("Blocky Stack", "bSTACK") {
        owner = msg.sender;
    }

    function ownerMint(uint256 _tokenId, string memory _tokenURI) public {
        require(msg.sender == owner, "Only owner can mint");
        _mint(owner, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
    }

}
