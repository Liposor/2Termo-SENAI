const fs = require('fs');
const entrada = require('readline-sync');



function criarBanco() {
        const dadosTexto = JSON.stringify(maquinas, null, 2);
        fs.writeFileSync('maquinas.json', dadosTexto);
        console.log("Dados salvos com sucesso no arquivo maquinas.json!");
};

try {

}