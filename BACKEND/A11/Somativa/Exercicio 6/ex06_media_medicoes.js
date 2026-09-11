const entrada = require('readline-sync');

let acumulador = 0;


for (let i = 0; i < 5; i++) {
  let soma = entrada.questionInt(`Digite o valor da medida de numero ${i + 1}: `)
  acumulador = acumulador + soma;
}

const media = acumulador / 5; 

console.log("\n=== Resultado Final ===")
console.log(`A soma Final e: ${acumulador}`);
console.log(`A Media final e: ${media}`);