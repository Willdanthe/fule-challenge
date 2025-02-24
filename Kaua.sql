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


