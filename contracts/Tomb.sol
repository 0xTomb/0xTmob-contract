// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "./src/data/Contract.sol";
import "./src/data/Metadata.sol";
import "./src/sub/Sub.sol";
import "./src/Letter/Letter.sol";

contract Tomb is Contract, Metadata, Sub, Letter {
    bool hasInitLize; // 初始化
    uint sellPrice; // 出售价格

    function initialize(string memory _name, string memory _symbol) public {
        require(!hasInitLize);

        ERC721Init(_name, _symbol); // ERC721初始化
        _transferOwnership(msg.sender); // 移交owner权限

        setSubCycle(60 * 60 * 24 * 7); // 单轮订阅时长
        setSubPrice(880000000000); // 单轮订阅价格

        hasInitLize = true;
    }

    // 铸造一个新的tokenId
    function mint(
        address _player,
        uint _tokenID,
        string memory _tokenURiHash
    ) external payable {
        // require(msg.value == sellPrice);
        _mint(_player, _tokenID);
        _setTokenHash(_tokenID, _tokenURiHash);
    }

    function setSellPrice(uint _sellPrice) external onlyOwner {
        sellPrice = _sellPrice;
    }

    function _afterTokenTransfer(
        address,
        address to,
        uint256 _tokenID
    ) internal virtual override {
        require(ownerOf(_tokenID) == to);
        _toeknRevokeSub(_tokenID);
        _setHashLetter(_tokenID, false);
    }
}
