// Importa a biblioteca readline-sync
import { question, questionFloat, questionInt } from 'readline-sync';

console.log("---SISTEMA DE VENDAS PADARIA---");

//1. Entrada de dados pelo terminal

const nomeProduto = question("Qual o produto? ");
const precoUnitario = questionFloat("Qual o preco unitario? ");
const quantidade = questionInt("Quantas unidades foram vendidas? ");

//3. Processa a conta

const total = precoUnitario * quantidade;

//4. Saída de dados:
console.log("\n--- Recibo de Venda ---");
console.log(`Produto: ${nomeProduto}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);


