//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LateGm is ERC1155, Ownable {

    string public name;
    string public symbol;

    mapping(uint256 => string) public tokenUris;

    constructor() ERC1155("") {
        name = "Late Gm";
        symbol = "LATEGM";
    }

    function mintAndSend(address[] memory _addresses, uint256 _id, uint256 _amount) public onlyOwner {
        uint256 i = 0;
        uint256 adresses = _addresses.length;

        for( i ; i < adresses ; ++i) {
            _mint(_addresses[i], _id, _amount, "");
        }
    }

    function setURI(uint256 _id, string memory _uri) public onlyOwner {
        tokenUris[_id] = _uri;
    }

    function uri(uint256 _id) public override view returns(string memory) {
        return tokenUris[_id];
    }
}