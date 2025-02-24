CREATE VIEW vw_relatorio AS
SELECT
    c.nome AS cliente,
    p.nome AS produto,
    vp.quantidade AS quantidade_vendida,
    v.data_venda AS data_venda,
    v.valor_total AS valor_total_venda
FROM
    vendas v
JOIN
    vendas_produtos vp ON v.id = vp.fk_venda
JOIN
    produtos p ON vp.fk_produto = p.id
JOIN
    clientes c ON v.fk_cliente = c.id;

    select * from vw_relatorio;
    

create view vw_estoque_atual AS
SELECT
    p.nome AS produto,
    e.quantidade AS quantidade_estoque
    FROM
    estoque e
JOIN
    produtos p ON e.fk_produto = p.id;

    select * from vw_estoque_atual;
