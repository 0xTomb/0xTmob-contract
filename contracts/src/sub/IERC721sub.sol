// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../ERC/utils/IERC165.sol";

interface Sub is IERC165 {
    event ExtendSubTime(
        uint256 indexed tokenId,
        address indexed user,
        uint expires
    );

    event TokenIsExp(uint indexed tokenId);

    function setSubCycle(uint _time) external;

    function setSubPrice(uint _value) external;

    function tokenSubInit(uint _tokenID) external;

    function tokenSubExtend(uint _tokenID) external payable;

    function toeknSubRevoke(uint _tokenID) external;

    function tokenIsExp(uint _tokenID) external returns (bool);
}
