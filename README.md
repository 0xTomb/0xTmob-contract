 Sūrya's Description Report

 Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| contracts/Tomb.sol | a2de64f85fa7adb1807eb1026b48cc6f18e7a2ff |
| contracts/src/data/Contract.sol | fb0bd2a459d63ac949fc8c547efc6add52caa162 |
| contracts/src/auth/Auth.sol | 61437f46cdbc5b4c8c939b603a6f1efdc1d1f1d5 |
| contracts/src/data/Metadata.sol | 87c77896fc511eaf169c45b6de6cf06ac2250859 |
| contracts/src/ERC/ERC721.sol | e47ea755d01f26cd1474abc0f6100e171caa4d3c |
| contracts/src/ERC/IERC721.sol | b9ebb4b8b338bdc6963743014a76e23a157e4119 |
| contracts/src/ERC/utils/IERC165.sol | 43739edf670c0c187687f4e80674f1cb00c84926 |
| contracts/src/ERC/IERC721Receiver.sol | c275765b9986651aacb05123459af40286d98189 |
| contracts/src/ERC/IERC721Metadata.sol | 3aebae13a1e494a352d6a9e6fcbd3da4e2209248 |
| contracts/src/ERC/utils/Address.sol | 815a50a023c9e0ebc3c4580e412b39a7bfc031a2 |
| contracts/src/ERC/utils/Context.sol | 707026989f1d8217aa9fed3d6a58f37b6a5f9c30 |
| contracts/src/ERC/utils/Strings.sol | 6e1d2ec3d4269f967cd342ec603b0d74d36acc9d |
| contracts/src/ERC/utils/ERC165.sol | 0457916fc0867075953c85f957f0cc3798e0e685 |
| contracts/src/sub/Sub.sol | 1b192de0403e8031de6764d39bd2908a1b6d3e29 |
| contracts/src/Letter/Letter.sol | 6d8587451dfd546d848d455ee787d18609989c02 |
| contracts/src/weathering/Weathering.sol | 4c3a2ae92e015ddae7dc5d35037f2387e8d4c1a6 |


 Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Tomb** | Implementation | Contract, Metadata, Sub, Letter, Weathering |||
