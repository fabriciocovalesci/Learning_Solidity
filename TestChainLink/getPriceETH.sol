/** Este código de exemplo é projetado para implantar rapidamente um contrato de exemplo usando Remix.
 *  Se você nunca usou Remix, experimente nosso exemplo de explicação passo a passo: https://docs.chain.link/docs/example-walkthrough
 *  Você precisará do testnet ETH e LINK.
 *     - Kovan ETH faucet: https://faucet.kovan.network/
 *     - Kovan LINK faucet: https://kovan.chain.link/
 */

pragma solidity >=0.6.0 <0.8.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
  
    uint256 public ethereumPrice;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    /**
     * Network: Kovan
     * Oracle: Chainlink - 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e
     * Job ID: Chainlink - 29fa9aa13bf1468788b7cc4a500a45b8
     * Fee: 0.1 LINK
     */
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "29fa9aa13bf1468788b7cc4a500a45b8";
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }
    
    /**
     * Crie uma solicitação Chainlink para recuperar a resposta da API, encontre o preço-alvo
     * dados e, em seguida, multiplique por 100 (para remover as casas decimais do preço).
     */
    function requestEthereumPrice() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        // Defina a URL para realizar a solicitação GET em
        request.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
        
        // Defina o caminho para encontrar os dados desejados na resposta da API, onde o formato da resposta é:
        // {"USD":243.33}
        request.add("path", "USD");
        
        // Multiplique o resultado por 100 para remover decimais
        request.addInt("times", 100);
        
        // Envia o request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /**
     * Receba a resposta na forma de uint256
     */ 
    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId)
    {
        ethereumPrice = _price;
    }
}