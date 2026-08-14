const entrada = require('readline-sync')

console.log("\n === Cinema ===")

const nome = entrada.question("\n Digite seu nome: ")
const idade = entrada.questionInt(" Digite a sua idade: ")

const filmes = [
    {
    Titulo: "Forest Gump",
    Classificacao: 13,
    },

    {
    Titulo: "Homem aranha",
    Classificacao: 10,
    },

    {
    Titulo: "50 Tons de Cinza",
    Classificacao: 18
    }

    ]

    const filmes_a = []

for (i = 0; i < filmes.length; i++) {
    if (idade >= (filmes[i].Classificacao)) {
        filmes_a.push(" " + filmes[i].Titulo)

    }


}

console.log(`\n Voce pode assistir o(s) filme(s): ${filmes_a} `)