| └ | initialize | Public ❗️ | 🛑  |NO❗️ |
| └ | mint | External ❗️ |  💵 |NO❗️ |
| └ | setSellPrice | External ❗️ | 🛑  | onlyOwner |
| └ | _afterTokenTransfer | Internal 🔒 | 🛑  | |
||||||
| **Contract** | Implementation | Auth |||
| └ | contractURI | Public ❗️ |   |NO❗️ |
| └ | changedContractURI | Public ❗️ | 🛑  | onlyOwner |
||||||
| **Auth** | Implementation |  |||
| └ | owner | Public ❗️ |   |NO❗️ |
| └ | _checkOwner | Internal 🔒 |   | |
| └ | renounceOwnership | Public ❗️ | 🛑  | onlyOwner |
| └ | transferOwnership | Public ❗️ | 🛑  | onlyOwner |
| └ | _transferOwnership | Internal 🔒 | 🛑  | |
||||||
| **Metadata** | Implementation | Auth, ERC721 |||
| └ | _setTokenHash | Internal 🔒 | 🛑  | |
| └ | setTokenURI | Public ❗️ | 🛑  | onlyOwner |
| └ | tokenURI | Public ❗️ |   |NO❗️ |
| └ | toString | Internal 🔒 |   | |
||||||
| **ERC721** | Implementation | Context, ERC165, IERC721, IERC721Metadata |||
| └ | ERC721Init | Internal 🔒 | 🛑  | |
| └ | supportsInterface | Public ❗️ |   |NO❗️ |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | ownerOf | Public ❗️ |   |NO❗️ |
| └ | name | Public ❗️ |   |NO❗️ |
| └ | symbol | Public ❗️ |   |NO❗️ |
| └ | tokenURI | Public ❗️ |   |NO❗️ |
| └ | _baseURI | Internal 🔒 |   | |
| └ | approve | Public ❗️ | 🛑  |NO❗️ |
| └ | getApproved | Public ❗️ |   |NO❗️ |
| └ | setApprovalForAll | Public ❗️ | 🛑  |NO❗️ |
| └ | isApprovedForAll | Public ❗️ |   |NO❗️ |
| └ | transferFrom | Public ❗️ | 🛑  |NO❗️ |
| └ | safeTransferFrom | Public ❗️ | 🛑  |NO❗️ |
| └ | safeTransferFrom | Public ❗️ | 🛑  |NO❗️ |
| └ | _safeTransfer | Internal 🔒 | 🛑  | |
| └ | _exists | Internal 🔒 |   | |
| └ | _isApprovedOrOwner | Internal 🔒 |   | |
| └ | _safeMint | Internal 🔒 | 🛑  | |
| └ | _safeMint | Internal 🔒 | 🛑  | |
| └ | _mint | Internal 🔒 | 🛑  | |
| └ | _burn | Internal 🔒 | 🛑  | |
| └ | _transfer | Internal 🔒 | 🛑  | |
| └ | _approve | Internal 🔒 | 🛑  | |
| └ | _setApprovalForAll | Internal 🔒 | 🛑  | |
| └ | _requireMinted | Internal 🔒 |   | |
| └ | _checkOnERC721Received | Private 🔐 | 🛑  | |
| └ | _beforeTokenTransfer | Internal 🔒 | 🛑  | |
| └ | _afterTokenTransfer | Internal 🔒 | 🛑  | |
||||||
| **IERC721** | Interface | IERC165 |||
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | ownerOf | External ❗️ |   |NO❗️ |
| └ | safeTransferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | safeTransferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | setApprovalForAll | External ❗️ | 🛑  |NO❗️ |
| └ | getApproved | External ❗️ |   |NO❗️ |
| └ | isApprovedForAll | External ❗️ |   |NO❗️ |
||||||
| **IERC165** | Interface |  |||
| └ | supportsInterface | External ❗️ |   |NO❗️ |
||||||
| **IERC721Receiver** | Interface |  |||
| └ | onERC721Received | External ❗️ | 🛑  |NO❗️ |
||||||
| **IERC721Metadata** | Interface | IERC721 |||
| └ | name | External ❗️ |   |NO❗️ |
| └ | symbol | External ❗️ |   |NO❗️ |
| └ | tokenURI | External ❗️ |   |NO❗️ |
||||||
| **Address** | Library |  |||
| └ | isContract | Internal 🔒 |   | |
| └ | sendValue | Internal 🔒 | 🛑  | |
| └ | functionCall | Internal 🔒 | 🛑  | |
| └ | functionCall | Internal 🔒 | 🛑  | |
| └ | functionCallWithValue | Internal 🔒 | 🛑  | |
| └ | functionCallWithValue | Internal 🔒 | 🛑  | |
| └ | functionStaticCall | Internal 🔒 |   | |
| └ | functionStaticCall | Internal 🔒 |   | |
| └ | verifyCallResult | Internal 🔒 |   | |
||||||
| **Context** | Implementation |  |||
| └ | _msgSender | Internal 🔒 |   | |
| └ | _msgData | Internal 🔒 |   | |
||||||
| **Strings** | Library |  |||
| └ | toString | Internal 🔒 |   | |
| └ | toHexString | Internal 🔒 |   | |
| └ | toHexString | Internal 🔒 |   | |
| └ | toHexString | Internal 🔒 |   | |
||||||
| **ERC165** | Implementation | IERC165 |||
| └ | supportsInterface | Public ❗️ |   |NO❗️ |
||||||
| **Sub** | Implementation | Auth |||
| └ | setSubCycle | Public ❗️ | 🛑  | onlyOwner |
| └ | setSubPrice | Public ❗️ | 🛑  | onlyOwner |
| └ | _tokenSubInit | Internal 🔒 | 🛑  | |
| └ | tokenSubExtend | External ❗️ |  💵 |NO❗️ |
| └ | _toeknRevokeSub | Internal 🔒 | 🛑  | |
| └ | isExp | Public ❗️ |   |NO❗️ |
||||||
| **Letter** | Implementation |  |||
| └ | _setHasLetter | Internal 🔒 | 🛑  | |
| └ | tokenLetter | External ❗️ | 🛑  |NO❗️ |
||||||
| **Weathering** | Implementation |  |||
| └ | _addWeatheringTimes | Internal 🔒 | 🛑  | |


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
