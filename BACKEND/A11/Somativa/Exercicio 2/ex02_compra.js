const entrada = require('readline-sync')

console.log("=== Sitema para compra de Materia-Prima ===")

const Nome_Materia = entrada.question("Digite o nome da Materia Prima: ")
const qnt = entrada.questionInt("Digite a quantidade comprada: ")
const preco_unitario = entrada.questionFloat("Digite o Valor Unitario do item (em reais): ")

const calculo = preco_unitario * qnt;

console.log("\n=== Resumo da Compra ===")
console.log(`Nome da Materia: ${Nome_Materia}`)
console.log(`Valor Unitario: ${preco_unitario}`)
console.log(`Quantidade comprada: ${qnt}`)
console.log(`Valor final: R$${calculo}`)