/* Lógico_: */

CREATE TABLE Produtos (
    Produtos VARCHAR(50) PRIMARY KEY,
    Itens Integer,
    Grupo Varchar(50),
    fk_Unidade_Unidade_PK Integer,
    Qtd Integer,
    Valor Money,
    Total Money
);

CREATE TABLE Pagamento_Vendedora (
    Pagamento VARCHAR(50),
    Tipo_Pagamento Varchar(50),
    Condicoes_Pagamento DATE,
    Vencimento DATE,
    Vendedora_Nome Varchar(50),
    Observacao Varchar(50),
    Num_Pedido REAL,
    Endereco_Entrega Varchar(50),
    PRIMARY KEY (Pagamento, Vendedora_Nome)
);

CREATE TABLE Cliente (
    Nome_Fantasia VARCHAR(50),
    Endereco_Completo VARCHAR(100),
    Telefone INTEGER
);

CREATE TABLE Unidade (
    Unidade_PK Integer NOT NULL PRIMARY KEY,
    Peso REAL,
    Litro REAL,
    par Integer
);

CREATE TABLE Comprar_Cliente_Produtos_Pagamento (
    fk_Produtos_Produtos VARCHAR(50),
    fk_Pagamento_Vendedora_Pagamento VARCHAR(50)
);
 
ALTER TABLE Produtos ADD CONSTRAINT FK_Produtos_2
    FOREIGN KEY (fk_Unidade_Unidade_PK)
    REFERENCES Unidade (Unidade_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Comprar_Cliente_Produtos_Pagamento ADD CONSTRAINT FK_Comprar_Cliente_Produtos_Pagamento_1
    FOREIGN KEY (fk_Produtos_Produtos)
    REFERENCES Produtos (Produtos)
    ON DELETE NO ACTION;
 
ALTER TABLE Comprar_Cliente_Produtos_Pagamento ADD CONSTRAINT FK_Comprar_Cliente_Produtos_Pagamento_2
    FOREIGN KEY (fk_Pagamento_Vendedora_Pagamento, ???)
    REFERENCES Pagamento_Vendedora (Pagamento, ???)
    ON DELETE RESTRICT;