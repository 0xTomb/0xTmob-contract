// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../auth/Auth.sol";

contract Sub is Auth {
    uint private subCycle;
    uint private subPrice;

    mapping(uint => uint) public subTokenInfo;

    // 延长有效期时间
    event ExtendSubTime(
        uint256 indexed tokenId,
        address indexed user,
        uint expires
    );

    // 设置单轮订阅时长
    function setSubCycle(uint _time) public onlyOwner {
        subCycle = _time;
    }

    // 设置单轮订阅价格
    function setSubPrice(uint _value) public onlyOwner {
        subPrice = _value;
    }

    /* mint时候的token初始化 */
    function tokenSubInit(uint _tokenID) internal {
        subTokenInfo[_tokenID] += block.timestamp + subCycle;
        emit ExtendSubTime(_tokenID, msg.sender, subTokenInfo[_tokenID]);
    }

    /* 延长token订阅时间 */
    function tokenSubExtend(uint _tokenID) external payable {
        /*     require(msg.value >= subPrice); */
        subTokenInfo[_tokenID] += subCycle;
        emit ExtendSubTime(_tokenID, msg.sender, subTokenInfo[_tokenID]);
    }

    /* 撤销订阅时间 */
    function _toeknRevokeSub(uint _tokenID) internal {
        subTokenInfo[_tokenID] = block.timestamp;
        emit ExtendSubTime(_tokenID, msg.sender, subTokenInfo[_tokenID]);
    }

    /* token是否在有效期内 */
    function isExp(uint _tokenID) public view returns (bool) {
        return block.timestamp < subTokenInfo[_tokenID];
    }
}
