const entrada = require('readline-sync')
let listaVisitantes = []

while(true) {
  let verdadeiro = entrada.keyInYNStrict("Deseja cadastrar um novo visitante? ")
  if (verdadeiro == true) {
    let nome2 = entrada.question("Digite o nome: ")
    let empresa2 = entrada.question("Digite a empresa: ")
    let objeto = {nome: `${nome2}`, empresa: `${empresa2}`}
    listaVisitantes.push(objeto)
  } else if (verdadeiro == false) {
    console.log("\nQuem entrou hoje:", listaVisitantes)
    console.log("Saindo do sistema...")
    break
  }
}