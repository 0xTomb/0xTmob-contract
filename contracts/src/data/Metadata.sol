// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../auth/Auth.sol";
import "../ERC/ERC721.sol";

contract Metadata is Auth, ERC721 {
    string private _baseTokenURI;
    mapping(uint => string) public tokenHash;

    /* 设置tokenhash */
    function _setTokenHash(uint tokenID, string memory _tokenHash) internal {
        tokenHash[tokenID] = _tokenHash;
    }

    /* 设置tokenURI */
    function setTokenURI(string memory _tokenURI) public onlyOwner {
        _baseTokenURI = _tokenURI;
    }

    /* 查询tokenID */
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        return
            bytes(_baseTokenURI).length != 0
                ? string(
                    abi.encodePacked(_baseTokenURI, tokenHash[tokenId], ".json")
                )
                : "";
    }

    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
