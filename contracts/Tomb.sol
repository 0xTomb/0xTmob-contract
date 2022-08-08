// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "./src/data/Contract.sol";
import "./src/data/Metadata.sol";
import "./src/sub/Sub.sol";
import "./src/Letter/Letter.sol";
import "./src/weathering/Weathering.sol";

contract Tomb is Contract, Metadata, Sub, Letter, Weathering {
    bool hasInitLize; // 初始化

    uint public sellPrice; // 出售价格

    uint counter; // tmp
    mapping(address => uint[]) public userOfTokens;

    function initialize(string memory _name, string memory _symbol) public {
        require(!hasInitLize);

        counter = 1; // tmp

        ERC721Init(_name, _symbol); // ERC721初始化
        _transferOwnership(msg.sender); // 移交owner权限

        setSubCycle(60 * 60 * 24 * 7); // 单轮订阅时长
        setSubPrice(880000000000); // 单轮订阅价格

        hasInitLize = true;
    }

    // 铸造一个新的tokenId
    function mint(address _player, string memory _tokenURiHash)
        external
        payable
    {
        uint _tokenID = counter;
        require(subTokenInfo[_tokenID] == 0);
        // require(msg.value == sellPrice);
        _mint(_player, _tokenID);
        _tokenSubInit(_tokenID);
        _setTokenHash(_tokenID, _tokenURiHash);

        userOfTokens[_player].push(counter); // tmp
        counter++;
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
        _setHasLetter(_tokenID, false);
        _addWeatheringTimes(_tokenID);
    }
}
