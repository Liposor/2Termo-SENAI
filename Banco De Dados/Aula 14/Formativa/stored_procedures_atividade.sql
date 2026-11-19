USE smartcoffee_procedures;

-- AULA 13 - ATIVIDADE STORED PROCEDURES
-- Aluno: LUIS FELIPE DALFRÉ FORMIGARI
-- Turma: 2DEVIS B

-- 1. listar_clientes_ativos()

-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))

-- 3. produtos_por_categoria(IN p_id_categoria INT)

-- 4. total_clientes(OUT p_total INT)

-- 5. consultar_estoque(IN p_id_produto INT) usando variável local

-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL

-- 7. cadastrar_cliente(...) com três parâmetros IN

-- 8. alterar_preco(...) impedindo valor <= 0

-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)

-- 10. devolver ID com LAST_INSERT_ID()

-- 11. adicionar_item_pedido(...) buscando o preço atual

-- 12. Faça uma chamada inválida e explique o resultado.

-- 13. Use SHOW CREATE PROCEDURE.

-- 14. Remova uma procedure com DROP PROCEDURE IF EXISTS e recrie-a.

-- DESAFIO FINAL:
-- Crie uma procedure de negócio com:
-- - pelo menos 2 parâmetros;
-- - variável local;
-- - IF;
-- - pelo menos uma alteração no banco.

-- 1

DELIMITER $$

CREATE PROCEDURE LISTAR_CLIENTE_ATIVOS()
BEGIN
  SELECT NOME AS NOME
  FROM CLIENTE
  WHERE ATIVO = TRUE
  ORDER BY NOME;
END $$

DROP PROCEDURE `LISTAR_CLIENTE_ATIVOS`

CALL `LISTAR_CLIENTE_ATIVOS`

-- 2

DELIMITER $$

CREATE PROCEDURE buscar_produto_por_nome(IN p_busca VARCHAR(100))
BEGIN
  SELECT NOME AS NOME
  FROM produto
  WHERE nome = p_busca
  ORDER BY NOME;
END $$

DROP PROCEDURE buscar_produto_por_nome

CALL buscar_produto_por_nome("Suco de Laranja");


-- 3

DELIMITER $$

CREATE PROCEDURE produtos_por_categoria(IN p_id_categoria INT)
BEGIN
  SELECT NOME AS NOME
  FROM PRODUTO
  WHERE ID_CATEGORIA = p_id_categoria
  ORDER BY NOME;
END $$

DROP PROCEDURE produtos_por_categoria;

CALL produtos_por_categoria(1);

-- 4

DELIMITER $$
CREATE PROCEDURE total_clientes(OUT p_total INT)
BEGIN
    SELECT COUNT(*)
    INTO P_TOTAL
    FROM CLIENTE
    WHERE ATIVO = TRUE;
END $$

CALL total_clientes(@Total);

SELECT @Total

-- 5

DELIMITER $$
CREATE PROCEDURE consultar_estoque(IN p_id_produto INT)
BEGIN 
  SELECT quantidade AS quantidade 
  FROM ESTOQUE
  WHERE ID_PRODUTO = P_ID_PRODUTO
  ORDER BY quantidade;
END $$

@ID_PRODUTO22 = 1;
DROP PROCEDURE CONSULTAR_ESTOQUE;

CALL consultar_estoque(1)

SELECT * FROM estoque


-- 6

DELIMITER $$
CREATE PROCEDURE consultar_estoque2(IN p_id_produto INT)
BEGIN 
  DECLARE V_QUANTIDADE INT;
  SELECT quantidade AS quantidade 
  into v_quantidade
  FROM ESTOQUE
  WHERE ID_PRODUTO = P_ID_PRODUTO
  ORDER BY quantidade;

    IF v_quantidade = 0 THEN
        SELECT 'SEM ESTOQUE' AS SITUAÇÃO;
    ELSEIF v_quantidade <= 5 THEN
        SELECT 'ESTOQUE BAIXO' AS SITUAÇÃO;
    ELSE
        SELECT 'ESTOQUE NORMAL' AS SITUAÇÃO;
    END IF;
END $$

CALL consultar_estoque2(1)

-- 7

DELIMITER $$

CREATE PROCEDURE CADASTRAR_CLIENTE (
    IN P_NOME VARCHAR (100),
    IN P_EMAIL VARCHAR (50),
    IN P_TELEFONE VARCHAR (20)
)
BEGIN
    INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO)
    VALUES (P_NOME, P_EMAIL, P_TELEFONE, TRUE);
END $$;


CALL CADASTRAR_CLIENTE ( 'OTAVIO CORREIA PALMA DA SILVA', 'OOTAVIOCORREIA@GMAIL.COM', '17561700' );

SELECT * FROM cliente;

-- 8

DELIMITER $$

CREATE PROCEDURE alterar_preco (
    IN P_ID_PRODUTO INT,
    IN P_NOVO_PRECO DECIMAL(10,2)
)
BEGIN
    IF P_NOVO_PRECO > 0 THEN

        UPDATE PRODUTO
        SET PRECO = P_NOVO_PRECO
        WHERE id_produto = P_ID_PRODUTO;

        SELECT 'PREÇO ATUALIZADO' AS MENSAGEM;

    ELSE

        SELECT 'PREÇO INVÁLIDO' AS MENSAGEM;

    END IF;
END $$;

DELIMITER ;

DROP PROCEDURE alterar_preco

UPDATE PRODUTO SET PRECO = 10 WHERE ID_PRODUTO = 1;

CALL alterar_preco(1, 30);

SELECT * FROM PRODUTO;

-- 9
DELIMITER $$
CREATE PROCEDURE REGISTRAR_PEDIDO (
    IN P_ID_CLIENTE INT,
    OUT P_ID_PEDIDO INT
)
BEGIN
    START TRANSACTION;
    INSERT INTO PEDIDO (
        ID_CLIENTE,
        DATA_PEDIDO,
        STATUS_PEDIDO
    )
    VALUES (
        P_ID_CLIENTE, NOW(), 'ABERTO'
    );

    SET P_ID_PEDIDO = LAST_INSERT_ID();
    COMMIT;
END $$;

CALL REGISTRAR_PEDIDO(1, @PEDIDO);

SELECT @PEDIDO