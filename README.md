 Sūrya's Description Report

 Files Description Table


## Core

|    Contract    |        Type         |                    Bases                    |                |               |
| :------------: | :-----------------: | :-----------------------------------------: | :------------: | :-----------: |
|       └        |  **Function Name**  |               **Visibility**                | **Mutability** | **Modifiers** |
|                |                     |                                             |                |               |
|    **Tomb**    |   Implementation    | Contract, Metadata, Sub, Letter, Weathering |                |               |
|       └        |     initialize      |                  Public ❗️                   |       🛑        |      NO❗️      |
|       └        |        mint         |                 External ❗️                  |       💵        |      NO❗️      |
|       └        |    setSellPrice     |                 External ❗️                  |       🛑        |   onlyOwner   |
|       └        | _afterTokenTransfer |                 Internal 🔒                  |       🛑        |               |
|                |                     |                                             |                |               |
|  **Contract**  |   Implementation    |                    Auth                     |                |               |
|       └        |     contractURI     |                  Public ❗️                   |                |      NO❗️      |
|       └        | changedContractURI  |                  Public ❗️                   |       🛑        |   onlyOwner   |
|                |                     |                                             |                |               |
|    **Auth**    |   Implementation    |                                             |                |               |
|       └        |        owner        |                  Public ❗️                   |                |      NO❗️      |
|       └        |     _checkOwner     |                 Internal 🔒                  |                |               |
|       └        |  renounceOwnership  |                  Public ❗️                   |       🛑        |   onlyOwner   |
|       └        |  transferOwnership  |                  Public ❗️                   |       🛑        |   onlyOwner   |
|       └        | _transferOwnership  |                 Internal 🔒                  |       🛑        |               |
|                |                     |                                             |                |               |
|  **Metadata**  |   Implementation    |                Auth, ERC721                 |                |               |
|       └        |    _setTokenHash    |                 Internal 🔒                  |       🛑        |               |
|       └        |     setTokenURI     |                  Public ❗️                   |       🛑        |   onlyOwner   |
|       └        |      tokenURI       |                  Public ❗️                   |                |      NO❗️      |
|       └        |      toString       |                 Internal 🔒                  |                |               |
|                |                     |                                             |                |               |
|    **Sub**     |   Implementation    |                    Auth                     |                |               |
|       └        |     setSubCycle     |                  Public ❗️                   |       🛑        |   onlyOwner   |
|       └        |     setSubPrice     |                  Public ❗️                   |       🛑        |   onlyOwner   |
|       └        |    _tokenSubInit    |                 Internal 🔒                  |       🛑        |               |
|       └        |   tokenSubExtend    |                 External ❗️                  |       💵        |      NO❗️      |
|       └        |   _toeknRevokeSub   |                 Internal 🔒                  |       🛑        |               |
|       └        |        isExp        |                  Public ❗️                   |                |      NO❗️      |
|                |                     |                                             |                |               |
|   **Letter**   |   Implementation    |                                             |                |               |
|       └        |    _setHasLetter    |                 Internal 🔒                  |       🛑        |               |
|       └        |     tokenLetter     |                 External ❗️                  |       🛑        |      NO❗️      |
|                |                     |                                             |                |               |
| **Weathering** |   Implementation    |                                             |                |               |
|       └        | _addWeatheringTimes |                 Internal 🔒                  |       🛑        |               |

## Library

