// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";

interface IERC4907 is IERC165 {
    event UpdateUser(
        uint256 indexed tokenId,
        address indexed user,
        uint64 expires
    );

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function setUser(
        uint256 tokenId,
        address user,
        uint64 expires
    ) external payable;

    function userOf(uint256 tokenId) external view returns (address);

    function userExpires(uint256 tokenId) external view returns (uint256);
}
