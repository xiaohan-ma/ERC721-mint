// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract EthPonies is ERC721URIStorage{

    //Keep track of tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string _tokenURI = "https://jsonkeeper.com/b/85EW";
    uint256 private _price = 0.01 ether;

    constructor() ERC721("EthPonies", "EPNY"){
        console.log("Test smart contract");
    }

    //Function to mint the NFT
    function birthPony(uint256 num) public payable{
        //Minting multiple (!!!!!!CURRENTLY THE LIMIT IS INFINITE!!!!!)
        require(msg.value >= _price * num, "Incorrent ether amount sent");
        for(uint256 i; i<num; i++){
            uint256 newItemId = _tokenIds.current();
            _safeMint(msg.sender, newItemId);
            _setTokenURI(newItemId, _tokenURI); 
            _tokenIds.increment();
        }
    }


}