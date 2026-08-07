const entrada = require('readline-sync')

console.log("--- Seja Bem vindo ao Sistema de Analise de Creditos do SENAI ---")

const nome = entrada.question("Digite seu nome: ")
const idade = entrada.questionInt("Digite sua idade: ")
const renda = entrada.questionFloat("Renda Mensal: ")
const temImovel = entrada.keyInYNStrict("Possui imovel Proprio? ")


if (idade >= 18 && (renda >= 2800 || temImovel === true) ) {
    console.log(`\nParabens, ${nome}! | seu crédito foi aprovado!`)
} else {
    console.log(`\nTriste Noticia, ${nome}! | Seu crédito foi negado!`)
}
