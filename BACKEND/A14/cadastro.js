const fs = require('fs');

const funcionarios = [
    { id: 1, nome: "Ana Silva", idade: 28, funcao: "Analista" },
    { id: 2, nome: "Luis Formigari", idade: 16, funcao: "Desenvolvedor" },
    { id: 3, nome: "Joãozinho", idade: 30, funcao: "Analista" },
    { id: 4, nome: "Lucas Daniel", idade: 40, funcao: "Gerente" }
];

const json = JSON.stringify(funcionarios, null, 2);
fs.writeFileSync('funcionarios.json', json, 'utf8');

console.log("Funcionarios cadastrados e salvos com sucesso!");