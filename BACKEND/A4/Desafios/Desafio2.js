const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ")
const valor_pago = entrada.question("Digite o valor pago no restaurante: ")

const desconto =  valor_pago - (valor_pago * 0.10) 
const diferenca = 100 - valor_pago

if (valor_pago >= 100) {
    console.log(`\nParabéns, você recebeu um desconto de 10%! Agora você irá pagar: ${desconto.toFixed(2)}`)
} else { 
    console.log(`\nTriste noticia por ${diferenca.toFixed(2)} reais você não recebeu um desconto!`)
}