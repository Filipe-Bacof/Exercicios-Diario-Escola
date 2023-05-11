# Bônus:
3. Qual a ordem dos prints no console?
    - A função é: c
    - A função é: d

4. Existe algum erro nesse código? Se sim, comente sobre?
    - Apesar de não haver nenhum erro de sintaxe, observei alguns detalhes:
        - A `função b` retorna imediatamente antes de chamar `alertUser('b')`, portanto essa chamada de função nunca será executada;
        - A `função c` chama `resolve()` imediatamente, antes de chamar `alertUser('c')`. Isso significa que ela sempre resolve imediatamente, independentemente do que acontece em outras partes abaixo do código;
        - A `função d` nunca chama `resolve()`, o que significa que a Promise nunca é resolvida ou rejeitada. Tanto que no console ainda é retornada essa promise (conforme o print `bonus.png`);