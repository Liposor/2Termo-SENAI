const entrada = require ('readline-sync');

console.log("Sistema de temperatura");

const temperatura = entrada.questionFloat("Digite a temperatura: ");

if (temperatura <= 60) {
  console.log("\n Situação: NORMAL")
} else if (temperatura >= 61 && temperatura <=80) {
  console.log("\n Situação: ATENÇÃO")
} else {
  console.log("\n Situação: CRITICA")
}