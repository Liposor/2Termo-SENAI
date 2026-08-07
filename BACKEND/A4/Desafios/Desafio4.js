const entrada = require('readline-sync');

console.log("Seja bem vindo a Classificação de Atletas!")

const idade_aluno = entrada.questionInt("Quantos anos tem o aluno? ")

if (idade_aluno >= 5 && idade_aluno <= 10) {
    console.log("O aluno é: INFANTIL")
} else if (idade_aluno >= 11 && idade_aluno <= 17) {
    console.log("O aluno é: JUVENIL")
} else if (idade_aluno >= 18 && idade_aluno <= 60) {
    console.log("O aluno é: ADULTO")
} else if (idade_aluno > 60) {
    console.log("O aluno é: SENIOR")
} else {
    console.log("O aluno é muito novo...")
}