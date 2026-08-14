const entrada = require('readline-sync')

function calcularmedia(n1, n2) {
    return (n1 + n2) / 2;
}

console.log("\n--- Calculadora de media para notas ---")

const valor1 = entrada.questionFloat("\nDigite o valor da nota 1:  ")
const valor2 = entrada.questionFloat("Digite o valor da nota 2:  ")

const resultado2 = calcularmedia(valor1, valor2)
console.log(`\nO resultado da media calculada e: ${resultado2}`)
