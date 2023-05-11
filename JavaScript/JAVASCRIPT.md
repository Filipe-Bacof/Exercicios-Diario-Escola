# OBSERVAÇÕES

- Utilizar `VAR` não é uma boa prática, é preferível utilizar `LET` ou `CONST`, pois elas tem bloqueio de escopo, e também devido ao hoisting.
Nas versões mais modernas do JavaScript variáveis declaradas com `LET` ou `CONST` só podem ser acessadas dentro do bloco em que foi declarada. Isso ajuda a prevenir erros e confusões ao lidar com variáveis.
Quanto ao Hoisting, declarando as variáveis com `VAR`, faz com que elas sejam movidas para o topo do seu escopo. Isso pode levar a casos em que uma variável seja utilizada antes de ser declarada, o que pode resultar em erros difíceis de depurar.

- O Exercício 1 está com um problema, no PDF diz para percorrer um objeto de objetos.
    - um objeto precisa ter propriedade e valor, o que não é o caso:
    ```
        var clientes_exemplo = {
            {
                "id": 1,
                "nome": "Filipe Bacof",
                "idade": 25
            }
        };
    ```
    - poderia caso cada objeto interno fosse uma propriedade:
    ```
        var clientes_exemplo = {
            "cliente 1": {
                "id": 1,
                "nome": "Filipe Bacof",
                "idade": 25
            }
        };
    ```
    
    - portanto transformei isso em um array de objetos, o que não modificou a estrutura do código:
    ```
        var clientes_exemplo = [
            {
                "id": 1,
                "nome": "Filipe Bacof",
                "idade": 25
            }
        ];
    ```
