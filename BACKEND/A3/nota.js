const entrada = require('readline-sync');



const nome = entrada.question("Qual seu nome? ");

const n1 = entrada.questionInt("Qual foi sua primeira nota? ");
const n2 = entrada.questionInt("Qual foi sua segunda nota? ");

let media = (n1 + n2) / 2

console.log(`\nMedia final de ${nome}: ${media.toFixed(1)}`)

if (media >= 6) {
    console.log("Você foi aprovado! Suas notas estão acima da média")
} else if (media >= 5 && media < 7){
    console.log("Você está de Recuperação! Estude para a próxima prova")
} else {
    console.log("Você foi Reprovado! Estude mais da próxima vez.")
}
