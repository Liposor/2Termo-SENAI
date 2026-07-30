const { questionFloat } = require("readline-sync");

console.log("---[ Calculadora de IMC ]---");

const Altura = questionFloat("Qual a sua altura (m)? ");
const Peso = questionFloat("Qual o seu peso (kg)? ");

const IMC = Peso / (Altura * Altura);

console.log(

    // aurinha
    "Seu peso:", Peso,
    "| Sua altura:", Altura,
    "| IMC:", IMC.toFixed(2)


);