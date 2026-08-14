const entrada = require('readline-sync')

const produto = {
    nome: "Teclado Mecanico",
    preco: 150.00,
    estoque: 25,
    emOferta: true
}



function criarproduto(nomeV, precoV, estoqueV, emOfertaV) {
    return  nomeV = {
        nome: nomeV,
        preco: precoV,
        estoque: estoqueV,
        emOferta: emOfertaV
    }


}

const criar = entrada.keyInYNStrict("\nVoce deseja criar um Produto?: ")
if (criar === true ) {
    
    const nome = entrada.question("\nDigite o nome do produto: ")
    const preco = entrada.questionFloat("\nDigite o preco do produto: ")
    const estoque = entrada.questionFloat("\nDigite quanto de estoque o produto possui: ")
    const oferta = entrada.keyInYNStrict("\nO produto esta em promocao?: ")

    const ProdutoCriado = criarproduto(nome, preco, estoque, oferta)
    
    console.log(ProdutoCriado)




} else {
    console.log("Digite ENTER para sair do programa")
    const sair = entrada.question()
}

