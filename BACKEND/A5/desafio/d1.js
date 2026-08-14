const entrada = require('readline-sync')

console.log("--- Seja bem vindo ao sistema de entrada no senai ---")

const nome = entrada.question("Digite seu nome: ")
const idade = entrada.questionInt("Digite sua idade: ")
const autorizado = entrada.keyInYNStrict("Possui Autorizacao?: ")
const acompanhado = entrada.keyInYNStrict("Voce esta acompanhado ao professor?: ")
const suspenso = entrada.keyInYNStrict("Voce esta suspenso?: ")



if ((idade >= 16 && autorizado === true && suspenso === false) || (acompanhado === true && suspenso === false) )  {
    console.log(`\nParabens, ${nome}! | Acesso Liberado!`)
} else {
    if (suspenso === true) {
        console.log(`\nTriste Noticia, ${nome}, você está suspenso! | Acesso Negado!`)
    } else {
        console.log(`\nTriste Noticia, ${nome}! | Acesso Negado!`)
    }
    
}
