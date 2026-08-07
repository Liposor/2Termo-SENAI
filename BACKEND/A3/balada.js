const entrada = require('readline-sync');
const idade = entrada.questionInt("Qual sua idade? ");

if (idade >= 18) {
    console.log("Acesso Liberado!");
} else {
    console.log("Volte para casa e estude mais!");
}