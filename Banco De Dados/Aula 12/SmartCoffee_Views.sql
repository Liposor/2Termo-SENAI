-- AULA 12 - VIEWS: CRIANDO VISOES NO BANCO DE DADOS






-- 1. Selecionando o banco de dados
USE smartcoffee;

-- 2. Criando uma VIEW com os produtos ativos
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT
    id_produto,
    nome,
    preco
FROM produto
WHERE ativo = TRUE;




-- 3. Consultando produtos ativos com preco maior que R$ 10,00
SELECT *
FROM vw_produtos_ativos
WHERE preco > 10.00;

-- 4. Listando todas as VIEWs do banco
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

-- 5. Exibindo a definicao da VIEW vw_produtos_ativos
SHOW CREATE VIEW vw_produtos_ativos;

-- 6. Criando uma VIEW com INNER JOIN entre produto e categoria
CREATE OR REPLACE VIEW vw_produtos_categorias AS
SELECT
    p.id_produto,
    p.nome AS produto,
    c.nome AS categoria,
    p.preco
FROM produto AS p
INNER JOIN categoria AS c
    ON c.id_categoria = p.id_categoria;




SELECT *
FROM vw_produtos_categorias
ORDER BY categoria, produto;

-- 7. Criando uma VIEW com os pedidos e seus clientes
CREATE OR REPLACE VIEW vw_pedidos_clientes AS
SELECT
    p.id_pedido,
    p.data_pedido,
    c.id_cliente,
    c.nome AS cliente,
    p.status_pedido
FROM pedido AS p
INNER JOIN cliente AS c
    ON c.id_cliente = p.id_cliente;

-- 8. Consultando somente os pedidos finalizados
SELECT *
FROM vw_pedidos_clientes
WHERE status_pedido = 'FINALIZADO';

-- 9. Criando uma VIEW com os itens dos pedidos e o subtotal
CREATE OR REPLACE VIEW vw_itens_pedidos AS
SELECT
    pe.id_pedido,
    pe.data_pedido,
    c.nome AS cliente,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.quantidade * ip.preco_unitario AS subtotal
FROM pedido AS pe
INNER JOIN cliente AS c
    ON c.id_cliente = pe.id_cliente
INNER JOIN item_pedido AS ip

    ON ip.id_pedido = pe.id_pedido
INNER JOIN produto AS pr


    ON pr.id_produto = ip.id_produto;

SELECT *
FROM vw_itens_pedidos
WHERE id_pedido = 1;

-- 10. Criando uma VIEW com o total vendido por produto
CREATE OR REPLACE VIEW vw_vendas_por_produto AS
SELECT
    pr.id_produto,
    pr.nome AS produto,
    SUM(ip.quantidade) AS unidades_vendidas,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produto AS pr

INNER JOIN item_pedido AS ip
    ON ip.id_produto = pr.id_produto
INNER JOIN pedido AS pe
    ON pe.id_pedido = ip.id_pedido
WHERE pe.status_pedido = 'FINALIZADO'
GROUP BY pr.id_produto, pr.nome;



















-- 11. Listando os produtos pelo maior faturamento
SELECT *
FROM vw_vendas_por_produto
ORDER BY faturamento DESC;

-- 12. Criando uma VIEW com todos os clientes e a quantidade de pedidos
CREATE OR REPLACE VIEW vw_clientes_resumo AS
SELECT
    c.id_cliente,
    c.nome AS cliente,
    COUNT(p.id_pedido) AS quantidade_pedidos
FROM cliente AS c
LEFT JOIN pedido AS p
    ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- 13. Consultando clientes que nunca realizaram pedidos
SELECT *
FROM vw_clientes_resumo
WHERE quantidade_pedidos = 0;

-- 14. Usando CREATE OR REPLACE para acrescentar id_categoria na VIEW
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT
    id_produto,
    nome,
    preco,
    id_categoria
FROM produto
WHERE ativo = TRUE;











-- Conferindo a alteracao
SELECT *
FROM vw_produtos_ativos;

-- 15. Criando uma VIEW simples para testar uma atualizacao
CREATE OR REPLACE VIEW vw_clientes_edicao AS
SELECT
    id_cliente,
    nome,
    email
FROM cliente;

-- A VIEW simples permite atualizar campos da tabela de origem.
-- O UPDATE abaixo e revertido pelo ROLLBACK para nao deixar alteracao permanente.
START TRANSACTION;

UPDATE vw_clientes_edicao
SET nome = 'Nome de Teste'
WHERE id_cliente = 1;

-- Conferindo o resultado antes de desfazer a alteracao
SELECT *
FROM vw_clientes_edicao
WHERE id_cliente = 1;

ROLLBACK;

-- 16. Criando uma VIEW de produtos ativos com WITH CHECK OPTION
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT
    id_produto,
    nome,
    preco,
    ativo,
    id_categoria
FROM produto
WHERE ativo = TRUE
WITH CHECK OPTION;


SELECT *
FROM vw_produtos_ativos;



-- 17. Removendo uma VIEW de teste
DROP VIEW IF EXISTS vw_clientes_edicao;

-- 18. Consultas para conferir as VIEWs criadas
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

-- 19. Exibindo a definicao de uma VIEW
SHOW CREATE VIEW vw_produtos_categorias;

-- 20. Exemplo de ALTER VIEW
ALTER VIEW vw_produtos_ativos AS
SELECT
    id_produto,
    nome,
    preco,
    ativo,
    id_categoria
FROM produto
WHERE ativo = TRUE
WITH CHECK OPTION;

-- 21. Exemplo de DROP VIEW
DROP VIEW IF EXISTS vw_produtos_ativos;
