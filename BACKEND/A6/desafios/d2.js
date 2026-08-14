const entrada = require('readline-sync')

console.log("\n=== Sistema de Parcelas ===")

const valor = entrada.questionInt("\nDigite o valor do produto: ")
const parcela = entrada.questionInt("Quantas parcelas voce quer? ")

for (let i = 0; i < parcela; i++ ) {
    const vparcela = valor / parcela
    console.log(`\nParcela de numero ${i}: R ${vparcela.toFixed(2)}`)



}