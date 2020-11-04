pragma solidity >=0.6.0 <0.8.0;


contract Numero {
    uint16 numeroSorteado; // 0 a 65535
    uint numeroSorteadoGrande; // 0 a 2^256

    uint16 contadorSorteios;

    address dono;


    constructor (uint16 _numeroInicial) public {
        numeroSorteado = _numeroInicial;
        contadorSorteios++;
        dono = msg.sender;
    }


    function set(uint _enviado) public payable {

        numeroSorteado = _enviado;
        numeroSorteado = uint16(_enviado);

        require(msg.sender == dono, "Apenas o dono do contrato pode setar");

        require(contadorSorteios + 1 > contadorSorteios, "overflow no contador");

        require(numeroSorteado == numeroSorteadoGrande, "overflor no numero");

        contadorSorteios++;

    }

    function get() public view returns (int16 _numero, uint _numeroSortedoGrende, uint16 _contador, address _dono, address _contrato, uint saldo) {
        return (numeroSorteado,
                numeroSorteadoGrande,
                contadorSorteios,
                dono,
                this,
                address(this).balance);
    }

}