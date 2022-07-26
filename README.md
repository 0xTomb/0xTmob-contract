 Sūrya's Description Report

 Files Description Table


| File Name                                                                                                            | SHA-1 Hash                               |
| -------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| /Users/kaso/Desktop/0xTomb-contract/contracts/OxTomb.sol                                                             | de30cc18476357545e00f0530667799c2ed98e91 |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/hardhat/console.sol                                                 | ba36558e776f482d532a19c9857446aeaec0f0ca |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/access/Ownable.sol                          | 691ac8cc8ecc93fa144beb50c3b0263300d15321 |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/utils/Context.sol                           | 719844505df30bda93516e78eab1ced3bfe9ff4a |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol                     | 176c437a3504e5ce44866ed2fb1312dea872890f |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol                    | e27fb8dd0800b3a5ed4c7908539c49bb4b4986b0 |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol             | d9d927f913d1d062ea9931d132a2f49f5e0cc423 |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol            | 814675660e7b7a8dec20898bef80ef03e69bd4b2 |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol | f2961c701500b017eb65f22ae6a5bc46486b959a |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/utils/Address.sol                           | 7a15fa9cfb040619d637893c4149db17bccc0b8b |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/utils/Strings.sol                           | 64a06a9e23bae30c0bbeb4b6acb408ae54f6c379 |
| /Users/kaso/Desktop/0xTomb-contract/node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol              | b3cc6713a4ecd5a40a432dd8a7382c609564ee1a |


 Contracts Description Table


