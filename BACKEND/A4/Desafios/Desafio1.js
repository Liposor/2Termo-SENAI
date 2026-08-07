const entrada = require('readline-sync');

console.log("----------- Seja bem vindo ao Desafio 1! -----------")

const nome = entrada.question("Digite seu nome: ");
const ano_nascimento = entrada.questionInt("Digite seu ano de nascimento? ");


const idade = 2026 - ano_nascimento

if (idade == 16) {
    console.log(`\nParabéns ${nome}, agora você pode votar!`)
} else if (idade > 16) {
    console.log(`\n${nome}, você pode votar!`)
} else {
    console.log(`\nQue pena ${nome}, você ainda não pode votar!`)
}