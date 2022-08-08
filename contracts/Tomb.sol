// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "./src/data/Contract.sol";
import "./src/data/Metadata.sol";

contract Tomb is Contract, Metadata {
    bool hasInitLize; // 初始化

    // 基础配置
    uint subscriptionCycle;
    uint sellPrice;
    uint subscriptionPrice;

    // 事件：更新有效期时间
    event UpdateExpires(
        uint256 indexed tokenId,
        address indexed user,
        uint expires
    );

    struct TokenInfoStruct {
        address user;
        uint expires;
        uint transferTimes;
        bool isLettering;
    }

    // tokenId 与 其下信息的映射
    mapping(uint => TokenInfoStruct) private _tokens;
    mapping(uint => string) private _tokenURIHash;
    mapping(address => uint[]) public userOf;

    event Letter(uint indexed tokenId);

    function initialize(string memory _name, string memory _symbol) public {
        require(!hasInitLize);

        ERC721Init(_name, _symbol); // ERC721初始化
        _transferOwnership(msg.sender); // 移交owner权限

        /* 初始化配置参数 */
        subscriptionCycle = 7 days;
        sellPrice = 0.088 ether;
        subscriptionPrice = 0.088 ether;

        hasInitLize = true;
    }

    // 铸造一个新的tokenId
    function mint(
        address player,
        uint tokenID,
        string memory tokenURiHash
    ) external payable {
        // require(msg.value == sellPrice);

        // mint
        _mint(player, tokenID);
        _setTokenHash(tokenID, tokenURiHash);

        _tokenURIHash[tokenID] = tokenURiHash; // metadata
        extendExpiresTimeByTokenId(tokenID);
        _tokens[tokenID].user = player;
        _tokens[tokenID].transferTimes = 1;
        userOf[player].push(tokenID);
    }

    // 延长订阅一个tokenId
    function subscription(uint _tokenId)
        external
        payable
        onlyOwnerOrCreator(_tokenId)
    {
        // require(msg.value >= subscriptionPrice);
        extendExpiresTimeByTokenId(_tokenId);
    }

    function lettering(uint _tokenId) external onlyOwnerOrCreator(_tokenId) {
        TokenInfoStruct memory token = _tokens[_tokenId];
        require(token.isLettering == false);
        require(token.expires > block.timestamp);
        token.isLettering = true;
        emit Letter(_tokenId);
    }

    // 延长一轮token有效期
    function extendExpiresTimeByTokenId(uint _tokenId) private {
        TokenInfoStruct storage tokenInfo = _tokens[_tokenId];
        if (tokenInfo.expires == 0) {
            tokenInfo.expires = subscriptionCycle + block.timestamp;
        } else {
            tokenInfo.expires += subscriptionCycle;
        }

        emit UpdateExpires(_tokenId, tokenInfo.user, tokenInfo.expires);
    }

    // 查询token的归属与有效期
    function queryExpiresByTokenId(uint _tokenId)
        external
        view
        returns (TokenInfoStruct memory)
    {
        return _tokens[_tokenId];
    }

    // 当前tokenid是否在有效期内
    function isExpiresByTokenId(uint _tokenId) external view returns (bool) {
        if (_tokens[_tokenId].expires >= block.timestamp) return true;
        return false;
    }

    // 设置每一轮的时间
    function setSubscriptionCycle(uint _time) external onlyOwner {
        subscriptionCycle = _time;
    }

    function setSellPrice(uint _sellPrice) external onlyOwner {
        sellPrice = _sellPrice;
    }

    function setSubscriptionPrice(uint _subscriptionPrice) external onlyOwner {
        subscriptionPrice = _subscriptionPrice;
    }

    function _afterTokenTransfer(
        address,
        address to,
        uint256 tokenId
    ) internal virtual override {
        TokenInfoStruct memory token = _tokens[tokenId];
        token.transferTimes++;
        token.user = to;
    }

    modifier onlyOwnerOrCreator(uint _tokenId) {
        require(
            _msgSender() == owner() || _msgSender() == _tokens[_tokenId].user
        );
        _;
    }
}
