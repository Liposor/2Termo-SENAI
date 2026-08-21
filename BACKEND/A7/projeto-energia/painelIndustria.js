const entrada = require('readline-sync');
const calculadora = require('./calculoEnergia');



console.log("\n=== Painel de Controle ===");

const nome = entrada.question("Digite o Nome da Maquina: ").toUpperCase();
const potencia = entrada.questionInt("Digite a potencia da Maquina em Watts: ");
const horas = entrada.questionInt("Digite a quantidade de horas que a Maquina ficou ligada: ");
const preco = entrada.questionFloat("Digite o preco do Kwh: ");


const calculoKwh = calculadora.calcularKwh(potencia, horas);
const custo = calculadora.calcularCusto(calculoKwh, preco);
const classificado = calculadora.classificarConsumo(calculoKwh);

console.log("\n --- Relatorio ---")
console.log(`Nome da maquina: ${nome}`)
console.log(`Potencia em Kwh: ${calculoKwh.toFixed(2)}`)
console.log(`Custo em R$${custo.toFixed(2)}`)
console.log(`O consumo foi: ${classificado}`)