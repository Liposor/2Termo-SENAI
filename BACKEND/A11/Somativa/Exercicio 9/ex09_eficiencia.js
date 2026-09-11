const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
  return (real / prevista) * 100
};

function classificarEficiencia(percentual) {
  if (percentual >= 90) {
    return "Meta Atingida"
  } else if (percentual >= 70 && percentual <= 89.99) {
    return "ATENCAO"
  } else {
    return "ABAIXO DA META"
  }
};

console.log("=== Organizador de Eficiência ===");

const Producao_Prevista = entrada.questionInt("Qual foi a produção prevista de pecas: ");
const Producao_Real = entrada.questionInt("Qual foi a produção real de pecas: ");
const percentual_final = calcularEficiencia(Producao_Real, Producao_Prevista);

console.log("\n=== Resultados ===");
console.log(`Producao Prevista: ${Producao_Prevista}`);
console.log(`Producao Real: ${Producao_Real}`);
console.log(`Eficiencia (Percentual): ${percentual_final}%`)
console.log(`Classificacao: ${classificarEficiencia(percentual_final)}`)


