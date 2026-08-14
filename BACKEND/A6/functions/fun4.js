const entrada = require('readline-sync')

function CalcularDesconto(valorOriginal) {
    return valorOriginal * 0.85
}

const produtos = ["Monitor", "Teclado", "Mouse"]
const preco = [800, 150, 80]

console.log("=== TABELA DE PREÇOS COM DESCONTO (15%) ===")

for (let i = 0; i < produtos.length; i++ ) {
    console.log(`\n O produto ${produtos[i]}, custava o valor de ${preco[i]}, e agora custa ${CalcularDesconto(preco[i])}.`)
}   