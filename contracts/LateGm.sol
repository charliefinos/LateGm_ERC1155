//SPDX-License-Identifier: MIT

// ██╗      █████╗ ████████╗███████╗     ██████╗ ███╗   ███╗
// ██║     ██╔══██╗╚══██╔══╝██╔════╝    ██╔════╝ ████╗ ████║
// ██║     ███████║   ██║   █████╗      ██║  ███╗██╔████╔██║
// ██║     ██╔══██║   ██║   ██╔══╝      ██║   ██║██║╚██╔╝██║
// ███████╗██║  ██║   ██║   ███████╗    ╚██████╔╝██║ ╚═╝ ██║
// ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝     ╚═════╝ ╚═╝     ╚═╝         
// @author >> @charliefinos 

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LateGm is ERC1155, Ownable {

    string public name;
    string public symbol;

    mapping(uint => string) public tokenUris;

    constructor() ERC1155("") {
        name = "Late Gm";
        symbol = "LATEGM";
    }

    function mintAndSend(address[] memory _addresses, uint _id, uint _amount) public onlyOwner {
        for( uint i = 0 ; i < _addresses.length ; ++i) {
            _mint(_addresses[i], _id, _amount, "");
        }
    }

    // Set Uri ipfs for each id
    function setURI(uint _id, string memory _uri) public onlyOwner {
        tokenUris[_id] = _uri;
    }

    // Read uri string for selected token
    function uri(uint _id) public override view returns(string memory) {
        return tokenUris[_id];
    }

    // Just in case someone send eth to this address
    function withdrawAll() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }
}