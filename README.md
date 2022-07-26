 Sūrya's Description Report

 Files Description Table


| File Name                                                | SHA-1 Hash                               |
| -------------------------------------------------------- | ---------------------------------------- |
| /Users/kaso/Desktop/0xTomb-contract/contracts/OxTomb.sol | 730c590e8b9a30d5761a015af0b2a13c5c1db8ce |


 Contracts Description Table


|  Contract  |            Type            |      Bases      |                |               |
| :--------: | :------------------------: | :-------------: | :------------: | :-----------: |
|     └      |     **Function Name**      | **Visibility**  | **Mutability** | **Modifiers** |
|            |                            |                 |                |               |
| **oxTomb** |       Implementation       | ERC721, Ownable |                |               |
|     └      |       <Constructor>        |    Public ❗️     |       🛑        |    ERC721     |
|     └      |            mint            |    Public ❗️     |       💵        |      NO❗️      |
|     └      |        contractURI         |    Public ❗️     |                |      NO❗️      |
|     └      |          tokenURI          |    Public ❗️     |                |      NO❗️      |
|     └      |          _baseURI          |   Internal 🔒    |                |               |
|     └      | extendExpiresTimeByTokenId |    Private 🔐    |       🛑        |               |
|     └      |   queryExpiresByTokenId    |    Public ❗️     |                |      NO❗️      |
|     └      |     isExpiresByTokenId     |    Public ❗️     |                |      NO❗️      |
|     └      |          toString          |   Internal 🔒    |                |               |
|     └      |         <Fallback>         |   External ❗️    |       💵        |      NO❗️      |
|     └      |      <Receive Ether>       |   External ❗️    |       💵        |      NO❗️      |
|     └      |       setContractURI       |    Public ❗️     |       🛑        |   onlyOwner   |
|     └      |         setBaseURI         |    Public ❗️     |       🛑        |   onlyOwner   |
|     └      |      setProxyContract      |    Public ❗️     |       🛑        |   onlyOwner   |
|     └      |    setSubscriptionCycle    |    Public ❗️     |       🛑        |   onlyOwner   |
|     └      |        setSellPrice        |    Public ❗️     |       🛑        |   onlyOwner   |
|     └      |    _afterTokenTransfer     |   Internal 🔒    |       🛑        |               |


 Legend

| Symbol | Meaning                   |
| :----: | ------------------------- |
|   🛑    | Function can modify state |
|   💵    | Function is payable       |
