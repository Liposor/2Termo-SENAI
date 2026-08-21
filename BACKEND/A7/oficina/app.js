const entrada = require('readline-sync');

const oficina = require('./funcoesOficina.js');


console.log("\n=== SISTEMA DE GESTAO DE OFICINA ===");

const hora = entrada.questionFloat("Digite a quantidade de Horas trabalhada: ");
const valorpeca = entrada.questionFloat("Digite o valor da peca: ");
const meses = entrada.questionInt("Digite a quantos meses voce possui o carro: ");

const total = oficina.calcularOrcamento(valorpeca, hora);
const totalDesconto = oficina.comDesconto(total)

console.log("\n=== Relatorio Final ===");
console.log(`O valor total no orçamento deu: R$ ${total.toFixed(2)}`);
console.log(`O valor total no orçamento com desconto (5%) deu: R$ ${totalDesconto.toFixed(2)}`);
console.log(`A sua Garantia esta: ${oficina.verificarGarantia(meses)}`);

entrada.question("\nAperte 'Enter' para encerrar: ");