|      Contract       |            Type            |                   Bases                   |                |                    |
| :-----------------: | :------------------------: | :---------------------------------------: | :------------: | :----------------: |
|          └          |     **Function Name**      |              **Visibility**               | **Mutability** |   **Modifiers**    |
|                     |                            |                                           |                |                    |
|     **oxTomb**      |       Implementation       |              ERC721, Ownable              |                |                    |
|          └          |       <Constructor>        |                 Public ❗️                  |       🛑        |       ERC721       |
|          └          |            mint            |                External ❗️                 |       💵        |        NO❗️         |
|          └          |        subscription        |                External ❗️                 |       💵        | onlyOwnerOrCreator |
|          └          |         lettering          |                External ❗️                 |       🛑        | onlyOwnerOrCreator |
|          └          |        contractURI         |                 Public ❗️                  |                |        NO❗️         |
|          └          |          tokenURI          |                 Public ❗️                  |                |        NO❗️         |
|          └          |          _baseURI          |                Internal 🔒                 |                |                    |
|          └          | extendExpiresTimeByTokenId |                 Private 🔐                 |       🛑        |                    |
|          └          |   queryExpiresByTokenId    |                External ❗️                 |                |        NO❗️         |
|          └          |     isExpiresByTokenId     |                External ❗️                 |                |        NO❗️         |
|          └          |          toString          |                Internal 🔒                 |                |                    |
|          └          |         <Fallback>         |                External ❗️                 |       💵        |        NO❗️         |
|          └          |      <Receive Ether>       |                External ❗️                 |       💵        |        NO❗️         |
|          └          |       setContractURI       |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |         setBaseURI         |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |      setProxyContract      |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |    setSubscriptionCycle    |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |        setSellPrice        |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |    setSubscriptionPrice    |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |       serDefaultURI        |                External ❗️                 |       🛑        |     onlyOwner      |
|          └          |    _afterTokenTransfer     |                Internal 🔒                 |       🛑        |                    |
|     **Ownable**     |       Implementation       |                  Context                  |                |                    |
|          └          |       <Constructor>        |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |           owner            |                 Public ❗️                  |                |        NO❗️         |
|          └          |        _checkOwner         |                Internal 🔒                 |                |                    |
|          └          |     renounceOwnership      |                 Public ❗️                  |       🛑        |     onlyOwner      |
|          └          |     transferOwnership      |                 Public ❗️                  |       🛑        |     onlyOwner      |
|          └          |     _transferOwnership     |                Internal 🔒                 |       🛑        |                    |
|                     |                            |                                           |                |                    |
|     **Context**     |       Implementation       |                                           |                |                    |
|          └          |         _msgSender         |                Internal 🔒                 |                |                    |
|          └          |          _msgData          |                Internal 🔒                 |                |                    |
|                     |                            |                                           |                |                    |
|     **ERC721**      |       Implementation       | Context, ERC165, IERC721, IERC721Metadata |                |                    |
|          └          |       <Constructor>        |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |     supportsInterface      |                 Public ❗️                  |                |        NO❗️         |
|          └          |         balanceOf          |                 Public ❗️                  |                |        NO❗️         |
|          └          |          ownerOf           |                 Public ❗️                  |                |        NO❗️         |
|          └          |            name            |                 Public ❗️                  |                |        NO❗️         |
|          └          |           symbol           |                 Public ❗️                  |                |        NO❗️         |
|          └          |          tokenURI          |                 Public ❗️                  |                |        NO❗️         |
|          └          |          _baseURI          |                Internal 🔒                 |                |                    |
|          └          |          approve           |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |        getApproved         |                 Public ❗️                  |                |        NO❗️         |
|          └          |     setApprovalForAll      |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |      isApprovedForAll      |                 Public ❗️                  |                |        NO❗️         |
|          └          |        transferFrom        |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |      safeTransferFrom      |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |      safeTransferFrom      |                 Public ❗️                  |       🛑        |        NO❗️         |
|          └          |       _safeTransfer        |                Internal 🔒                 |       🛑        |                    |
|          └          |          _exists           |                Internal 🔒                 |                |                    |
|          └          |     _isApprovedOrOwner     |                Internal 🔒                 |                |                    |
|          └          |         _safeMint          |                Internal 🔒                 |       🛑        |                    |
|          └          |         _safeMint          |                Internal 🔒                 |       🛑        |                    |
|          └          |           _mint            |                Internal 🔒                 |       🛑        |                    |
|          └          |           _burn            |                Internal 🔒                 |       🛑        |                    |
|          └          |         _transfer          |                Internal 🔒                 |       🛑        |                    |
|          └          |          _approve          |                Internal 🔒                 |       🛑        |                    |
|          └          |     _setApprovalForAll     |                Internal 🔒                 |       🛑        |                    |
|          └          |       _requireMinted       |                Internal 🔒                 |                |                    |
|          └          |   _checkOnERC721Received   |                 Private 🔐                 |       🛑        |                    |
|          └          |    _beforeTokenTransfer    |                Internal 🔒                 |       🛑        |                    |
|          └          |    _afterTokenTransfer     |                Internal 🔒                 |       🛑        |                    |
|                     |                            |                                           |                |                    |
|     **IERC721**     |         Interface          |                  IERC165                  |                |                    |
|          └          |         balanceOf          |                External ❗️                 |                |        NO❗️         |
|          └          |          ownerOf           |                External ❗️                 |                |        NO❗️         |
|          └          |      safeTransferFrom      |                External ❗️                 |       🛑        |        NO❗️         |
|          └          |      safeTransferFrom      |                External ❗️                 |       🛑        |        NO❗️         |
|          └          |        transferFrom        |                External ❗️                 |       🛑        |        NO❗️         |
|          └          |          approve           |                External ❗️                 |       🛑        |        NO❗️         |
|          └          |     setApprovalForAll      |                External ❗️                 |       🛑        |        NO❗️         |
|          └          |        getApproved         |                External ❗️                 |                |        NO❗️         |
|          └          |      isApprovedForAll      |                External ❗️                 |                |        NO❗️         |
|                     |                            |                                           |                |                    |
|     **IERC165**     |         Interface          |                                           |                |                    |
|          └          |     supportsInterface      |                External ❗️                 |                |        NO❗️         |
|                     |                            |                                           |                |                    |
| **IERC721Receiver** |         Interface          |                                           |                |                    |
|          └          |      onERC721Received      |                External ❗️                 |       🛑        |        NO❗️         |
|                     |                            |                                           |                |                    |
| **IERC721Metadata** |         Interface          |                  IERC721                  |                |                    |
|          └          |            name            |                External ❗️                 |                |        NO❗️         |
|          └          |           symbol           |                External ❗️                 |                |        NO❗️         |
|          └          |          tokenURI          |                External ❗️                 |                |        NO❗️         |
|                     |                            |                                           |                |                    |
|     **Address**     |          Library           |                                           |                |                    |
|          └          |         isContract         |                Internal 🔒                 |                |                    |
|          └          |         sendValue          |                Internal 🔒                 |       🛑        |                    |
|          └          |        functionCall        |                Internal 🔒                 |       🛑        |                    |
|          └          |        functionCall        |                Internal 🔒                 |       🛑        |                    |
|          └          |   functionCallWithValue    |                Internal 🔒                 |       🛑        |                    |
|          └          |   functionCallWithValue    |                Internal 🔒                 |       🛑        |                    |
|          └          |     functionStaticCall     |                Internal 🔒                 |                |                    |
|          └          |     functionStaticCall     |                Internal 🔒                 |                |                    |
|          └          |    functionDelegateCall    |                Internal 🔒                 |       🛑        |                    |
|          └          |    functionDelegateCall    |                Internal 🔒                 |       🛑        |                    |
|          └          |      verifyCallResult      |                Internal 🔒                 |                |                    |
|                     |                            |                                           |                |                    |
|     **Strings**     |          Library           |                                           |                |                    |
|          └          |          toString          |                Internal 🔒                 |                |                    |
|          └          |        toHexString         |                Internal 🔒                 |                |                    |
|          └          |        toHexString         |                Internal 🔒                 |                |                    |
|          └          |        toHexString         |                Internal 🔒                 |                |                    |
|                     |                            |                                           |                |                    |
|     **ERC165**      |       Implementation       |                  IERC165                  |                |                    |
|          └          |     supportsInterface      |                 Public ❗️                  |                |        NO❗️         |


 Legend

| Symbol | Meaning                   |
| :----: | ------------------------- |
|   🛑    | Function can modify state |
|   💵    | Function is payable       |
