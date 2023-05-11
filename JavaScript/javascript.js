var clientes = [
    {
        "id": 1,
        "nome": "Luis Santos Silveira",
        "idade": 18
    },
    {
        "id": 2,
        "nome": "Ricardo Lopes Alves",
        "idade": 30
    },
    {
        "id": 3,
        "nome": "Gustavo Silva Junior",
        "idade": 26
    }
];

var numero = "5(1)9-876-543-21";

// QUESTÃO 1
for (let i = 0; i < clientes.length; i++) {
    let nome = clientes[i].nome;
    let partes = nome.split(" ");
    let ultimoNome = partes[partes.length - 1];
    let primeiroNome = partes[0];
    console.log(`${ultimoNome} ${primeiroNome}`);
}

// QUESTÃO 2
function transformarNumero (num) {
    let regexExtrairNumeros = /\d+/g;
    let numerosExtraidos = num.match(regexExtrairNumeros).join("");

    if (`${numerosExtraidos}`.length !== 11) {
        console.log("O numero de telefone está inválido!");
        console.log("Insira um telefone com 11 algarismos.");
        return;
    };

    let regexTranformar = /^(\d{2})(\d)(\d{4})(\d{4})$/;
    let resultado = numerosExtraidos.replace(regexTranformar, "($1)_$2_$3-$4");
    console.log(resultado);
}
transformarNumero(numero);