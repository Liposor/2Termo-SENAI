const entrada = require('readline-sync');

let pecasDefeituosas = [];
const qntpecas = entrada.questionInt("Digite a quantidade de pecas defeituosas encontradas: ")

for(let i = 0; i < qntpecas; i++) {
  let nomepeca = entrada.questionInt(`Digite o numero de serie da ${i + 1} peca: `)
  pecasDefeituosas.push(nomepeca)
}

console.log("=== Resultado Final ===")
console.log(`Total de pecas ${pecasDefeituosas.length}`)
console.log(`Numeros de Série: ${pecasDefeituosas}`)