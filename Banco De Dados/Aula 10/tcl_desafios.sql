-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): Luis Felipe Dalfré Formigari
-- Regra: valide sempre antes de COMMIT.

USE SMARTCOFFEE_DML_LUIS;

-- 01. Consulte produto 2 e seu preço.

SELECT nome, preco FROM Produto Where ID_PRODUTO = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.

START TRANSACTION;

UPDATE PRODUTO SET PRECO = PRECO + 3.00 WHERE ID_PRODUTO = 2;




-- 03. Consulte dentro da transação.

SELECT nome, preco FROM Produto Where ID_PRODUTO = 2;

-- 04. ROLLBACK.

ROLLBACK;

-- 05. Consulte e comprove retorno.

SELECT nome, preco FROM Produto Where ID_PRODUTO = 2; -- Funcionou o valor saiu de 8.69 para 11.69.

-- 06. Repita a alteração e finalize com COMMIT.

START TRANSACTION;

UPDATE PRODUTO SET PRECO = PRECO + 3.00 WHERE ID_PRODUTO = 2;

SELECT nome, preco FROM Produto Where ID_PRODUTO = 2;

COMMIT;

-- 07. START TRANSACTION e aumente produto 3 em 10%.

START TRANSACTION;

UPDATE PRODUTO SET PRECO = PRECO * 1.10 WHERE ID_PRODUTO = 3;

-- 08. SAVEPOINT ajuste_produto3.

SAVEPOINT ajuste_produto3;

-- 09. Aumente produto 4 em 50%.

UPDATE PRODUTO SET PRECO = PRECO * 1.50 WHERE ID_PRODUTO = 4;

-- 10. Consulte os dois.

SELECT nome, preco FROM Produto Where ID_PRODUTO = 3;
SELECT nome, preco FROM Produto Where ID_PRODUTO = 4;

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.

ROLLBACK TO SAVEPOINT ajuste_produto3;

-- 12. COMMIT e explique em comentário qual alteração permaneceu.

COMMIT;

-- A alteração que permaneceu foi a do produto 3 já que o SavePoint foi efetuado após a alteração do produto 3, permitindo que aquilo continue.

-- 13. START TRANSACTION.

START TRANSACTION;

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES (NOW(), 'ABERTO', 0.00, 24);

SET @novo_pedido = LAST_INSERT_ID();

-- 15. Insira dois itens válidos.



-- 16. Registre pagamento válido.

-- 17. Consulte pedido, itens e pagamento.

-- 18. COMMIT.

-- 19. START TRANSACTION e crie pedido para cliente 2.

-- 20. Salve o id em @pedido_com_erro.

-- 21. Tente inserir item com id_produto inexistente.

-- 22. Após observar a FK, ROLLBACK.

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.