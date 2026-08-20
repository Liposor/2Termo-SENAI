-- 1 COMANDO PARA CRIAR BANCO DE DADOS
create database Clinica_Medica_Luis;

-- 1.2 COMANDO PARA CRIAR BANCO DE DADOS CASO (IF) NÃO (NOT) EXISTA (EXISTS)
CREATE DATABASE IF NOT EXISTS Clinica_Medica_Luis;

-- 1.3 Comando para apagar o banco de dados
drop database Clinica_Medica_Luis; 

-- 2 ATIVAR O BANCO DE DADOS 
USE Clinica_Medica_Luis;


-- 3 Criação de Tabelas

-- DICIONARIO DE CIRAÇÃO DE TABELAS: 

-- EX: Create Table NOME_DA_TABELA ()
-- 3.2 Criação de Tabelas CASO (IF) NÃO (NOT) EXISTA (EXISTS)
-- EX: CREATE TABLE IF NOT EXISTS NOME_DA_TABELA ()

-- 3.3 Caso de esquecimento de um campo ao adicionamento da tabela utilizar:
-- ALTER TABLE NOME_TABELA ADD NOME_CAMPO VARCHAR(100); <-- NOTA: repare que está "VARCHAR(100)", você pode colocar os dados que quiser.

-- 3.4 Caso deseje Alterar o tipo de dado
-- ALTER TABLE NOME_TABELA MODIFY NOME_CAMPO INT;  <-- NOTA: repare que está "INT", você pode colocar os dados que quiser.

-- 3.5 Caso renomear uma tablea
-- RENAME TABLE NOME_TABELA TO NOME_TABELA_NOVO; 

-- 3.6 Caso queira apagar dados de uma tabela
-- TRUNCATE TABLE NOME_TABELA;

-- 3.7 Caso queira apagar coluna ou atributo
-- ALTER TABLE NOME_TABELA DROP COLUMN NOME_CAMPO;

-- 3.8 Inserindo dados na tabela
-- INSERT INTO NOME_TABELA (CAMPO1, CAMPO2, CAMPO3, CAMPO4, CAMPO5);
-- VALUES (1, "FALA", "DADO2", 39.00);


