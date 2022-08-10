//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIDCounter;

    constructor() ERC721("MyNFT", "MNFT"){}
 
    function mint(address to) public onlyOwner {
        uint256 tokenId = _tokenIDCounter.current();
        super._safeMint(to, tokenId);
        _tokenIDCounter.increment();
    }

    function getCurrentTokenID() public view returns(uint256){
        return _tokenIDCounter.current();
    }

    function _baseURI() internal pure override returns(string memory){
        return "https://thisIsMyToken/";
    }

    function transfer(address to, uint256 tokenId) public {
        address from = msg.sender;
        super._transfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) 
    public
    view 
    override(ERC721, ERC721Enumerable) 
    returns(bool) {
        return super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable){
        super._beforeTokenTransfer(from, to, tokenId);
    }
}