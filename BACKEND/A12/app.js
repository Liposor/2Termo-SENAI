// PROJETO DO ALUNO - complete as funções abaixo.
// Execute com: npm start
const fs = require('node:fs');
const caminho = require('node:path');
const ARQUIVO = caminho.join(__dirname, 'maquinas.json');


const maquina = carregarMaquinas();
console.log(filtrarPorSetor(maquina, 'Montagem'));




function carregarMaquinas() {
  const arquivo_lido = JSON.parse(fs.readFileSync(ARQUIVO, 'utf-8'));
  return arquivo_lido;
}

function listarMaquinas(maquinas) {
  maquinas.forEach(maquina => {
    console.log("\nid: " + maquina.id);
    console.log("Nome: " + maquina.nome);
    console.log("Status: " + maquina.status);
    console.log("\n--------------------");
  });

}

function buscarPorId(maquinas, id) {
  return maquinas.find(maquina => maquina.id === id);
}

function filtrarPorStatus(maquinas, status) {
  return maquinas.filter(maquina => maquina.status === status);
}

function filtrarPorSetor(maquinas, setor) {
  return maquinas.filter(maquina => maquina.setor === setor);
}

function executar() {
  try {
    const maquinas = carregarMaquinas();

    listarMaquinas(maquinas);

    console.log('id 3:', buscarPorId(maquinas, 3));
    console.log('od 99:', buscarPorId(maquinas, 99));
    console.log('manutencao:', filtrarPorStatus(maquinas, 'manutencao'));
    console.log('Operando:', filtrarPorStatus(maquinas, 'operando'));
    console.log('Inexistente:', filtrarPorStatus(maquinas, 'inexistente'));
    console.log('usinagem:', filtrarPorSetor(maquinas, 'Usinagem'));




  } catch (erro) {
    console.log('Erro:', erro.message);
    // console.log('teste')
  }
}

if (require.main === module) executar();
module.exports = { carregarMaquinas, listarMaquinas, buscarPorId, filtrarPorStatus, filtrarPorSetor };
