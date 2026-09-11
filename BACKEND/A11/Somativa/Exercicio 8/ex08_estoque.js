let estoque = [];
const componentes = [
  {nome: "Teclado", Quantidade_Minima: 1, Quantidade: 0},
    {nome: "Mouse", Quantidade_Minima: 5, Quantidade: 12},
      {nome: "Parafuso", Quantidade_Minima: 10, Quantidade: 200}

]


console.log("=== Relatorio de Componentes ===")
for (let i = 0; i < 3; i++) {
  let componente_atual = componentes[i];
  estoque.push(componente_atual);

  if (componente_atual.Quantidade < componente_atual.Quantidade_Minima) {
    console.log(`O Componente: ${componente_atual.nome}, Alerta: REPOR ESTOQUE`)
  } else {
    console.log(`O Componente: ${componente_atual.nome}, Alerta: ESTOQUE OK`)
  }
}