CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_LUIS;

USE SMARTCOFFEE_LUIS;


CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    data_admissao DATE
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Email VARCHAR(250) UNIQUE,
    Telefone VARCHAR(17),
    data_cadastro DATE
);

CREATE TABLE Categoria (
    Categoria_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Categoria VARCHAR(40) NOT NULL,
    Descricao VARCHAR(150),
    Codigo INT NOT NULL UNIQUE,
    Tipo VARCHAR(15) NOT NULL,
    Data_Cadastrado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Fornecedor (
    Fornecedor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Fornecedor VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    Tipo_Entrega VARCHAR(20), 
    Status_Fornecimento VARCHAR(20), 
    Data_Fornecida DATETIME
);

CREATE TABLE Estoque (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nome_insumo VARCHAR(250) NOT NULL,
    quantidade_atual INT NOT NULL,
    Quantidade_Minima INT NOT NULL,
    unidade_medida VARCHAR(2) 
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(150) NOT NULL
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    tipo_pedido VARCHAR(20) 
);



CREATE TABLE Plano_de_Fidelidade (
    id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    saldo_pontos INT,
    data_ultima_adesao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor_pago DECIMAL(10,2) NOT NULL,
    Status_Pagamento VARCHAR(20) NOT NULL DEFAULT 'Reprovado',
    Data_Hora_Pagamento DATETIME,
    forma_pagamento VARCHAR(20), 
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Delivery (
    id_delivery INT AUTO_INCREMENT PRIMARY KEY,
    Taxa_Entrega DECIMAL(10,2) NOT NULL,
    data_hora_saida DATETIME,
    Status_Entrega VARCHAR(20), 
    endereco_entrega VARCHAR(255) NOT NULL,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);



CREATE TABLE Item_Pedido (
    id_produto INT,
    id_pedido INT,
    quantidade INT NOT NULL,
    preco_historico DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produto, id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Atende (
    id_funcionario INT,
    id_pedido INT,
    PRIMARY KEY (id_funcionario, id_pedido),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Realiza (
    id_cliente INT,
    id_pedido INT,
    PRIMARY KEY (id_cliente, id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Consome (
    id_produto INT,
    id_insumo INT,
    PRIMARY KEY (id_produto, id_insumo),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_insumo) REFERENCES Estoque(id_insumo)
);

CREATE TABLE classifica (
    id_produto INT,
    Categoria_ID INT,
    PRIMARY KEY (id_produto, Categoria_ID),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (Categoria_ID) REFERENCES Categoria(Categoria_ID)
);

CREATE TABLE fornecido (
    id_produto INT,
    Fornecedor_ID INT,
    PRIMARY KEY (id_produto, Fornecedor_ID),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedor(Fornecedor_ID)
);

CREATE TABLE Entrega (
    id_delivery INT,
    id_funcionario INT,
    PRIMARY KEY (id_delivery, id_funcionario),
    FOREIGN KEY (id_delivery) REFERENCES Delivery(id_delivery),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
)