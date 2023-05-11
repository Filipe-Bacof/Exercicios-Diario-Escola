<?php
    $nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
    $cliente1 = new stdClass();
    $cliente1->nome = $nomes[0];
    $cliente2 = new stdClass();
    $cliente2->nome = $nomes[1];
    $cliente3 = new stdClass();
    $cliente3->nome = $nomes[2];
    $arrayDeClientes = [$cliente1, $cliente2, $cliente3];
    
    $arrayDeNascimento = [
        'Francisco Souza' => '10-12-1996',
        'Arthur Golveia' => '14-01-2000',
        'Guilherme Rosa' => '26-05-1985',
        'Marcelo Planalto' => '26-05-1985'
    ];

    $arrayDeClientes = [];

    foreach ($arrayDeNascimento as $nome => $dataDeNascimento) {
        $cliente = new stdClass();
        $cliente->nome = $nome;
        $cliente->dataDeNascimento = $dataDeNascimento;
        $arrayDeClientes[] = $cliente;
    }

    foreach ($arrayDeClientes as $cliente) {
        echo "Nome: " . $cliente->nome . ", Data de nascimento: " . $cliente->dataDeNascimento . "<br>";
    }
    
?>

<!-- O RETORNO VAI SER:

Nome: Francisco Souza, Data de nascimento: 10-12-1996
Nome: Arthur Golveia, Data de nascimento: 14-01-2000
Nome: Guilherme Rosa, Data de nascimento: 26-05-1985
Nome: Marcelo Planalto, Data de nascimento: 26-05-1985
-->