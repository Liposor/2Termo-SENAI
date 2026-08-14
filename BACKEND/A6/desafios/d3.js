
// JEITO 1:

// const entrada = require('readline-sync')

// console.log("\n=== Calculadora de Area de Terrenos ===")

// const largura = entrada.questionInt("\nDigite a largura em metros do terreno 1: ")
// const comprimento = entrada.questionInt("Digite o comprimento em metros de um terreno 1: ")

// const largura2 = entrada.questionInt("\nDigite a largura em metros do terreno 2: ")
// const comprimento2 = entrada.questionInt("Digite o comprimento em metros de um terreno 2: ")

// const largura3 = entrada.questionInt("\nDigite a largura em metros do terreno 3: ")
// const comprimento3 = entrada.questionInt("Digite o compriment em metros o de um terreno 3: ")

// function calcularArea(lar, com) {
//     return lar * com;
// }

// const terreno1 = calcularArea(largura, comprimento)
// const terreno2 = calcularArea(largura2, comprimento2)
// const terreno3 = calcularArea(largura3, comprimento3)

// console.log(`\n O Valor da area do terreno 1 e de: ${terreno1} m²`)
// console.log(`\n O Valor da area do terreno 2 e de: ${terreno2} m²`)
// console.log(`\n O Valor da area do terreno 3 e de: ${terreno3} m²`)


// JEITO 2:

const entrada = require('readline-sync')

console.log("\n=== Calculadora de Area de Terrenos ===")

function calcularArea(a1, a2) {
    return a1 * a2
}

for (i = 0; i < 3; i++) {
    let largura = entrada.questionInt(`\n Digite em metros a largura de seu terreno ${i + 1}: `)
    let comprimento = entrada.questionInt(`\n Digite em metros o comprimento de seu terreno ${i + 1}: `)

    let calculado = calcularArea(largura, comprimento)
    console.log(`\nO seu terreno ${i} tem em m²: ${calculado}`)
}