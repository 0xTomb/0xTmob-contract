// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import {IERC4907} from "./IERC4907.sol";

contract ERC4907 is ERC721, IERC4907, Ownable {
    struct UserInfo {
        address user;
        uint64 expires;
    }

    // tokenid => tokenInfo
    mapping(uint256 => UserInfo) internal _tokens;

    constructor(string memory name_, string memory symbol_)
        ERC721(name_, symbol_)
    {}

    /**
     * 设置token的过期时间
     * @ tokenId {uint256}
     * @ address {user}
     * @ uint64 {expires}
     *
     */
    function setUser(
        uint256 tokenId,
        address user,
        uint64 expires
    ) external payable {
        require(
            _isApprovedOrOwner(msg.sender, tokenId) || msg.sender == owner(),
            "setUser: setUser caller is not owner nor approved"
        );
        UserInfo storage info = _tokens[tokenId];
        info.user = user;
        info.expires = expires;
        emit UpdateUser(tokenId, user, expires);
    }

    function userOf(uint256 tokenId) public view virtual returns (address) {
        if (uint256(_tokens[tokenId].expires) >= block.timestamp) {
            return _tokens[tokenId].user;
        } else {
            return address(0);
        }
    }

    function userExpires(uint256 tokenId)
        public
        view
        virtual
        returns (uint256)
    {
        return _tokens[tokenId].expires;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721, IERC4907)
        returns (bool)
    {
        return
            interfaceId == type(IERC4907).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (from != to && _tokens[tokenId].user != address(0)) {
            delete _tokens[tokenId];
            emit UpdateUser(tokenId, address(0), 0);
        }
    }
}
