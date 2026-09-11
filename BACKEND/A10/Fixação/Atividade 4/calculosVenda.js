function calcularTotal(preço, qtd) {
  return preço * qtd;
}

function gerarCupom(nome, valor) {
  return `Cliente: ${nome}, \nTotal: R$${valor}`;
}

module.exports = {
  calcularTotal,
  gerarCupom
}