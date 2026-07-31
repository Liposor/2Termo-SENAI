const readline = require("readline-sync");


const nome = readline.question("Digite o nome do aluno: ");
const idade = Number(readline.question("Digite a idade do aluno: "));
const turma = readline.question("Digite o nome da turma: ");

const escola = readline.question("Digite o nome da escola: ");
const disciplina = readline.question("Digite o nome da disciplina: ");
const periodo = readline.question("Digite o periodo (manha, tarde ou noite): ");
const anoLetivo = Number(readline.question("Digite o ano letivo: "));


const n1 = Number(readline.question("Digite a primeira nota: "));
const n2 = Number(readline.question("Digite a segunda nota: "));
const faltas = Number(readline.question("Digite a quantidade de faltas: "));


const media = (n1 + n2) / 2;


console.log("\n================================");
console.log("       RELATORIO DO ALUNO");
console.log("================================");
console.log("Aluno:", nome);
console.log("Idade:", idade, "anos");
console.log("Turma:", turma);
console.log("Escola:", escola);
console.log("Disciplina:", disciplina);
console.log("Periodo:", periodo);
console.log("Ano letivo:", anoLetivo);
console.log("--------------------------------");
console.log("Nota 1:", n1.toFixed(1));
console.log("Nota 2:", n2.toFixed(1));
console.log("Media:", media.toFixed(1));
console.log("Faltas:", faltas);
console.log("================================");