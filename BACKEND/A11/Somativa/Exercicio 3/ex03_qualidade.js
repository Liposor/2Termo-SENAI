const entrada = require('readline-sync');

const peso = entrada.questionInt("Digite o peso da peca em gramas: ")

if (peso >= 95 && peso <= 105) {
  console.log("\nPeca Aprovada!")
} else {
  console.log("\nPeca Reprovada!")
}