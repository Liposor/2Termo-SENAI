const entrada = require('readline-sync');
const manutencao = require('./funcoesManutencao')

console.log("=== Oficina Industrial ===")

const nomeMaquina = entrada.question("Digite o nome da Maquina: ")
const valorPeca = entrada.questionFloat("Digite o Valor da Peca: ")
const horasServico = entrada.questionInt("Digite o valor de horas do serviço:")
const mesesManutencao = entrada.questionInt("Digite o valor em Meses desde a Ultima manuntencao: ")

const custo_MaoObra = manutencao.calcularMaoDeObra(horasServico)

console.log("\n=== Relatorio Final ===")
console.log(`Nome da Maquina: ${nomeMaquina}`)
console.log(`Custo da Mao de Obra: R$${custo_MaoObra}`)
console.log(`Custo da Peca: R$${valorPeca}`)
console.log(`Custo Total: R$${manutencao.calcularTotal(valorPeca, custo_MaoObra)}`)
console.log(`Situacao da Garantia: ${manutencao.verificarGarantia(mesesManutencao)}`)
