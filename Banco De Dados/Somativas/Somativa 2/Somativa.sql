-- Active: 1789646752736@@127.0.0.1@3306@biblioteca_som2_luis
-- 1

CREATE DATABASE IF NOT EXISTS biblioteca_som2_luis;

USE biblioteca_som2_luis;

DROP DATABASE biblioteca_som2_luis;


-- 2
CREATE TABLE Usuario (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  telefone VARCHAR(20),
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);



-- 3
CREATE TABLE Livro (
  id_livro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  autor VARCHAR(120) NOT NULL,
  isbn CHAR(13) NOT NULL UNIQUE,
  ano_publicacao INT,
  quantidade_disponivel INT DEFAULT 0.00 CHECK (quantidade_disponivel >= 0)
);


-- 4
CREATE TABLE Emprestimo (
  id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
  data_empresitmo DATETIME DEFAULT CURRENT_TIMESTAMP,
  data_prevista DATE NOT NULL,
  data_devolucao DATE,
  status_emprestimo VARCHAR(20) DEFAULT 'ativo' CHECK (status_emprestimo IN ('ativo', 'Desativo')),
  id_usuario INT NOT NULL,
  id_livro INT NOT NULL,
  CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
  CONSTRAINT FK_id_livro FOREIGN KEY (id_livro) REFERENCES Livro (id_livro) 
);






-- 5
ALTER TABLE LIVRO ADD editora VARCHAR(100);

-- 6
INSERT INTO Usuario (nome, email, telefone, ativo) VALUES 
('Luis Felipe', 'Luis@gmail.com', '19998359331', TRUE), 
('Rennan Campos', 'Rennan@gmail.com', '19990313345', TRUE),
('Vitoria Rocco', 'Rocco@gmail.com', '19997461700', TRUE),
('Roberto Carlos', 'Robertao@gmail.com', NULL, TRUE);

-- 7
INSERT INTO Livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES ('Dom Casmurro', 'Machado de Assis', 9788501115591, 1899, 10),
('1984', 'George Orwell', 9788535914849, 1949, 12),
('O Alquimista', 'Paulo Coelho', 9788575427583, 1988, 30),
('O Hobbit', 'JRR TOLKIEN', 9788595084742, 1937, 1),
('Duna', 'Frank Herbert', 9788576573005, 1949, 2),
('O Guia do Mochileiro das Galáxias', 'Douglas Adams', 9788598078175, 2020, 180);

select * from livro;


-- 8
INSERT INTO Emprestimo (data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES 
('20-01-20', '2026-01-19', 'Desativo', 3, 1),
('2026-01-29', '2026-01-13', 'Desativo', 3, 1),
('2026-01-14', NULL, 'ativo', 3, 1);

-- 9
SELECT * from usuario

UPDATE usuario
SET telefone = '193913919'
WHERE id_usuario = 4;

-- 10
UPDATE Livro
SET quantidade_disponivel = CASE 
  WHEN ano_publicacao >= 2020 THEN quantidade_disponivel + 2
  ELSE  quantidade_disponivel
END

-- 11
-- o usuario 5 nao tem emprestimo
INSERT INTO Usuario (nome, email, telefone, ativo) VALUES 
('Otavio', 'Otavio@gmail.com', '199351312', TRUE);

DELETE FROM usuario WHERE id_usuario = 5;

-- o usuario 3 tem 3 emprestimos
DELETE FROM usuario WHERE id_usuario = 3;
-- erro que deu: Error: Cannot delete or update a parent row: a foreign key constraint fails (biblioteca_som2_luis.emprestimo, CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario))
-- O porque do erro: Ele não pode excluir um usuário que está vinculado à um empréstimo, já que o empréstimo ainda é ativo (não foi excluído) ele necessita
-- do id daquele usuário então ele não pode ser excluído, já que alguém possuí uma dependência nele.

-- 12
SELECT titulo, autor, quantidade_disponivel FROM Livro;

