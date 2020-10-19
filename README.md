
<h1 text-align: center>Linguagem Solidity</h1>

## O que é a linguagem Solidity ?

<p text-align: justify>
Solidity é uma linguagem de programação de chaves estaticamente tipadas projetada para desenvolver contratos inteligentes que rodam na Máquina Virtual Ethereum. Contratos inteligentes são programas executados dentro de uma rede ponto a ponto onde ninguém tem autoridade especial sobre a execução e, portanto, permitem implementar tokens de valor, propriedade, votação e outros tipos de lógica.

Ao implantar contratos, você deve usar a última versão lançada do Solidity. Isso ocorre porque as principais alterações.
</p>


### Exemplo de um "Hello World"

```
pragma solidity >=0.6.0 <0.8.0;

contract HelloWorld {
  function helloWorld() external pure returns (string memory) {
    return "Hello, World!";
  }
}

```

### Tipos

- Booleanos
```bool```: Os valores possíveis são constantes ```true``` ou ```false```.

Operadores:

- ```!```  (negação lógica)
- ```&&```  (conjunção lógica, “e”)
- ```||``` (disjunção lógica, “ou”)
- ```==```  (igualdade)
- ```!=``` (desigualdade)


### Inteiros

```int``` / ```uint``` Inteiros assinados e não assinados de vários tamanhos.

```uint8``` | ```uint256``` em etapas de ```8``` (sem sinal de 8 até 256 bits) e ```int8``` para ```int256```. ```uint``` e ```int``` são aliases para ```uint256``` e ```int256```, respectivamente.


### Endereços

- O tipo de endereço são basicamente idênticos:

- ```address```: Contém um valor de 20 bytes (tamanho de um endereço Ethereum)

- ```address payable```: O mesmo que ```address```, mas com os membros adicionais ```transfer```
  e ```send```. 

A ideia por trás desta distinção é que é um endereço para o qual você pode enviar Ether, enquanto um simples não pode ser enviado Ether. ```address payable``` e ```address```


### Membros de endereços

- ```balance```
- ```transfer```

- É possível consultar o saldo de um endereço usando a propriedade ```balance```  e enviar Éter (em unidades de wei) para um endereço de pagamento usando a ```transfer```.


### Literais e tipos de string

- Literais de string são escritos com aspas duplas ou simples ( ```"foo"``` ou ```'bar'```) e também podem ser divididos em várias partes consecutivas ( é equivalente a ), o que pode ser útil ao lidar com strings longas.

#### Literais Unicode

- Enquanto os literais de string regulares só podem conter ASCII, os literais Unicode - prefixados com a palavra ```unicode```- chave - podem conter qualquer sequência UTF-8 válida. Eles também suportam as mesmas sequências de escape que os literais de string regulares.

```string memory a = unicode"Hello 😃";```

#### Literais hexadecimais

- Literais hexadecimais são prefixados com a palavra-chave hexe colocados entre aspas duplas ou simples ( ```hex"001122FF"```, ```hex'0011_22_FF'``` ). Seu conteúdo deve ser de dígitos hexadecimais que podem, opcionalmente, usar um único sublinhado como separador entre os limites de byte. O valor do literal será a representação bin ária da sequência hexadecimal.




