-- Active: 1739553282821@@127.0.0.1@5432@estoque
-- Sepa ta tudo errado :3
drop table clientes, fornecedores, produtos, estoque, compras, vendas, vendas_produtos, compras_produtos;

-- Stored Fuction, recebe como entrada a quantidade e o preço do produto e retorne o valor total da venda
drop function fn_calcular_valor_venda;
CREATE OR REPLACE FUNCTION fn_calcular_valor_venda(p_quantidade INT, id int)
RETURNS FLOAT AS $$
BEGIN
    -- Calcula o valor total da venda
    RETURN p_quantidade * (SELECT preco_unitario FROM produtos WHERE id = id);
END;
$$ LANGUAGE plpgsql;



--  Stored Function, retorna o percentual de vendas de um produto específico em relação ao total de vendas de todos os produtos
CREATE OR REPLACE FUNCTION fn_percentual_vendas_produto(p_produto_id INT)
RETURNS FLOAT AS $$
DECLARE
    total_vendas_produto FLOAT;
    total_vendas_geral FLOAT;
    percentual FLOAT;
BEGIN
    -- total de vendas de um produto
    SELECT SUM(vp.quantidade * p.preco_unitario) INTO total_vendas_produto
    FROM vendas_produtos vp
    JOIN produtos p ON vp.fk_produto = p.id
    WHERE vp.fk_produto = p_produto_id;

    -- total de vendas geral
    SELECT SUM(vp.quantidade * p.preco_unitario) INTO total_vendas_geral
    FROM vendas_produtos vp
    JOIN produtos p ON vp.fk_produto = p.id;

    -- calcula o percentual
    IF total_vendas_geral > 0 THEN
        percentual := (total_vendas_produto / total_vendas_geral) * 100;
    ELSE
        percentual := 0;
    END IF;

    RETURN percentual;
END;
$$ LANGUAGE plpgsql;

select fn_percentual_vendas_produto(6);