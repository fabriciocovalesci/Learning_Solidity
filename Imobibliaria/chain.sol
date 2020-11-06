pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
    
    uint256 public ethereumPrice;
    // variaiveis global oraculo
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    // aadicionando as chaves publicas oraculo
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "29fa9aa13bf1468788b7cc4a500a45b8";
        fee = 0.1 * 100 ** 10; // 0.1 LINK
    }
    

    function requestEthereumPrice() public returns (bytes32 requestId) 
    {   //cria um request
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        request.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
        request.add("path", "USD");
        request.addInt("times", 100);
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId)
    {
        ethereumPrice = _price;
    }
}