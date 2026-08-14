const entrada = require('readline-sync')

const notas = [];
const quantidade = entrada.questionInt("Quantas notas deseja cadastrar? ")
for (let i = 0; i < quantidade; i++) {
    let nota = entrada.questionFloat(`Digite a nota ${i + 1}: `);

    notas.push(nota);
}

console.log("\nNotas cadastradas: ")
console.log(notas)

console.log(`Quantidade de notas: ${notas.length}`)

soma = 0
for (let i = 0; i < notas.length; i++) {
    soma += notas[i]
}
console.log(`Soma das notas: ${soma}`)
console.log(`A media das notas: ${soma / (notas.length)}`)