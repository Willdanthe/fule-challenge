CREATE TABLE fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    cpnj VARCHAR(18),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    cpf_cnpj VARCHAR(18),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE produtos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(255),
    preco_unitario FLOAT,
    unidade_medida VARCHAR(10)
);

CREATE TABLE estoque(
    id SERIAL PRIMARY KEY,
    quantidade INT,
    data_ultima_atualizacao DATE,
    fk_produto INT,
    CONSTRAINT fk_produto_estoque FOREIGN KEY (fk_produto) REFERENCES produtos(id) ON DELETE CASCADE
);

CREATE TABLE compras(
    id SERIAL PRIMARY KEY,
    quantidade INT,
    data_compra DATE,
    valor_total FLOAT,
    fk_fornecedor INT,
    fk_produto INT,
    CONSTRAINT fk_fornecedor_compras FOREIGN KEY (fk_fornecedor) REFERENCES fornecedores(id) ON DELETE CASCADE,
    CONSTRAINT fk_produto_compras FOREIGN KEY (fk_produto) REFERENCES produtos(id) ON DELETE CASCADE
);

CREATE TABLE vendas(
    id SERIAL PRIMARY KEY,
    quantidade INT,
    data_venda DATE,
    valor_total FLOAT,
    fk_cliente INT,
    fk_produto INT,
    CONSTRAINT fk_cliente_vendas FOREIGN KEY (fk_cliente) REFERENCES clientes(id) ON DELETE CASCADE,
    CONSTRAINT fk_produto_vendas FOREIGN KEY (fk_produto) REFERENCES produtos(id) ON DELETE CASCADE
);

-- Insert da tabela FORNECEDORES
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES ('Fornecedor A', '12345678901234', '1234567890', 'Rua A, 123');
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES ('Fornecedor B', '98765432109876', '9876543210', 'Rua B, 456');
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES ('Fornecedor C', '56789012345678', '8765432109', 'Rua C, 789');
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES ('Fornecedor D', '12345678901234', '1234567890', 'Rua A, 123');
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES ('Fornecedor E', '98765432109876', '9876543210', 'Rua B, 456');
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES ('Fornecedor F', '56789012345678', '8765432109', 'Rua C, 789');

-- Insert da tabela CLIENTES
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES ('Cliente A', '12345678901', '1234567890', 'Rua A, 123');
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES ('Cliente B', '98765432109', '9876543210', 'Rua B, 456');
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES ('Cliente C', '56789012345', '8765432109', 'Rua C, 789');
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES ('Cliente D', '12345678901', '1234567890', 'Rua A, 123');
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES ('Cliente E', '98765432109', '9876543210', 'Rua B, 456');
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES ('Cliente F', '56789012345', '8765432109', 'Rua C, 789');

-- Insert da tabela PRODUTOS
INSERT INTO produtos (nome, tipo, preco_unitario, unidade_medida) VALUES ('Produto A', 'Tipo A', 10.00, 'Unidade');
INSERT INTO produtos (nome, tipo, preco_unitario, unidade_medida) VALUES ('Produto B', 'Tipo B', 20.00, 'Unidade');
INSERT INTO produtos (nome, tipo, preco_unitario, unidade_medida) VALUES ('Produto C', 'Tipo C', 30.00, 'Unidade');
INSERT INTO produtos (nome, tipo, preco_unitario, unidade_medida) VALUES ('Produto D', 'Tipo D', 40.00, 'Unidade');
INSERT INTO produtos (nome, tipo, preco_unitario, unidade_medida) VALUES ('Produto E', 'Tipo E', 50.00, 'Unidade');
INSERT INTO produtos (nome, tipo, preco_unitario, unidade_medida) VALUES ('Produto F', 'Tipo F', 60.00, 'Unidade');

-- Insert da tabela ESTOQUE
INSERT INTO estoque (quantidade, data_ultima_atualizacao, fk_produto) VALUES (10, '2023-01-01', 1);
INSERT INTO estoque (quantidade, data_ultima_atualizacao, fk_produto) VALUES (20, '2023-02-01', 2);
INSERT INTO estoque (quantidade, data_ultima_atualizacao, fk_produto) VALUES (30, '2023-03-01', 3);
INSERT INTO estoque (quantidade, data_ultima_atualizacao, fk_produto) VALUES (40, '2023-04-01', 4);
INSERT INTO estoque (quantidade, data_ultima_atualizacao, fk_produto) VALUES (50, '2023-05-01', 5);
INSERT INTO estoque (quantidade, data_ultima_atualizacao, fk_produto) VALUES (60, '2023-06-01', 6);

-- Insert da tabela VENDAS
INSERT INTO vendas (data_venda, valor_total, fk_cliente, fk_produto) VALUES ('2023-01-01', 100.00, 1, 1);
INSERT INTO vendas (data_venda, valor_total, fk_cliente, fk_produto) VALUES ('2023-02-01', 200.00, 2, 2);
INSERT INTO vendas (data_venda, valor_total, fk_cliente, fk_produto) VALUES ('2023-03-01', 300.00, 3, 3);
INSERT INTO vendas (data_venda, valor_total, fk_cliente, fk_produto) VALUES ('2023-04-01', 400.00, 4, 4);
INSERT INTO vendas (data_venda, valor_total, fk_cliente, fk_produto) VALUES ('2023-05-01', 500.00, 5, 5);
INSERT INTO vendas (data_venda, valor_total, fk_cliente, fk_produto) VALUES ('2023-06-01', 600.00, 6, 6);

-- Insert da tabela COMPRAS
INSERT INTO compras (data_compra, valor_total, fk_fornecedor, fk_produto) VALUES ('2023-01-01', 100.00, 1, 1);
INSERT INTO compras (data_compra, valor_total, fk_fornecedor, fk_produto) VALUES ('2023-02-01', 200.00, 2, 2);
INSERT INTO compras (data_compra, valor_total, fk_fornecedor, fk_produto) VALUES ('2023-03-01', 300.00, 3, 3);
INSERT INTO compras (data_compra, valor_total, fk_fornecedor, fk_produto) VALUES ('2023-04-01', 400.00, 4, 4);
INSERT INTO compras (data_compra, valor_total, fk_fornecedor, fk_produto) VALUES ('2023-05-01', 500.00, 5, 5);
INSERT INTO compras (data_compra, valor_total, fk_fornecedor, fk_produto) VALUES ('2023-06-01', 600.00, 6, 6);
