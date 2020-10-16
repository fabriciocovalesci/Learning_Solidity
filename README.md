
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