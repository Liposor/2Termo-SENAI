const entrada = require('readline-sync')

console.log("\n=== Sistema de aposentadoria ===")

const nome = entrada.question("\nDigite seu nome: ")
const idade = entrada.questionInt("Digite quantos anos voce tem: ")
const tempo_trabalho = entrada.questionInt("Digite quanto tempo de trabalho voce tem: ")

if (idade >= 65 || tempo_trabalho >= 30) {
    console.log(`\nParabens! ${nome}, voce pode se aposentar!`)
} else {
    console.log(`Triste noticia! ${nome}, voce nao pode se aposentar...`)
}