

const alunos = ["jao", "lipe", "stefany", "tony", "roberto"];

console.log("Lista de alunos: ")
console.log(alunos)

console.log(`Primeiro aluno: ${alunos[0]}`);
console.log(`Segundo aluno: ${alunos[1]}`);
console.log(`Ultimo aluno: ${alunos[4]}`)
console.log(`Quantidade de alunos: ${(alunos.length) - 1}`)



// brincadeira que fiz com push

const entrada = require('readline-sync')

const alunos2 = []
const a1 = entrada.question("Digite o nome do primeiro Aluno: ")
alunos2.push(a1);
const a2 = entrada.question("Digite o nome do segundo Aluno: ")
alunos2.push(a2);
const a3 = entrada.question("Digite o nome do terceiro Aluno: ")
alunos2.push(a3);

console.log(`Primeiro aluno: ${alunos2[0]}`);
console.log(`Segundo aluno: ${alunos2[1]}`);
console.log(`Terceiro aluno: ${alunos2[2]}`);
console.log(`Quantidade de alunos: ${(alunos2.length)}`)