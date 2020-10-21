pragma solidity >=0.6.0 <0.8.0;

contract GuardaLoteria {
    uint256 public number; // inteiro sem sinal
    
    function set(uint enviado) public { // variavel local na assinatura no metodo set, são voláteis
        number = enviado;
    }
    
    function get() public view returns (uint) { // returna um numero inteiro sem sinal para quem chamar
        return number; 
    }
    
}
