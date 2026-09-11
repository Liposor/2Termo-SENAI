function checarTemperatura(valor) {
  return valor > 40 ? "Alerta: Caldeira Superaquecida" : "Caldeira em Temperatura comum"
};

function checarUmidade(valor) {
  return valor < 20 ? "Alerta: ar muito seco" : "Umidade adequada"
};

module.exports = {
  checarTemperatura,
  checarUmidade
};