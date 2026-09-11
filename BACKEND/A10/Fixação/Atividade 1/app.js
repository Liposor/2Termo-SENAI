const entrada = require('readline-sync');

const conversor = require('./conversor');

console.log("======= CASA DE CAMBIO =======");

const valorpedido = entrada.questionInt("Digite o valor em Dolares que deseja comprar: ")
const valoremreais = conversor.Converter(valorpedido);

console.log("======= NOTA FINAL =======");
console.log(`\n Valor em dolar $${valorpedido}`);
console.log(`\n Valor em reais R$${valoremreais}`);