const entrada = require('readline-sync');

console.log("=== Cadastro de Nomes ===")

let operadores = [];

for (let i = 0; i < 5; i++) {
  let nomes = entrada.question(`Digite o ${i +1}* nome: `);
  operadores.push(nomes);
}

console.log("\nNomes cadastrados: ")

for (let i = 0; i < operadores.length; i++) {
  console.log(`${i + 1} - ${operadores[i]}`)
}
