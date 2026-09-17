const entrada = require('readline-sync');
const proCiclo = entrada.questionInt("Digite a quantidade de pecas por ciclo: ");

for (let i = 0; i <= 10; i++) {
  console.log(`\n Ciclo ${i + 1}: ${proCiclo * (i + 1)}`)
}