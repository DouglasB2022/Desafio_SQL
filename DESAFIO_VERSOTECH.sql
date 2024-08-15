
//TAREFA 1
SELECT vendedores.ID_VENDEDOR AS id, vendedores.NOME AS nome, vendedores.SALARIO AS salario
FROM vendedores 
WHERE vendedores.INATIVO = false ORDER BY vendedores.NOME ASC;

//TAREFA2
SELECT vendedores.ID_VENDEDOR AS id, vendedores.NOME AS nome, vendedores.SALARIO AS salario
FROM vendedores 
WHERE vendedores.salario > (SELECT AVG(salario) FROM vendedores )
ORDER BY salario DESC;

//TAREFA 3
SELECT clientes.ID_CLIENTE AS id, clientes.RAZAO_SOCIAL AS razao_social, SUM(pedido.VALOR_TOTAL) AS total
FROM clientes INNER JOIN pedido 
ON pedido.ID_CLIENTE = clientes.ID_CLIENTE
GROUP BY clientes.ID_CLIENTE 
ORDER BY clientes.ID_CLIENTE desc ;

// TAREFA 4
SELECT
    pedido.ID_PEDIDO AS id,
    pedido.VALOR_TOTAL AS valor,
    pedido.DATA_EMISSAO AS data,
    CASE
        WHEN data_cancelamento IS NOT NULL THEN 'CANCELADO'
        WHEN data_faturamento IS NOT NULL THEN 'FATURADO'
        ELSE 'PENDENTE'
    END AS situacao
FROM pedido;

//TAREFA 5
SELECT ip.ID_PRODUTO AS id_produto, 
		SUM(ip.QUANTIDADE) AS quantidade_vendida, 
		SUM(ip.PRECO_PRATICADO * ip.QUANTIDADE) AS total_vendido, 
		COUNT(DISTINCT p.ID_PEDIDO) AS pedidos, 
		COUNT(DISTINCT p.ID_CLIENTE) AS clientes	
FROM itens_pedido ip
INNER JOIN pedido p ON ip.ID_PEDIDO = p.ID_PEDIDO
GROUP BY ip.ID_PRODUTO
ORDER BY quantidade_vendida DESC, total_vendido DESC
LIMIT 1;