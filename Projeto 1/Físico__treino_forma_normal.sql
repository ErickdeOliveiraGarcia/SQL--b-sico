/* Lógico__treino_forma_normal: */

CREATE TABLE Nome_Cliente_Nome_Fantasia (
   
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    codCliente INTEGER PRIMARY KEY,
    Nome_fantasia VARCHAR(50)
);

CREATE TABLE Email (
    codCliente INTEGER,
    email VARCHAR(50)
);

CREATE TABLE Endereco (
    CEP VARCHAR(50) PRIMARY KEY,
    codCliente INTEGER,
    logradouro VARCHAR(50),
    bairro VARCHAR(50),
    Uf VARCHAR(2),
    Cidade VARCHAR(50)
);

CREATE TABLE Telefone (
    codCliente INTEGER,
    telefone VARCHAR(50)
);

CREATE TABLE Pedido (
    num_pedido INTEGER PRIMARY KEY,
    codCliente INTEGER,
    codEenderecoEntrega INTEGER,
    data_emissao DATE,
    data_entrega DATE,
    observacao VARCHAR(50)
);

CREATE TABLE Forma_Pagament (
    Forma_Pagament VARCHAR(50) PRIMARY KEY,
    codPagamento INTEGER,
    codVendedor INTEGER,
    codCliente INTEGER,
    Observacao VARCHAR(50),
    pagamento_30d_60d_90d_120D_ VARCHAR(50),
    vencimento DATE,
    fk_Pedido_num_pedido INTEGER
);

CREATE TABLE Produtos (
    codItens INTEGER PRIMARY KEY,
    qtdItens INTEGER,
    Unidade VARCHAR(50),
    itens INTEGER,
    valor_ REAL,
    total_ REAL,
    observacao_ VARCHAR(50),
    num_pedido INTEGER,
    codCliente INTEGER
);

CREATE TABLE Unidade (
    Unidade VARCHAR(50),
    codItens INTEGER
);

CREATE TABLE Grupo (
    codItens INTEGER,
    grupo VARCHAR(50)
);

CREATE TABLE Endereco_Entrega (
    Cidade VARCHAR(50),
    Uf VARCHAR(2),
    codCliente INTEGER,
    CEP VARCHAR(50) PRIMARY KEY,
    bairro VARCHAR(50),
    logradouro VARCHAR(50),
    codEenderecoEntrega INTEGER,
    fk_Pedido_num_pedido INTEGER
);

CREATE TABLE Buscar_Telefone_Nome_Cliente_Nome_Fantasia_Email_Endereco (
    fk_Nome_Cliente_Nome_Fantasia_codCliente INTEGER,
    fk_Endereco_CEP VARCHAR(50)
);

CREATE TABLE Buscar_Produtos_Unidade_Grupo (
    fk_Produtos_codItens INTEGER
);

CREATE TABLE Buscar_Nome_Cliente_Nome_Fantasia_Produtos_Pedido (
    fk_Nome_Cliente_Nome_Fantasia_codCliente INTEGER,
    fk_Produtos_codItens INTEGER,
    fk_Pedido_num_pedido INTEGER
);
 
 
ALTER TABLE Endereco_Entrega ADD CONSTRAINT FK_Endereco_Entrega_2
    FOREIGN KEY (fk_Pedido_num_pedido)
    REFERENCES Pedido (num_pedido)
    ON DELETE CASCADE;
 
ALTER TABLE Buscar_Telefone_Nome_Cliente_Nome_Fantasia_Email_Endereco ADD CONSTRAINT FK_Buscar_Telefone_Nome_Cliente_Nome_Fantasia_Email_Endereco_1
    FOREIGN KEY (fk_Nome_Cliente_Nome_Fantasia_codCliente)
    REFERENCES Nome_Cliente_Nome_Fantasia (codCliente)
    ON DELETE NO ACTION;
 

 
ALTER TABLE Buscar_Produtos_Unidade_Grupo ADD CONSTRAINT FK_Buscar_Produtos_Unidade_Grupo_1
    FOREIGN KEY (fk_Produtos_codItens)
    REFERENCES Produtos (codItens)
    ON DELETE NO ACTION;
 

ALTER TABLE Buscar_Nome_Cliente_Nome_Fantasia_Produtos_Pedido ADD CONSTRAINT FK_Buscar_Nome_Cliente_Nome_Fantasia_Produtos_Pedido_2
    FOREIGN KEY (fk_Produtos_codItens)
    REFERENCES Produtos (codItens)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Nome_Cliente_Nome_Fantasia_Produtos_Pedido ADD CONSTRAINT FK_Buscar_Nome_Cliente_Nome_Fantasia_Produtos_Pedido_3
    FOREIGN KEY (fk_Pedido_num_pedido)
    REFERENCES Pedido (num_pedido)
    ON DELETE NO ACTION;