-- 13
SELECT titulo, quantidade_disponivel FROM livro WHERE quantidade_disponivel >= 2 ORDER BY quantidade_disponivel DESC LIMIT 200; 

-- 14
SELECT titulo, id_livro FROM livro WHERE titulo LIKE 'Duna%';

-- 15
SELECT titulo, ano_publicacao FROM livro WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16
-- quantidade de livros
SELECT COUNT (*) AS total_livros, 
AVG(quantidade_disponivel) AS media_disponivel,
SUM(quantidade_disponivel) AS soma_livros,
MIN(quantidade_disponivel) AS menor_quantidade,
MAX(quantidade_disponivel) AS maior_quantidade
FROM Livro;

-- 17


SELECT E.id_emprestimo, U.id_usuario, E.id_livro, E.data_prevista, E.status_emprestimo FROM emprestimo as E INNER JOIN usuario AS U ON E.id_usuario = U.id_usuario;

-- 18
SELECT status_emprestimo, COUNT(*) AS Quantidade FROM Emprestimo GROUP BY status_emprestimo;

-- 19
SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade 
FROM Usuario AS U 
INNER JOIN Emprestimo AS E ON E.id_usuario = U.id_usuario 
GROUP BY U.id_usuario, U.nome ORDER BY Quantidade DESC;

-- 20
SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade
FROM Usuario AS U 
LEFT JOIN Emprestimo AS E ON E.id_usuario = U.id_usuario 
GROUP BY U.id_usuario, U.nome;

--21 
START TRANSACTION;

INSERT INTO Emprestimo (data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES 
('20-02-10', '2026-02-10', 'Desativo', 4, 6)

UPDATE livro
SET quantidade_disponivel = 1
WHERE id_livro = 6;

SELECT * FROM livro;

COMMIT;

-- 22
START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 10000
WHERE id_livro = 5;

SELECT * FROM livro;

ROLLBACK;

SELECT * FROM livro;

-- 23
START TRANSACTION;

UPDATE livro
set quantidade_disponivel = 180
WHERE id_livro = 3;

SELECT * FROM livro;

SAVEPOINT savelivros;

UPDATE livro
set quantidade_disponivel = 300
WHERE id_livro = 3;

SELECT * FROM livro;

ROLLBACK TO SAVEPOINT savelivros;

SELECT * FROM livro;

COMMIT;

-- 24
START TRANSACTION

SELECT * FROM emprestimo;

UPDATE emprestimo
SET status_emprestimo = 'Desativo',
data_devolucao = '2026-10-22'
WHERE id_emprestimo = 3;

UPDATE livro 
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_livro = 1;

COMMIT;

SELECT * FROM emprestimo;

-- 25
-- Cadastrar dois usuários com o mesmo e-mail.
-- Resposta: Deve possuir uma regra de aplicação para impedir de cadastrar dois email iguais (Unique)


-- Cadastrar dois livros com o mesmo ISBN.
-- Resposta: Não deve ser possível efetuar, já que não pode pussir dois livros com o mesmo ISBN (Unique)

-- Permitir quantidade disponível negativa.
-- resposta: Não deve ser possível efetuar isto, podemos utilizar uma regra de aplicação para impedir (CHECK)

-- Criar empréstimo para usuário inexistente.
-- resposta: Não é possível porque ele precisa se Referenciar a um ID de Usuário, e se não existir o ID não tem como.

-- Excluir livro com histórico de empréstimos.
-- resposta: Não é possível porque ele está sendo utilizado e referenciado por empréstimos, a FK dara erro. (Constraint)

-- Gravar empréstimo e falhar na redução do estoque.
-- resposta: É uma transação porque você grava, verifica testa e aprova ou rejeita com Rollback, Commit, Start Transaction ou Save Point;

-- Emprestar livro cuja quantidade disponível seja zero.
-- resposta: Não deve ser possível deve existir uma Regra da aplicação que não permita, porque não deve ser possível emprestar um livro que não está disponível.