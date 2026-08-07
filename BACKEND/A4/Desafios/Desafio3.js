const entrada = require('readline-sync');

const gasolina = entrada.questionInt("Quanto esta o valor do litro da Gasolina? ")
const Alcool = entrada.questionInt("Quanto esta o valor do litro do Alcool? ")

const diferenca = Alcool / gasolina

if (diferenca <= 0.7) {
    console.log("Abasteça com ÁCOOL! Está mais barato!!")
} else {
    console.log("Abasteça com GASOLINA! Compensa MAIS!!")
}