pragma solidity >=0.6.0 <0.8.0;


contract Sorteia_com_Troco {
    uint numeroSorteado;
    address dono;
    uint contador = 0;
    bool donoRico = false;



    constructor (uint enviado) public {
        require (msg.sender.balance > 99.9999999999 ether)
        
            numeroSorteado = enviado;
            dono = msg.sender;
            contador = 1;

            if(msg.sender.balance > 20 ether){
                donoRico = true;
            }
            else {
                donoRico = false;
            }
    }

    event TrocoEnviado (address pagador, uint troco);

    function set(uint envia) public payable comCustoMinimo(1000) {
        numeroSorteado = envia;
        contador++;

        if(msg.value > 1000){
            uint troco = msg.value - 1000;
            msg.sender.transfer(troco);
            emit TrocoEnviado(msg.sender, troco);
        }
    }

    modifier comCustoMinimo(uint min){
        require(msg.value >= min, "Nao foi enviado Ether suficiente");
        _; //-> continua rodando o resto da funcao
    }

    function get() view public returns (uint) {
        return numeroSorteado;
    }



}