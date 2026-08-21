const entrada = require('readline-sync')
const balanca = require('./funcoesBalança')

let sistema_ativo = true;

while (sistema_ativo) {

    try {
        console.log("\n=== Balanca industrial ===");
        const leitura = entrada.question("Digite o peso (g): ");
        
        if (leitura.toLowerCase() === 'sair') break;

        const valorf = balanca.verificarPeso(leitura);


        console.log(valorf)

    } catch (erro) {
        console.log(`\n⚠️  ALERTA: ${erro.message}`);
    }

}