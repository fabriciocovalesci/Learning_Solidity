pragma solidity >=0.6.0 <0.8.0;


contract Sorteios {
    uint numeroSorteado;
    address dono;
    uint contatorSorteio = 0;
    bool donoRico = false;

    constructor (uint numeroInicial) public {
        require (msg.sender.balance > 99.9999999999 ether)
    
        numeroSorteado = numeroInicial;
        dono = msg.sender;
        contatorSorteio = 1;

        if(msg.sender.balance > 20 ether){
            donoRico = true
        }
        else {
            donoRico = false;
        }
    }

    function set(uint enviar) public {
        numeroSorteado = enviar;
        contatorSorteio++;
    }

    function get() view public returns (uint) {
        return numeroSorteado;
    }

    function getDono() view public returns (address) {
        return dono;
    }

    function getNumeroSorteado() view public returns (uint) {
        return numeroSorteado;
    }

    function getRico() view public returns (bool) {
        return donoRico;
    }    
}