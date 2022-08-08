// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Letter {
    /* 查询是否刻字，已刻字则不许再刻 */
    mapping(uint => bool) public hasLetter;

    event LetterEvent(uint indexed tokenId, address indexed oprator);

    /* 设置是否有刻字 */
    function _setHasLetter(uint _tokenID, bool _state) internal {
        hasLetter[_tokenID] = _state;
        emit LetterEvent(_tokenID, msg.sender);
    }

    /* TODO */
    /* 刻字 */
    function tokenLetter(uint _tokenID) external {
        require(hasLetter[_tokenID] == false);
        hasLetter[_tokenID] = true;
        emit LetterEvent(_tokenID, msg.sender);
    }
}
