
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

- É possível consultar o saldo de um endereço usando a propriedade ```balance```  e enviar Éther (em unidades de wei) para um endereço de pagamento usando a ```transfer```.


### Literais e tipos de string

- Literais de string são escritos com aspas duplas ou simples ( ```"foo"``` ou ```'bar'```) e também podem ser divididos em várias partes consecutivas ( é equivalente a ), o que pode ser útil ao lidar com strings longas.

#### Literais Unicode

- Enquanto os literais de string regulares só podem conter ASCII, os literais Unicode - prefixados com a palavra ```unicode```- chave - podem conter qualquer sequência UTF-8 válida. Eles também suportam as mesmas sequências de escape que os literais de string regulares.

```string memory a = unicode"Hello 😃";```

#### Literais hexadecimais

- Literais hexadecimais são prefixados com a palavra-chave hexe colocados entre aspas duplas ou simples  ( ```hex"001122FF"```, ```hex'0011_22_FF'``` ). Seu conteúdo deve ser de dígitos hexadecimais que podem, opcionalmente, usar um único sublinhado como separador entre os limites de byte. O valor do literal será a representação bin ária da sequência hexadecimal.


### Tipos de Função

- Os tipos de função são os tipos de funções. Variáveis ​​de tipo de função podem ser atribuídas a partir de funções e parâmetros de função de tipo de função podem ser usados ​​para passar funções e retornar funções de chamadas de função. São dois os tipos de função - **funções internas** e **externas** :

- As **funções internas** só podem ser chamadas dentro do contrato atual (mais especificamente, dentro da unidade de código atual, que também inclui funções de biblioteca interna e funções herdadas) porque não podem ser executadas fora do contexto do contrato atual.

- As **funções externas** consistem em um endereço e uma assinatura de função e podem ser transmitidas e retornadas por chamadas de funções externas.

- Os tipos de função são notados da seguinte forma:

```function``` (```<parameter types>```) {```internal``` | ```external```} [```pure``` | ```view``` ```payable```] [```returns``` ```(<return types>)```]

##### Conversões:

- ```pure``` : funções podem ser convertidas em funções ```view``` e ```non-payable```
- ```view``` : funções podem ser convertidas em ```non-payable``` funções
- ```payable``` : funções podem ser convertidas em ```non-payable```  funções

### Tipos de Referência

- Os valores do tipo de referência podem ser modificados por meio de vários nomes diferentes. Compare isso com os tipos de valor onde você obtém uma cópia independente sempre que uma variável do tipo de valor é usada. Por causa disso, os tipos de referência devem ser tratados com mais cuidado do que os tipos de valor. Atualmente, os tipos de referência incluem estruturas, matrizes e mapeamentos. Se você usar um tipo de referência, você sempre terá que fornecer explicitamente a área de dados onde o tipo está armazenado:

- ```memory``` : cujo tempo de vida é limitado a uma chamada de função externa

- ```storage``` :o local onde as variáveis ​​de estado são armazenadas, onde o tempo de vida é limitado a o tempo de vida de um contrato.

- ```calldata``` : localização de dados especiais que contém os argumentos da função.