const entrada = require('readline-sync');

const sensor = require('./sensor');

console.log("=== Gestor de Clima Industrial ===")

const temperatura = entrada.questionInt("Digite a temperatura da Caldeira (Celsius): ")
const umidade = entrada.questionInt("Digite a umidade da Caldeira: ")

let alertaTemperatura = sensor.checarTemperatura(temperatura);
let alertaUmidade = sensor.checarUmidade(umidade)

console.log("=== Resultado ===")
console.log(`\n alerta da Temperatura: ${alertaTemperatura}`)
console.log(`\n alerta da Umidade: ${alertaUmidade}`)