|      Contract       |          Type          |                   Bases                   |                |               |
| :-----------------: | :--------------------: | :---------------------------------------: | :------------: | :-----------: |
|          └          |   **Function Name**    |              **Visibility**               | **Mutability** | **Modifiers** |
|     **ERC721**      |     Implementation     | Context, ERC165, IERC721, IERC721Metadata |                |               |
|          └          |       ERC721Init       |                Internal 🔒                 |       🛑        |               |
|          └          |   supportsInterface    |                 Public ❗️                  |                |      NO❗️      |
|          └          |       balanceOf        |                 Public ❗️                  |                |      NO❗️      |
|          └          |        ownerOf         |                 Public ❗️                  |                |      NO❗️      |
|          └          |          name          |                 Public ❗️                  |                |      NO❗️      |
|          └          |         symbol         |                 Public ❗️                  |                |      NO❗️      |
|          └          |        tokenURI        |                 Public ❗️                  |                |      NO❗️      |
|          └          |        _baseURI        |                Internal 🔒                 |                |               |
|          └          |        approve         |                 Public ❗️                  |       🛑        |      NO❗️      |
|          └          |      getApproved       |                 Public ❗️                  |                |      NO❗️      |
|          └          |   setApprovalForAll    |                 Public ❗️                  |       🛑        |      NO❗️      |
|          └          |    isApprovedForAll    |                 Public ❗️                  |                |      NO❗️      |
|          └          |      transferFrom      |                 Public ❗️                  |       🛑        |      NO❗️      |
|          └          |    safeTransferFrom    |                 Public ❗️                  |       🛑        |      NO❗️      |
|          └          |    safeTransferFrom    |                 Public ❗️                  |       🛑        |      NO❗️      |
|          └          |     _safeTransfer      |                Internal 🔒                 |       🛑        |               |
|          └          |        _exists         |                Internal 🔒                 |                |               |
|          └          |   _isApprovedOrOwner   |                Internal 🔒                 |                |               |
|          └          |       _safeMint        |                Internal 🔒                 |       🛑        |               |
|          └          |       _safeMint        |                Internal 🔒                 |       🛑        |               |
|          └          |         _mint          |                Internal 🔒                 |       🛑        |               |
|          └          |         _burn          |                Internal 🔒                 |       🛑        |               |
|          └          |       _transfer        |                Internal 🔒                 |       🛑        |               |
|          └          |        _approve        |                Internal 🔒                 |       🛑        |               |
|          └          |   _setApprovalForAll   |                Internal 🔒                 |       🛑        |               |
|          └          |     _requireMinted     |                Internal 🔒                 |                |               |
|          └          | _checkOnERC721Received |                 Private 🔐                 |       🛑        |               |
|          └          |  _beforeTokenTransfer  |                Internal 🔒                 |       🛑        |               |
|          └          |  _afterTokenTransfer   |                Internal 🔒                 |       🛑        |               |
|                     |                        |                                           |                |               |
|     **IERC721**     |       Interface        |                  IERC165                  |                |               |
|          └          |       balanceOf        |                External ❗️                 |                |      NO❗️      |
|          └          |        ownerOf         |                External ❗️                 |                |      NO❗️      |
|          └          |    safeTransferFrom    |                External ❗️                 |       🛑        |      NO❗️      |
|          └          |    safeTransferFrom    |                External ❗️                 |       🛑        |      NO❗️      |
|          └          |      transferFrom      |                External ❗️                 |       🛑        |      NO❗️      |
|          └          |        approve         |                External ❗️                 |       🛑        |      NO❗️      |
|          └          |   setApprovalForAll    |                External ❗️                 |       🛑        |      NO❗️      |
|          └          |      getApproved       |                External ❗️                 |                |      NO❗️      |
|          └          |    isApprovedForAll    |                External ❗️                 |                |      NO❗️      |
|                     |                        |                                           |                |               |
|     **IERC165**     |       Interface        |                                           |                |               |
|          └          |   supportsInterface    |                External ❗️                 |                |      NO❗️      |
|                     |                        |                                           |                |               |
| **IERC721Receiver** |       Interface        |                                           |                |               |
|          └          |    onERC721Received    |                External ❗️                 |       🛑        |      NO❗️      |
|                     |                        |                                           |                |               |
| **IERC721Metadata** |       Interface        |                  IERC721                  |                |               |
|          └          |          name          |                External ❗️                 |                |      NO❗️      |
|          └          |         symbol         |                External ❗️                 |                |      NO❗️      |
|          └          |        tokenURI        |                External ❗️                 |                |      NO❗️      |
|                     |                        |                                           |                |               |
|     **Address**     |        Library         |                                           |                |               |
|          └          |       isContract       |                Internal 🔒                 |                |               |
|          └          |       sendValue        |                Internal 🔒                 |       🛑        |               |
|          └          |      functionCall      |                Internal 🔒                 |       🛑        |               |
|          └          |      functionCall      |                Internal 🔒                 |       🛑        |               |
|          └          | functionCallWithValue  |                Internal 🔒                 |       🛑        |               |
|          └          | functionCallWithValue  |                Internal 🔒                 |       🛑        |               |
|          └          |   functionStaticCall   |                Internal 🔒                 |                |               |
|          └          |   functionStaticCall   |                Internal 🔒                 |                |               |
|          └          |    verifyCallResult    |                Internal 🔒                 |                |               |
|                     |                        |                                           |                |               |
|     **Context**     |     Implementation     |                                           |                |               |
|          └          |       _msgSender       |                Internal 🔒                 |                |               |
|          └          |        _msgData        |                Internal 🔒                 |                |               |
|                     |                        |                                           |                |               |
|     **Strings**     |        Library         |                                           |                |               |
|          └          |        toString        |                Internal 🔒                 |                |               |
|          └          |      toHexString       |                Internal 🔒                 |                |               |
|          └          |      toHexString       |                Internal 🔒                 |                |               |
|          └          |      toHexString       |                Internal 🔒                 |                |               |
|                     |                        |                                           |                |               |
|     **ERC165**      |     Implementation     |                  IERC165                  |                |               |
|          └          |   supportsInterface    |                 Public ❗️                  |                |      NO❗️      |
|                     |                        |                                           |                |               |

 Legend

| Symbol | Meaning                   |
| :----: | ------------------------- |
|   🛑    | Function can modify state |
|   💵    | Function is payable       |
