CREATE DATABASE IF NOT EXISTS assistencia_tecnica;





USE assistencia_tecnica;




CREATE TABLE CLIENTE (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  cliente_nome VARCHAR(100) NOT NULL,

  cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,


  endereco VARCHAR(150) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  
  email VARCHAR(120) NULL



);

CREATE TABLE TECNICO (
  id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
  nome_tecnico VARCHAR(100) NOT NULL,

  especialidade VARCHAR(100) NOT NULL,
  turno VARCHAR(20) NOT NULL CHECK (turno IN ('Manhã', 'Tarde', 'Integral')),
  telefone_tecnico VARCHAR(15) NOT NULL,
  email_tecnico VARCHAR(120) NOT NULL



);

CREATE TABLE EQUIPAMENTO (




  id_equipamento INT PRIMARY KEY AUTO_INCREMENT,
  tipo_equipamento VARCHAR(50) NOT NULL,
  marca VARCHAR(50) NOT NULL,

  modelo VARCHAR(100) NOT NULL,
  numero_serie INT NOT NULL UNIQUE,
  data_aquisicao DATE NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT fk_equipamento_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE CHAMADO (
  id_chamado INT PRIMARY KEY AUTO_INCREMENT,
  descricao_defeito VARCHAR(200) NOT NULL,
  prioridade VARCHAR(20) NOT NULL CHECK (prioridade IN ('Baixa', 'Média', 'Alta')),
  data_abertura DATETIME NOT NULL,
  data_fechamento DATETIME NULL,
  status_defeito VARCHAR(10) NOT NULL CHECK (status_defeito IN ('ATIVO', 'INATIVO')),
  id_equipamento INT NOT NULL,
  id_tecnico INT NULL,
  CONSTRAINT fk_chamado_equipamento FOREIGN KEY (id_equipamento) REFERENCES EQUIPAMENTO (id_equipamento) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_chamado_tecnico FOREIGN KEY (id_tecnico) REFERENCES TECNICO (id_tecnico) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE PECA (
  id_peca INT PRIMARY KEY AUTO_INCREMENT,
  codigo_peca VARCHAR(30) NOT NULL UNIQUE,
  nome_peca VARCHAR(100) NOT NULL,
  fabricante VARCHAR(60) NOT NULL,
  valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario >= 0),
  quantidade_estoque INT NOT NULL CHECK (quantidade_estoque >= 0)
);

CREATE TABLE CHAMADO_PECA (
  id_chamado INT NOT NULL,
    -- id_chamador INT NOT NULL,
  id_peca INT NOT NULL,

  PRIMARY KEY (id_chamado, id_peca),
  CONSTRAINT fk_cp_chamado FOREIGN KEY (id_chamado) REFERENCES CHAMADO (id_chamado) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_cp_peca FOREIGN KEY (id_peca) REFERENCES PECA (id_peca) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO CLIENTE (id_cliente, cliente_nome, cpf_cnpj, endereco, telefone, email) VALUES
(1, 'Joao Silva', '12345678901', 'Rua das Flores, 100', '19999990001', 'joao@email.com'),
(2, 'Maria Santos', '23456789012', 'Avenida Brasil, 200', '19999990002', 'maria@email.com'),
(3, 'Pedro Oliveira', '34567890123', 'Rua Central, 300', '19999990003', 'pedro@email.com'),
(4, 'Ana Costa', '45678901234', 'Rua das Palmeiras, 400', '19999990004', 'ana@email.com'),
(5, 'Lucas Ferreira', '56789012345', 'Avenida Paulista, 500', '19999990005', 'lucas@email.com'),
(6, 'Carla Souza', '67890123456', 'Rua dos Pinheiros, 600', '19999990006', 'carla@email.com'),
(7, 'Rafael Lima', '78901234567', 'Rua São João, 700', '19999990007', 'rafael@email.com'),
(8, 'Juliana Alves', '89012345678', 'Avenida Independência, 800', '19999990008', 'juliana@email.com'),
(9, 'Bruno Martins', '90123456789', 'Rua do Comércio, 900', '19999990009', 'bruno@email.com'),
(10, 'Fernanda Rocha', '01234567890', 'Rua Primavera, 1000', '19999990010', 'fernanda@email.com');

SELECT * FROM CLIENTE;

INSERT INTO TECNICO (id_tecnico, nome_tecnico, especialidade, turno, telefone_tecnico, email_tecnico) VALUES
(1, 'Carlos Mendes', 'Hardware', 'Manhã', '19988880001', 'carlos@assistencia.com'),
(2, 'Marcos Pereira', 'Software', 'Tarde', '19988880002', 'marcos@assistencia.com'),
(3, 'Roberto Alves', 'Redes', 'Integral', '19988880003', 'roberto@assistencia.com'),
(4, 'Paulo Souza', 'Eletronica', 'Manhã', '19988880004', 'paulo@assistencia.com'),
(5, 'André Lima', 'Hardware', 'Tarde', '19988880005', 'andre@assistencia.com'),
(6, 'Felipe Costa', 'Software', 'Integral', '19988880006', 'felipe@assistencia.com'),
(7, 'Ricardo Santos', 'Redes', 'Manhã', '19988880007', 'ricardo@assistencia.com'),
(8, 'Diego Oliveira', 'Impressoras', 'Tarde', '19988880008', 'diego@assistencia.com'),
(9, 'Gabriel Rocha', 'Eletronica', 'Integral', '19988880009', 'gabriel@assistencia.com'),
(10, 'Thiago Martins', 'Hardware', 'Manhã', '19988880010', 'thiago@assistencia.com');

SELECT * FROM TECNICO;

INSERT INTO EQUIPAMENTO (id_equipamento, tipo_equipamento, marca, modelo, numero_serie, data_aquisicao, id_cliente) VALUES
(1, 'Notebook', 'Dell', 'Inspiron 15', 100001, '2024-01-10', 1),
(2, 'Notebook', 'HP', 'Pavilion 15', 100002, '2023-05-20', 2),
(3, 'Notebook', 'Lenovo', 'IdeaPad 3', 100003, '2024-03-15', 3),
(4, 'Notebook', 'Samsung', 'Galaxy Book', 100004, '2023-08-12', 4),
(5, 'Notebook', 'Acer', 'Aspire 5', 100005, '2024-02-18', 5),
(6, 'Notebook', 'Asus', 'VivoBook 15', 100006, '2023-11-25', 6),
(7, 'Notebook', 'Dell', 'Latitude 3420', 100007, '2024-04-05', 7),
(8, 'Notebook', 'HP', 'EliteBook 840', 100008, '2023-09-17', 8),
(9, 'Notebook', 'Lenovo', 'ThinkPad E14', 100009, '2024-06-22', 9),
(10, 'Notebook', 'Acer', 'Nitro 5', 100010, '2024-07-30', 10);

SELECT * FROM EQUIPAMENTO;

INSERT INTO CHAMADO (id_chamado, descricao_defeito, prioridade, data_abertura, data_fechamento, status_defeito, id_equipamento, id_tecnico) VALUES
(1, 'Computador nao liga', 'Alta', '2026-01-05 09:00:00', NULL, 'ATIVO', 1, 1),
(2, 'Problema no sistema operacional', 'Média', '2026-01-06 10:30:00', '2026-01-08 15:00:00', 'INATIVO', 2, 2),
(3, 'Falha na conexao de rede', 'Alta', '2026-01-07 11:00:00', NULL, 'ATIVO', 3, 3),
(4, 'Tela apresentando defeitos', 'Baixa', '2026-01-08 13:00:00', '2026-01-10 14:00:00', 'INATIVO', 4, 4),
(5, 'Teclado nao funciona', 'Média', '2026-01-09 08:30:00', NULL, 'ATIVO', 5, 5),
(6, 'Sistema muito lento', 'Baixa', '2026-01-10 14:00:00', '2026-01-12 16:00:00', 'INATIVO', 6, 6),
(7, 'Problema na placa de rede', 'Alta', '2026-01-11 09:30:00', NULL, 'ATIVO', 7, 7),
(8, 'Impressao com falhas', 'Média', '2026-01-12 10:00:00', '2026-01-14 11:00:00', 'INATIVO', 8, 8),
(9, 'Superaquecimento do equipamento', 'Alta', '2026-01-13 15:00:00', NULL, 'ATIVO', 9, 9),
(10, 'Defeito na placa mae', 'Alta', '2026-01-14 16:00:00', '2026-01-16 12:00:00', 'INATIVO', 10, 10);

SELECT * FROM CHAMADO;

INSERT INTO PECA (id_peca, codigo_peca, nome_peca, fabricante, valor_unitario, quantidade_estoque) VALUES
(1, 'PEC-001', 'Memoria RAM 8GB', 'Kingston', 180, 20),
(2, 'PEC-002', 'SSD 480GB', 'Kingston', 250, 15),
(3, 'PEC-003', 'HD 1TB', 'Seagate', 320, 10),
(4, 'PEC-004', 'Teclado para notebook', 'Dell', 150, 12),
(5, 'PEC-005', 'Tela LCD 15 polegadas', 'Samsung', 450, 8),
(6, 'PEC-006', 'Fonte de alimentacao', 'Corsair', 220, 18),
(7, 'PEC-007', 'Placa de rede', 'TP-Link', 90, 25),
(8, 'PEC-008', 'Cooler para notebook', 'Cooler Master', 110, 14),
(9, 'PEC-009', 'Bateria para notebook', 'Acer', 280, 9),
(10, 'PEC-010', 'Placa mae', 'Asus', 650, 5);

SELECT * FROM PECA;

INSERT INTO CHAMADO_PECA (id_chamado, id_peca) VALUES
(1, 6),
(2, 2),
(3, 7),
(4, 5),
(5, 4),
(6, 1),
(7, 7),
(8, 3),
(9, 8),
(10, 10);

SELECT * FROM CHAMADO_PECA;

CREATE INDEX IDX_CHAMADO_SITUACAO_DATA ON CHAMADO (status_defeito, data_abertura);

CREATE INDEX IDX_PECA_ESTOQUE ON PECA (quantidade_estoque);

CREATE OR REPLACE VIEW vw_chamados_ativos AS
SELECT
    id_chamado,
    descricao_defeito,
    prioridade,
    data_abertura
FROM CHAMADO
WHERE status_defeito = 'ATIVO';

SELECT * FROM vw_chamados_ativos;

CREATE OR REPLACE VIEW vw_pecas_estoque_baixo AS
SELECT
    id_peca,
    nome_peca,
    quantidade_estoque
FROM PECA
WHERE quantidade_estoque <= 10;

SELECT * FROM vw_pecas_estoque_baixo;

DELETE FROM CHAMADO_PECA;

DELETE FROM CHAMADO;

DELETE FROM EQUIPAMENTO;

DELETE FROM PECA;

DELETE FROM TECNICO;

DELETE FROM CLIENTE;

SELECT * FROM CLIENTE;
SELECT * FROM TECNICO;



SELECT * FROM EQUIPAMENTO;
SELECT * FROM CHAMADO;

SELECT * FROM PECA;
SELECT * FROM CHAMADO_PECA;

