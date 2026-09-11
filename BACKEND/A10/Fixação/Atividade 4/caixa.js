const entrada = require('readline-sync');
const Venda = require('./calculosVenda');

console.log("=== Sistema para Mercado ===")

const valor = entrada.questionInt("Digite o valor do produto: ")
const qtd = entrada.questionInt("Digite a quantidade do produto: ")
const nome = entrada.question("Digite o nome do cliente: ")


const valorFinal = Venda.calcularTotal(valor, qtd);
const cupom = Venda.gerarCupom(nome, valorFinal);

console.log("\n=== Cupom ===")
console.log(cupom)