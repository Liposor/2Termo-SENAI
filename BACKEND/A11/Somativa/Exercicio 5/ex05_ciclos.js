const entrada = require('readline-sync');

const pecas = entrada.questionInt("Quantas peças sao produzidas por ciclo: ")

for (let i = 0; i < 10; i++) {
  console.log(`\n Pecas produzidas no ciclo ${i + 1}: ${pecas * (i + 1) }`)
}
