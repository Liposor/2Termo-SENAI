const entrada = require('readline-sync')
const calculadora = require('./calculadoraFrete')

console.log("\n=== SISTEMA DE ENTREGA ===")

const nome = entrada.question("Digite o nome do produto: ")
const distancia = entrada.questionFloat("Digite a distancia em km: ")
const valorCarga = entrada.questionFloat("Digite o valor total da Carga: ")

const frete = calculadora.calcularBase(distancia);
const seguro = calculadora.calcularSeguro(valorCarga);
const prazo = calculadora.verificarPrazo(distancia);

console.log("\n --- Resultado ---")
console.log(`O Produto: ${nome}`)
console.log(`Obteve o frete: R$${frete}, com o prazo de: ${prazo}`)
console.log(`E possui um seguro de R$${seguro} do produto`)
console.log(`Valor total: ${frete + seguro}`)
console.log("-".repeat(20))
