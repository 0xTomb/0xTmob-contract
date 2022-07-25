// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "./src/ERC4907.sol";

contract oxTomb is ERC4907 {
    constructor(string memory name_, string memory symbol_)
        ERC4907(name_, symbol_)
    {}
}
