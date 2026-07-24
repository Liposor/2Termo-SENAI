# Desafio 1

# custo_diario = 90
# Maiskm100 = 0.15
# km100 = 0.20

# Alugados = int(input("Digite a quantidade de dias que seu carro estava alugado: "))
# kmRodado = float(input("Digite a quantidade de KM rodado: "))

# valorfinal = 0

# if kmRodado > 100: 
#     valorfinal = float((custo_diario * Alugados) + (kmRodado * Maiskm100))
# else:
#     valorfinal = float((custo_diario * Alugados) + (kmRodado * km100))

# print("--------- Nota Fiscal ---------")
# print(f"        Valor final: {valorfinal:.2f}" )
# print("-------------------------------")



# Desafio 2: Repetição e Listas (O Filtro de Pares)
# Enunciado em Python: Dado o seguinte código inicial com uma lista de
# números:
# numeros = [12, 5, 8, 21, 14, 3, 10, 7]
# Escreva um programa que:
# 1. Percorra a lista e crie uma nova lista contendo apenas os números pares.
# 2. Calcule e exiba a média desses números pares.
# - O que avalia no aluno: Laços de repetição (for), listas, método .append(),
# acúmulo de valores e o operador de resto de divisão %.



# numeros = [12, 5, 8, 21, 14, 3, 10, 7]
# numeros_par = []
# i = 0
# a = 0

# for nume in numeros:
#     par = nume % 2

#     if par == 0:
#         i += 1
#         numeros_par.append(nume)
#         a += nume
    
# resultado = a / i 
# print(numeros_par)
# print(resultado)


# Desafio 3: Funções e Dicionários (O Desconto no Produto)
# Enunciado em Python: Crie um dicionário representando um produto: produto =
# {"nome" Teclado Mecânico&quot;, &quot;preco&quot;: 200.0, &quot;estoque&quot;: 15}
# 1. Crie uma função chamada aplicar_desconto que receba o dicionário do
# produto
# e a porcentagem de desconto (ex: 10 para 10%).
# 2. A função deve atualizar o preço do produto dentro do dicionário e exibir a
# mensagem: &quot;O produto [NOME] agora custa R$ [NOVO_PRECO]!”


produto = {"nome": "Teclado Mecânico", "Preco": 200.0, "Estoque": 15}

desconto = float(input("Digite a quantidade de desconto que você deseja: "))
porcentagem_desconto = 0
valor_final = 0
valor_produto = 0

def aplicar_desconto():
    global valor_final, porcentagem_desconto, valor_produto
    porcentagem_desconto = desconto / 100 
    valor_produto = produto.get("Preco")
    valor_final = float((valor_produto * porcentagem_desconto) - valor_produto)
    produto["Preco"] = valor_final

aplicar_desconto()
print(f"O produto {produto.get("nome")} agora custa {produto.get("Preco") *-1 }")