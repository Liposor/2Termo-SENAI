const entrada = require('readline-sync')
const num = entrada.questionInt("Tabuada de qual numero? ")

for (let i = 1; i <= 10; i++) {  // basicamente o i adiciona +1 a sua variável cada vez chamada.
    console.log(`\n${num} x ${i} = ${num * i}`) // então o i é multiplicado pelo num enviado.
}