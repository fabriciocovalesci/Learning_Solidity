pragma solidity >=0.6.0 <0.8.0;


contract CompraVenda {

    uint preco;

    address public cliente;
     address public vendedor;

    mapping (address => uint) public balances;

    event SaldoDevolvido (address pagador, uint pgto);

    event Transfer(address from, address to, uint amount);

    constructor() public {
      
        cliente = msg.sender;
    }

     function setEnvio(address receptor, uint valor) public {
        
        require(msg.sender == cliente, "Você não é o dono.");

        require(valor < 1e60, "Emissão máxima bem sucedida "");

        balances[receptor] += amount;
    }

    function transfer(address receptor, uint valor) public {
        require(valor <= balances[msg.sender], "Saldo insuficiente");

        balances[msg.sender] -= valor;
        balances[receptor] += valor;

        emit Transfer(msg.sender, receptor, valor);
    }

    function set(uint envia) public payable  {
        cliente = msg.sender(envia);

        if(msg.value > preco){
            uint pgto = msg.value - 1000;
            msg.sender.transfer(pgto);
            emit SaldoDevolvido(msg.sender, pgto);
        }
    }

    modifier comCustoMinimo(uint min){
        require(msg.value >= min, "Nao foi enviado Ether suficiente");
        _; //-> continua rodando o resto da funcao
    }

    function get() view public returns (uint) {
        return preco;
    }

}

