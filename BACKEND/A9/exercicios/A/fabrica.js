const fs = require('fs');

const maquinas = [
  { "id": 1, "nome": "Torno CNC", "horasUso": 1200 },
  { "id": 2, "nome": "Fresadora", "horasUso": 800 },
  { "id": 3, "nome": "Prensa Hidraulica", "horasUso": 1500 },
  { "id": 4, "nome": "Corte a Laser", "horasUso": 500 }
];

let MaquinasVerificada = [];

try {
  function salvarDados() {
      const dadosTexto = JSON.stringify(maquinas, null, 2);
      fs.writeFileSync('maquinas.json', dadosTexto);
      console.log("Dados salvos com sucesso no arquivo maquinas.json!");
  }

  function Verhoras() {
      console.log("\n--- Produtos com horas a cima (mais de 1000 horas)---");
      const dadosMaquinas = fs.readFileSync('maquinas.json', 'utf-8');
      const MaquinasV = JSON.parse(dadosMaquinas);

      MaquinasVerificada = MaquinasV.filter(p => p.horasUso > 1000);
      console.log(MaquinasVerificada);
  }

  function salvarManutencao() {
    const dadosManutencao = JSON.stringify(MaquinasVerificada, null, 2);

    fs.writeFileSync('Manutencao_urgente.json', dadosManutencao)
    console.log("Dados salvos com sucesso ")
  }
} catch(erro) {
      console.log("Erro ao acessar o banco de dados: "+ erro.message);
}


salvarDados();
Verhoras();
salvarManutencao();