// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../auth/Auth.sol";

contract Contract is Auth {
    event ContractURIChanged(address indexed oprator, string indexed url);

    string private _contractURI;

    /* 对外暴露contractURI */
    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    function changedContractURI(string memory _url) public virtual onlyOwner {
        _contractURI = _url;
        emit ContractURIChanged(msg.sender, _url);
    }
}
