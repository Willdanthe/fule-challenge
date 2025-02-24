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
    descricao VARCHAR(255),
    tipo VARCHAR(255),
    preco_unitario FLOAT,
    unidade_medida VARCHAR(255)
);

CREATE TABLE estoque(
    id SERIAL PRIMARY KEY,
    quantidade INT,
    data_ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_produto INT,
    CONSTRAINT fk_produto_estoque FOREIGN KEY (fk_produto) REFERENCES produtos(id) ON DELETE CASCADE
);

CREATE TABLE compras(
    id SERIAL PRIMARY KEY,
    data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total FLOAT DEFAULT 0,
    fk_fornecedor INT,
    CONSTRAINT fk_fornecedor_compras FOREIGN KEY (fk_fornecedor) REFERENCES fornecedores(id) ON DELETE CASCADE
);

CREATE TABLE vendas(
    id SERIAL PRIMARY KEY,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total INT DEFAULT 0,
    fk_cliente INT,
    CONSTRAINT fk_cliente_vendas FOREIGN KEY (fk_cliente) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE vendas_produtos(
    id SERIAL PRIMARY KEY,
    quantidade INT,
    fk_venda INT,
    fk_produto INT,
    CONSTRAINT fk_venda_vendas_produtos FOREIGN KEY (fk_venda) REFERENCES vendas(id) ON DELETE CASCADE,
    CONSTRAINT fk_produto_vendas_produtos FOREIGN KEY (fk_produto) REFERENCES produtos(id) ON DELETE CASCADE
);

CREATE TABLE compras_produtos(
    id SERIAL PRIMARY KEY,
    quantidade INT,
    fk_compra INT,
    fk_produto INT,
    CONSTRAINT fk_compra_compras_produtos FOREIGN KEY (fk_compra) REFERENCES compras(id) ON DELETE CASCADE,
    CONSTRAINT fk_produto_compras_produtos FOREIGN KEY (fk_produto) REFERENCES produtos(id) ON DELETE CASCADE
);

-- Insert da tabela FORNECEDORES
INSERT INTO fornecedores (nome, cpnj, telefone, endereco) VALUES 
('Fornecedor A', '56.789.012/0001-78', '1234567890', 'Rua A, 123'),
('Fornecedor B', '98.765.432/0001-76', '9876543210', 'Rua B, 456'),
('Fornecedor C', '11.222.333/0001-99', '8765432109', 'Rua C, 789'),
('Fornecedor D', '44.555.666/0001-88', '1234567890', 'Rua D, 321'),
('Fornecedor E', '77.888.999/0001-77', '9876543210', 'Rua E, 654'),
('Fornecedor F', '12.345.678/0001-12', '8765432109', 'Rua F, 987');

-- Insert da tabela CLIENTES
INSERT INTO clientes (nome, cpf_cnpj, telefone, endereco) VALUES 
('Cliente A', '123.456.789-01', '1234567890', 'Rua A, 123'),
('Cliente B', '987.654.321-09', '9876543210', 'Rua B, 456'),
('Cliente C', '567.890.123-45', '8765432109', 'Rua C, 789'),
('Cliente D', '98.765.432/0001-76', '1234567890', 'Rua D, 321'),
('Cliente E', '56.789.012/0001-91', '9876543210', 'Rua E, 654'),
('Cliente F', '12.345.678/0001-12', '8765432109', 'Rua F, 987');

-- Insert da tabela PRODUTOS
INSERT INTO produtos (nome, descricao, tipo, preco_unitario, unidade_medida) VALUES 
('DIESEL', 'S10', 'Combustível', 5.79, 'Litro'),
('GASOLINA', 'Comum', 'Combustível', 6.49, 'Litro'),
('ETANOL', 'Hidratado', 'Combustível', 4.99, 'Litro'),
('ÓLEO LUBRIFICANTE', 'Sintético 5W30', 'Lubrificante', 32.90, 'Litro'),
('ARLA 32', 'Redutor de emissões', 'Fluido automotivo', 3.50, 'Litro'),
('PNEU 185/65R15', 'Pneu para carros de passeio', 'Pneumático', 349.90, 'Unidade'),
('FILTRO DE ÓLEO', 'Filtro para motor 1.0 a 2.0', 'Peça automotiva', 45.00, 'Unidade'),
('BATERIA 60Ah', 'Bateria para veículos leves', 'Bateria automotiva', 420.00, 'Unidade'),
('PASTILHA DE FREIO', 'Dianteira - modelos variados', 'Peça automotiva', 120.00, 'Jogo'),
('ADITIVO PARA RADIADOR', 'Pronto para uso', 'Fluido automotivo', 25.90, 'Litro');


-- Insert da tabela ESTOQUE
INSERT INTO estoque (quantidade, fk_produto) VALUES 
(10, 1),
(5, 2),
(20, 3),
(15, 4),
(8, 5),
(12, 6);

-- Insert da tabela COMPRAS
INSERT INTO compras (fk_fornecedor) VALUES 
(1),
(2),
(3),
(4),
(5),
(6);

-- Insert da tabela COMPRAS_PRODUTOS
INSERT INTO compras_produtos (quantidade, fk_compra, fk_produto) VALUES 
(10, 1, 1),
(5, 2, 2),
(20, 3, 3),
(15, 4, 4),
(8, 5, 5),
(12, 6, 6);

-- Insert da tabela VENDAS
INSERT INTO vendas (fk_cliente) VALUES 
(1),
(2),
(3),
(4),
(5),
(6);

-- Insert da tabela VENDAS_PRODUTOS
INSERT INTO vendas_produtos (quantidade, fk_venda, fk_produto) VALUES 
(5, 1, 1),
(3, 2, 2),
(8, 3, 3),
(2, 4, 4),
(6, 5, 5),
(4, 6, 6);

-- Verificando os dados
SELECT * FROM fornecedores;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM estoque;
SELECT * FROM compras;
SELECT * FROM compras_produtos;
SELECT * FROM vendas;
SELECT * FROM vendas_produtos;