-- Tabela de Atendimento.
CREATE TABLE  ATENDIMENTO (
ID_ATENDIMENTO INT AUTO_INCREMENT PRIMARY KEY,
STATUS_ATENDIMENTO ENUM ("ATIVO", "DESATIVO") NOT NULL DEFAULT "ATIVO",
TIPO_ATENDIMENTO ENUM ("SIMPLES", "CRITICO") NOT NULL DEFAULT "Simples",
SINTOMAS VARCHAR(250) NOT NULL,
OBSERVACOES VARCHAR(250),
DIAGNOSTICOS TEXT NOT NULL,
DATA_HORA TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- APAGAR A TABELA
drop table ATENDIMENTO;

insert into atendimento (ID_ATENDIMENTO, STATUS_ATENDIMENTO, TIPO_ATENDIMENTO, SINTOMAS, OBSERVACOES, DIAGNOSTICOS)
VALUES (1, 'ATIVO','CRITICO', 'Fortes dores na perna e fratura identicada', 'Paciente não sente os dedos do pé', 'Fratura no osso principal da perna');

SELECT * FROM atendimento;



-- Tabela de Paciente
CREATE TABLE IF NOT EXISTS Paciente (
ID_CLIENTES INT AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
CPF VARCHAR(14) NOT NULL UNIQUE,
EMAIL VARCHAR(60) NOT NULL, 
IDADE INT NOT NULL,
TELEFONE VARCHAR(14),
DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
NACIONALIDADE VARCHAR(50) NOT NULL,
CONVENIO enum("SIM","NAO") default "NAO"
);
-- APAGAR A TABELA
drop table PACIENTE;

insert into Paciente (ID_CLIENTES, NOME, CPF, EMAIL, IDADE, TELEFONE, NACIONALIDADE, CONVENIO)
VALUES (1, 'luis', '540315','email@gmail.com', 16, 9983, 'Brasileiro', Default);

SELECT * FROM Paciente;


-- Tabela de Medico
CREATE TABLE IF NOT EXISTS Medico (
ID_MEDICO INT AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
CPF VARCHAR(14) NOT NULL UNIQUE,
CRM VARCHAR(30) NOT NULL UNIQUE,
TURNO VARCHAR(14) NOT NULL,
ESPECIALIDADE VARCHAR(30) NOT NULL,
EMAIL VARCHAR(60) NOT NULL, 
IDADE INT NOT NULL,
TELEFONE VARCHAR(14),
DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
NACIONALIDADE VARCHAR(50) NOT NULL
);
-- APAGAR A TABELA
drop table MEDICO;

insert into Medico (ID_MEDICO, NOME, CPF, CRM , TURNO, ESPECIALIDADE, EMAIL, IDADE, TELEFONE, NACIONALIDADE)
VALUES (1, 'Bruno', '309031', '30-3901', 'manha', 'Python', 'email@gmail.com', '43', 3123036, 'Brasileiro');

insert into Medico (ID_MEDICO, NOME, CPF, CRM , TURNO, ESPECIALIDADE, EMAIL, IDADE, TELEFONE, NACIONALIDADE)
VALUES (2, 'Nicolas', '1283832', '30-7943', 'Tarde', 'Oftalmo', 'nicolas@gmail.com', '19', 3954233-1, 'Brasileiro'),
(3, 'Regida', '99301', '30-5431', 'Dia inteiro', 'Cardiologista', 'regida@gmail.com', '21', 99301-5031, 'Argentino'),
(4, 'Lucas', '309482', '21-3841', 'Noturno', 'Optologista', 'lucas@gmail.com', '38', 30593-1312, 'Brasileiro'),
(5, 'Kaliane', '99910', '01-3901', 'manha', 'Dermatologista', 'kaliane@gmail.com', '61', 3946-32149, 'Brasileiro');

TRUNCATE TABLE Medico;

SELECT * FROM Medico;

-- Tabela Ficha Medica
CREATE TABLE Ficha_Medica (
ID_FICHA INT AUTO_INCREMENT PRIMARY KEY,
TIPO_SANGUINEO ENUM ("A+", "A-", "B+", "AB+", "AB-", "O+", "O-") NOT NULL,
OBSERVACOES_GERAIS VARCHAR(250),
ALERGIAS VARCHAR(50) NOT NULL,
MEDICAMENTOS_CONTINUOS VARCHAR(30) NOT NULL,
DOENCAS_PREEXISTENTES VARCHAR(40) NOT NULL,
CONVENIO ENUM ("SIM", "NAO") NOT NULL default ("NAO")
);
-- APAGAR A TABELA
drop table FICHA_MEDICA;

insert into Ficha_Medica (ID_FICHA, TIPO_SANGUINEO, OBSERVACOES_GERAIS, ALERGIAS, MEDICAMENTOS_CONTINUOS, DOENCAS_PREEXISTENTES, CONVENIO)
VALUES (1, 'A+', 'Apendicite Retirada','Nenhuma', 'Nenhum', 'Nenhuma', 'SIM');

insert into Ficha_Medica (ID_FICHA, TIPO_SANGUINEO, OBSERVACOES_GERAIS, ALERGIAS, MEDICAMENTOS_CONTINUOS, DOENCAS_PREEXISTENTES, CONVENIO)
VALUES (2, 'A-', 'Perdeu um olho','Alergia a Ferro', 'Nenhum', 'Cegueira', 'SIM'),
 (3, 'O+', 'Nada','Nenhuma', 'PARACETAMOL CONTINUO', 'DST', 'NAO'),
 (4, 'O-', 'Perdeu um braço','Nenhuma', 'Nenhum', 'Nenhuma', 'SIM'),
 (5, 'A+', 'Sem 1 rim','Nenhuma', 'Nenhum', 'Doença de King', 'SIM');



SELECT * FROM FICHA_MEDICA;


-- TABELA FUNCIONARIO
CREATE TABLE FUNCIONARIO (
ID_FUNCIONARIO INT AUTO_INCREMENT PRIMARY KEY,
CARGO VARCHAR(30) NOT NULL,
CPF VARCHAR(14) NOT NULL UNIQUE,
NOME_FUNCIONARIO VARCHAR(50) NOT NULL,
TURNO VARCHAR(14) NOT NULL,
EMAIL VARCHAR(60) NOT NULL,
DATA_ADMISSAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- APAGAR A TABELA
drop table FUNCIONARIO;

insert into FUNCIONARIO (ID_FUNCIONARIO, CARGO, CPF, NOME_FUNCIONARIO, TURNO, EMAIL)
VALUES (1, 'Enfermeiro', '994201','Julio', 'Noite', 'julio@gmail.com');

SELECT * FROM FUNCIONARIO;



-- Tabela Medicamentos	
CREATE TABLE MEDICAMENTOS (
ID_MEDICAMENTO INT AUTO_INCREMENT PRIMARY KEY,
FICHA_MEDICA VARCHAR(250) NOT NULL,
DATA_EMISSAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
INSTRUCAO VARCHAR(90) NOT NULL,
OBSERVACOES TEXT NOT NULL,
TIPO_MEDICAMENTO VARCHAR(30) NOT NULL,
DOSE decimal(5, 2) not null default 0.00
);



-- APAGAR A TABELA
drop table MEDICAMENTOS;


insert into medicamentos (ID_MEDICAMENTO, FICHA_MEDICA, INSTRUCAO, OBSERVACOES, TIPO_MEDICAMENTO, DOSE)
VALUES (1, 'Cancer','Tomar de 3 em 3 horas', 'Cuidado,vai passar mal', 'antibiotico', 18.0);

insert into medicamentos (ID_MEDICAMENTO, FICHA_MEDICA, INSTRUCAO, OBSERVACOES, TIPO_MEDICAMENTO, DOSE)
VALUES (2, 'Gripe','Tomar remedio diariamente de 12 em 12 horas', 'Paciente diz estar com fortes dores de ouvido, deve ficar de repouso por pelo menos 5 dias', 'Paracetamol', 3.0),
(3, 'Perna Quebrada','Tomar remedio diariamente de 6 em 6 horas', 'Paciente fraturou sua perna, indica pancadas nos pés', 'Dipirona', 110.0);

-- CONSULTAR DADOS DA TABELA
SELECT * FROM MEDICAMENTOS;






-- DICIONARIO: 
-- ENUM: Serve para indicar possiveis respostas ou respostas obrigatorias a aquele campo. 
-- VARCHAR: Ele indica um espaço para colocar a quantidade de caracteres de limite, com uma capacidade de 64b
-- INT: O INT ele é um espaço onde ele me permite escrever numeros
-- NOT NULL: Ele pede para não deixar vazio aquele espaço
-- TIMESTAMP DEFAULT CURRENT_TIMESTAMP: Ele indica a hora, dia e ano atual que é colocada naquele campo
-- DEFAULT: Indica uma resposta padrão para aquele campo
