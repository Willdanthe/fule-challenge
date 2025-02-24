-- 4. Consultas e Relatórios (DQL - Data Query Language)

-- 4.1 Selecione todos os produtos disponíveis no estoque e suas respectivas quantidades. --V
SELECT P.NOME AS PRODUTO, E.QUANTIDADE
FROM PRODUTOS P
JOIN ESTOQUE E ON P.ID = fk_produto;

-- 4.2 Liste todas as compras feitas de um fornecedor específico dentro de um determinado período. --V
SELECT C.ID, F.NOME, C.data_compra
FROM compras C
JOIN fornecedores F ON C.fk_fornecedor = F.ID
WHERE C.data_compra > '2025-02-24' AND C.data_compra < '2025-02-25';

-- 4.3 Exiba os clientes que mais compraram combustível no último mês. --V
SELECT C.NOME AS CLIENTES, VP.quantidade
FROM CLIENTES C
JOIN VENDAS V ON C.ID = V.fk_cliente
JOIN vendas_produtos VP ON V.ID = fk_venda
ORDER BY VP.quantidade DESC
LIMIT 3;


-- 4.4 Calcule o valor total das vendas de cada tipo de combustível no último trimestre.
SELECT P.NOME AS COMBUSTIVEL, COALESCE(SUM(P.PRECO_UNITARIO * VP.QUANTIDADE), 0) AS TOTAL_VENDAS
FROM PRODUTOS P
JOIN vendas_produtos VP ON P.id = VP.fk_produto
JOIN VENDAS V ON VP.fk_venda = V.ID
WHERE EXTRACT(QUARTER FROM V.DATA_VENDA) = EXTRACT(QUARTER FROM CURRENT_DATE)
GROUP BY P.NOME;

-- 4.5 Identifique os produtos que estão abaixo de um estoque mínimo definido (por exemplo, menos de 100 litros). --V
SELECT P.NOME AS PRODUTOS, E.quantidade
FROM PRODUTOS P
JOIN estoque E ON P.ID = E.fk_produto
WHERE E.quantidade < 12;