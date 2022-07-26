// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract oxTomb is ERC721, Ownable {
    uint64 counter = 1;

    // 合约配置项
    string BASEURI;
    string CONTRACTURI;
    address PROXYADDRESS;

    // 基础配置
    uint subscriptionCycle = 7 days; // 7天
    uint sellPrice = 0.0088 ether;

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
    }

    // tokenId 与 其下信息的映射
    mapping(uint => TokenInfoStruct) private _tokens;

    constructor(string memory name_, string memory symbol_)
    ERC721(name_, symbol_)
    {}

    function mint(address player) public payable {
        _mint(player, counter);
        extendExpiresTimeByTokenId(counter);
        _tokens[counter].user = player;
        _tokens[counter].transferTimes = 1;
        counter++;
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
        string memory baseURI = _baseURI();
        return
        bytes(baseURI).length != 0
        ? string(abi.encodePacked(baseURI, toString(tokenId), ".json"))
        : "";
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
    public
    view
    returns (TokenInfoStruct memory)
    {
        return _tokens[_tokenId];
    }

    // 当前tokenid是否在有效期内
    function isExpiresByTokenId(uint _tokenId) public view returns (bool) {
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

    fallback() external payable {
        (bool success, bytes memory res) = PROXYADDRESS.delegatecall(msg.data);
        res;
        assembly {
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, returndatasize())
            switch success
            case 0 {
                revert(ptr, returndatasize())
            }
            default {
                return (ptr, returndatasize())
            }
        }
    }

    receive() external payable {}

    function setContractURI(string memory _contractURI) public onlyOwner {
        CONTRACTURI = _contractURI;
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        BASEURI = baseURI;
    }

    function setProxyContract(address _proxyAddress) public onlyOwner {
        PROXYADDRESS = _proxyAddress;
    }

    // 设置每一轮的时间
    function setSubscriptionCycle(uint _time) public onlyOwner {
        subscriptionCycle = _time;
    }

    function setSellPrice(uint _sellPrice) public onlyOwner {
        sellPrice = _sellPrice;
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
}
