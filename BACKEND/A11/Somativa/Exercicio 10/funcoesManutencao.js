function calcularMaoDeObra(horas) {
  return horas * 80;
}

function calcularTotal(valorPecas, horas) {
  return valorPecas + horas
}

function verificarGarantia(meses) {
  return meses <= 6 ? "Em Garantia" : "Fora de Garantia";
}

module.exports = {
  calcularMaoDeObra,
  calcularTotal,
  verificarGarantia
}