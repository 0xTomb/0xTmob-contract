// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "./src/auth/Auth.sol";
import "./src/ERC/ERC721.sol";

contract Tomb is ERC721, Auth {
    uint64 counter;
    bool hasInitLize;

    // 合约配置项
    string BASEURI; // 刻字：有字碑文
    string DEFAULTURI; // 默认：无字碑
    string CONTRACTURI;
    address PROXYADDRESS;

    // 基础配置
    uint subscriptionCycle; // 7天
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
        counter++; // 初始化conter为1
        _transferOwnership(msg.sender); // 移交owner权限

        subscriptionCycle = 7 days;
        sellPrice = 0.088 ether;
        subscriptionPrice = 0.088 ether;

        hasInitLize = true;
    }

    // 铸造一个新的tokenId
    function mint(address player, string memory hash)
        external
        payable
        returns (uint)
    {
        // require(msg.value == sellPrice);
        _mint(player, counter); // mint
        _tokenURIHash[counter] = hash; // metadata
        extendExpiresTimeByTokenId(counter);
        _tokens[counter].user = player;
        _tokens[counter].transferTimes = 1;
        userOf[player].push(counter);
        counter++;
        return counter;
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

    function contractURI() public view returns (string memory) {
        return CONTRACTURI;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        TokenInfoStruct memory token = _tokens[tokenId];
        if (token.isLettering && token.expires > block.timestamp) {
            return
                string(
                    abi.encodePacked(
                        _baseURI(),
                        _tokenURIHash[tokenId],
                        ".json"
                    )
                );
        } else {
            return DEFAULTURI;
        }
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return BASEURI;
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

    receive() external payable {}

    function setContractURI(string memory _contractURI) external onlyOwner {
        CONTRACTURI = _contractURI;
    }

    function setBaseURI(string memory baseURI) external onlyOwner {
        BASEURI = baseURI;
    }

    function setProxyContract(address _proxyAddress) external onlyOwner {
        PROXYADDRESS = _proxyAddress;
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

    function serDefaultURI(string memory _defaultURI) external onlyOwner {
        DEFAULTURI = _defaultURI;
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
