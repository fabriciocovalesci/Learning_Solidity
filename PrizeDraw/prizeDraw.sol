pragma solidity >=0.6.0 <0.8.0;


contract Loteria {
    
    address dono;
    string nomeDono;
    uint256 inicio;
    
    
    struct Sorteio {
        uint data;
        uint numeroSorteado;
        address remetente;
        uint countPalpites;
    }
    
    Sorteio[] sorteios;
    
    mapping (address => uint) palpites;
    address[] palpiteiros;
    address[] ganhadores;
    
    constructor() public{
        dono = msg.sender;
        inicio = block.timestamp;
    }
    
    modifier apenasDono(){
        require(msg.sender == dono, "Apenas o dono pode fazer isso");
        _;
    }
    
    
    modifier exetoDono(){
        require(msg.sender != dono, "O dono do contrato nao pode fazer isso");
        _;
    }
    
    
    event TrocoEnviado(address pagante, uint troco);
    event PalpiteRegistrado(address remetente, uint palpite);
    
    
    function enviarPalpite(uint palpiteEnviado) payable public { //  exetoDono()
        require(palpiteEnviado >= 1 && palpiteEnviado <= 4, "Voce tem que escolher entre 1 e 4");
        
        require(palpites[msg.sender] == 0, "Apenas um palpite pode ser enviado por sorteio");
        
        require(msg.value >= 1 ether, "A taxa para palpitar e 1 ether");
        
        
        // calcula troco
        uint troco = msg.value - 1 ether;
        if(troco > 0){
            msg.sender.transfer(troco);
            emit TrocoEnviado(msg.sender, troco);
        }
        
        // registra palpite
        palpites[msg.sender] = palpiteEnviado;
        palpiteiros.push(msg.sender);
        emit PalpiteRegistrado(msg.sender, palpiteEnviado);
        
    }
    
    
    function verificaPalpite() view public returns(uint palpite){
        require(palpites[msg.sender] > 0, "Voce ainda nao tem palpites neste sorteio");
        
        return palpites[msg.sender];
    }
    
    function contarPalpiter() view public returns(uint count){
        return palpiteiros.length;
    }
    
    
    event SorteioPostado(uint resultado);
    event PremioEnviado(uint premioTotal, uint PremioIndividual);
    
    
    function sortear()  public apenasDono() returns(uint8 _numeroSorteado){
        require(block.timestamp > inicio + 1 minutes, "Sorteio so pode ser realizado apos 1 minuto");
        
        require(palpiteiros.length >= 1, "Um minimo de 1 pessoa e exigida para sortear");
        
        // sortear numero
        uint numeroSorteado = uint(keccak256(abi.encodePacked(blockhash(block.number-1))))/ 64 + 1;
        
        //sorteios.push(Sorteio({}))
    }
    
    
        
    
}