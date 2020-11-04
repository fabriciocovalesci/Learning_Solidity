pragma solidity >=0.6.0 <0.8.0;


contract Numero {
    int256 numero;
    bool numeroPar;
    bool numeroImpar;

    constructor (uint256 _numero) public payable {
        set(_numero);
    }

    function set(uint256 _numero) public  {
      //  require(_numero == int8(_numero), "Valor nao cabe na variavel global");
         numero = int8(_numero);

         numeroPar = numero % 2 == 0;

         numeroImpar = !numeroPar;
    }

    function get() public view returns (int256 _numero, bool _Par, bool _Impar) {
        return (numero, numeroPar, numeroImpar);
    }

}