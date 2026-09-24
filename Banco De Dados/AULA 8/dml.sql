-- BANCO DE DADOS - SMARTCOFFEE - DML 

DROP DATABASE IF EXISTS SMARTCOFFEE_DML_LUIS;

CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_LUIS;

USE SMARTCOFFEE_DML_LUIS;

CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL UNIQUE,
  email VARCHAR(120) UNIQUE,
  telefone VARCHAR(15),
  cidade VARCHAR(60) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

ALTER TABLE cliente
ADD email VARCHAR(120) UNIQUE,
ADD telefone VARCHAR(15),
ADD cidade VARCHAR(60) NOT NULL,
ADD ativo BOOLEAN NOT NULL DEFAULT TRUE;



CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  data_pedido DATETIME NOT NULL,
  status_pedido ENUM('ABERTO', 'PREPARANDO', 'FINALIZANDO', 'CANCELADO') NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  id_cliente INT NOT NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);



CREATE TABLE item_pedido (
  id_item INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  observacao VARCHAR(150),
  CONSTRAINT fK_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);

CREATE TABLE forma_pagamento (
  id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL UNIQUE
);



CREATE TABLE pagamento (
  id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_forma_pagamento INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  data_pagamento DATETIME,
  CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
  CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
);



INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Luis Felipe', 'luis@emai.com', '1999999901', 'Limeira', TRUE), ('Maria Eduarda', 'Maria@email.com', '19931391', 'Limeira', TRUE), ('Mateus Silva', 'Mateus@email.com', '19999313', 'Limeira', TRUE), ('Matheus Oricolli', 'Matheus@email.com', '19998313', 'Limeira', TRUE), ('OTAVIO CORREIA', 'Otavio@email.com', '195838891', 'Conchal', TRUE), ('Nicolas Filipe', 'Nicolas@email.com', '19989593', 'Limeira', TRUE), ('Pedro Miranda', 'Pedro@email.com', '199950391', 'Alemanha', TRUE),('Rafael Vieira', 'Rafael@email.com', NULL, 'Limeira', TRUE), ('Rebecca Hernandes', 'Rebecca@email.com', NULL, 'Limeira', TRUE), ('Rennan Campos', 'Rennan@email.com', '193985391', 'Americana', TRUE), ('Samira Dalosto', 'Samira@email.com', NULL, 'Ourinhos', FALSE), ('Sophia Carolina', 'sophia@email.com', '1984081023', 'Taubaté', TRUE), ('Vanessa Queiroz', 'vanessa@email.com', '1993412381', 'Limeira', TRUE), ('Vinicius Henrique', 'Viniciusg@email.com', '193948931', 'Limeira', TRUE), ('Vinicius Oliveira', 'vinicius@email.com', '19938899531', 'Chicago', TRUE), ('Stefany Santana', 'stafany@email.com', '199939591', 'Campinas', FALSE);

SELECT * FROM cliente;

SELECT * FROM categoria;

SELECT * FROM produto;

SELECT * FROM pedido;

SELECT * FROM item_pedido;

SELECT * FROM forma_pagamento;

SELECT * FROM pagamento;

INSERT INTO categoria (nome) VALUES ('Cafe'), ('Bebidas Geladas'), ('Doces'), ('Salgados'), ('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES ('Capuccino', 18.90, TRUE, 1), ('Coca Cola', 7.90, TRUE, 2), ('Salgado + Refri', 13.00, TRUE, 5), ('Brigadeirão', 29.90, TRUE, 3), ('Esfiha de queijo', 10.0, TRUE, 4);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES ('2026-01-24', TRUE, 19.90, 17),('2026-03-31', TRUE, 8.90, 19),('2026-01-12', TRUE, 39.90, 23),('2026-01-15', TRUE, 1.90, 21),('2026-01-15', TRUE, 29.90, 25);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES (1, 1, 20, 18.90, NULL), (2, 2, 4, 18.90, 'Estoque necessáio de um cliente'), (3, 5, 1, 39.90, 'Esfiha de quiejo, carne e frango'), (4, 4, 1, 29.90, 'Pegou um pedaço do brigadeirão por 1.90'), (5, 3, 1, 29.90, 'Tava com fome');

INSERT INTO forma_pagamento (descricao) VALUES ('CREDITO'), ('DEBITO'), ('PIX'), ('DINHEIRO'), ('BOLETO');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES (1, 2, 19.90, '2026-01-24'), (2, 3, 8.90, '2026-03-31'), (3, 4, 39.90, '2026-01-12'), (4, 5, 1.90, '2026-01-15'), (5, 1, 29.90, '2026-01-15');


UPDATE cliente
SET telefone = '193913919'
WHERE id_cliente = 27;

UPDATE produto SET PRECO = 1.00;

UPDATE CLIENTE TELEFONE = '90909090', CIDADE = 'CAMPINAS' WHERE ID_CLIENTE = 11;

insert into pedido (data_pedido, status, valor_total, id_cliente) VALUES (NOW(), 'ABERTO', '0.00', 30);
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

UPDATE produto SET preco = preco * 1.05 WHERE id_categoria = 1;

UPDATE produto
SET PRECO = CASE 
  WHEN PRECO < 10 THEN PRECO * 1.10  
  ELSE  PRECO * 1.05
END
WHERE ATIVO = TRUE;

-- separacao da resenha e do trabalho 

DELETE FROM cliente WHERE id_cliente = 27;

UPDATE CLIENTE SET ATIVO = FALSE WHERE ID_CLIENTE = 10;












USE SMARTCOFFEE_DML_LUIS;


-- DESAFIOS

-- PLAN A

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Roberto Loreal', 'robertoLo@email.com', '19998359331', 'Limeira', TRUE), ('Joao Pedro', 'JpFormiga@email.com', NULL, 'Campinas', FALSE); --1
INSERT INTO categoria (nome) VALUES ('Especiais da Casa'); -- 2
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES ('Picanha na chapa', '190.0', TRUE, 16), ('Hamburguer do Chefe', '49.0', TRUE, 16), ('Guacamole com doritos', '89.90', TRUE, 16); -- 3
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Manuel', 'manuel@email.com', NULL, 'Limeira', TRUE); -- 4
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES ('2026-05-27', 'Finalizado', 19.90, 35); --5


-- 6
SET @pedido = LAST_INSERT_ID();
INSERT INTO item_pedido
(id_pedido, id_produto, quantidade, preco_unitario, observacao)
VALUES (@pedido, 8, 1, 89.90, 'Guacamole sem abacate'),
(@pedido, 6, 1, 190.00, 'Picanha sem gordura');




-- PLAN B

-- 1
UPDATE cliente
SET telefone = '9090909090'
WHERE id_cliente = 35;

-- 2

UPDATE cliente
SET telefone = '193913919', cidade = 'Sapucai Mirim'
WHERE id_cliente = 35;

-- 3
UPDATE produto SET preco = preco * 1.05 WHERE id_categoria = 16;


-- 4]
UPDATE produtos SET status = 'PREPARANDO' where 