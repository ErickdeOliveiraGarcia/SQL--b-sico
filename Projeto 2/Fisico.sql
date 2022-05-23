/* Lógico_1: */

CREATE TABLE Caixa (
    Quanti_Estoque INTEGER,
    Produtos VARCHAR100),
    Nome_cliente VARCHAR(50),
    Emprestimos VARCHAR(3),
    Forma_Pagamento VARCHAR(50),
    Suspender VARCHAR(4),
    Valor_Multa_Desconto NUMERIC,
    fk_Cliente_Nome_cliente VARCHAR(50)
);

CREATE TABLE Cliente (
    Cod_cliente INTEGER,
    Nome_cliente VARCHAR(50) PRIMARY KEY,
    Emprestimos VARCHAR(3)
);

CREATE TABLE Emprestimo (
    Cod_cliente INTEGER,
    Cod_Produtos INTEGER,
    Nome_cliente VARCHAR(50),
    Produtos VARCHAR100),
    Emprestimos VARCHAR(3) PRIMARY KEY
);

CREATE TABLE Estoque (
    Quanti_Estoque INTEGER PRIMARY KEY,
    Cod_Produtos INTEGER
);

CREATE TABLE Produtos (
    Cod_Produtos INTEGER,
    Produtos VARCHAR100) PRIMARY KEY
);

CREATE TABLE Aniversario (
    Cod_cliente INTEGER,
    Data_Nasci_ DATE PRIMARY KEY
);

CREATE TABLE Descontos_Multas (
    Nome_cliente VARCHAR(50),
    Cod_cliente INTEGER,
    Valor_Multa_Desconto NUMERIC PRIMARY KEY
);

CREATE TABLE Forma_de_pagamento (
    Cod_cliente INTEGER,
    Forma_Pagamento VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Suspencao (
    Suspender VARCHAR(4) PRIMARY KEY,
    Nome_cliente VARCHAR(50)
);

CREATE TABLE Contato (
    Telefone INTEGER PRIMARY KEY,
    Cod_cliente INTEGER
);

CREATE TABLE Retirada_Entrega (
    Data_Retirada DATE,
    Data_Entrega DATE PRIMARY KEY,
    Cod_cliente INTEGER,
    Nome_cliente VARCHAR(50)
);

CREATE TABLE Saldo (
    Saldo NUMERIC PRIMARY KEY,
    Saldo_Receber NUMERIC,
    Saldo_Pagar NUMERIC
);

CREATE TABLE Buscar_Cliente_Contato_Aniversario (
    fk_Cliente_Nome_cliente VARCHAR(50),
    fk_Contato_Telefone INTEGER,
    fk_Aniversario_Data_Nasci_ DATE
);

CREATE TABLE Buscar (
    fk_Descontos_Multas_Valor_Multa_Desconto NUMERIC,
    fk_Cliente_Nome_cliente VARCHAR(50)
);

CREATE TABLE Buscar (
    fk_Forma_de_pagamento_Forma_Pagamento VARCHAR(50)
);

CREATE TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa (
    fk_Suspencao_Suspender VARCHAR(4),
    fk_Emprestimo_Emprestimos VARCHAR(3),
    fk_Produtos_Produtos VARCHAR100),
    fk_Estoque_Quanti_Estoque INTEGER,
    fk_Retirada_Entrega_Data_Entrega DATE,
    fk_Saldo_Saldo NUMERIC
);
 
ALTER TABLE Caixa ADD CONSTRAINT FK_Caixa_1
    FOREIGN KEY (fk_Cliente_Nome_cliente)
    REFERENCES Cliente (Nome_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Buscar_Cliente_Contato_Aniversario ADD CONSTRAINT FK_Buscar_Cliente_Contato_Aniversario_1
    FOREIGN KEY (fk_Cliente_Nome_cliente)
    REFERENCES Cliente (Nome_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Buscar_Cliente_Contato_Aniversario ADD CONSTRAINT FK_Buscar_Cliente_Contato_Aniversario_2
    FOREIGN KEY (fk_Contato_Telefone)
    REFERENCES Contato (Telefone)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Cliente_Contato_Aniversario ADD CONSTRAINT FK_Buscar_Cliente_Contato_Aniversario_3
    FOREIGN KEY (fk_Aniversario_Data_Nasci_)
    REFERENCES Aniversario (Data_Nasci_)
    ON DELETE RESTRICT;
 
ALTER TABLE Buscar ADD CONSTRAINT FK_Buscar_1
    FOREIGN KEY (fk_Descontos_Multas_Valor_Multa_Desconto)
    REFERENCES Descontos_Multas (Valor_Multa_Desconto)
    ON DELETE RESTRICT;
 
ALTER TABLE Buscar ADD CONSTRAINT FK_Buscar_2
    FOREIGN KEY (fk_Cliente_Nome_cliente)
    REFERENCES Cliente (Nome_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Buscar ADD CONSTRAINT FK_Buscar_1
    FOREIGN KEY (fk_Forma_de_pagamento_Forma_Pagamento)
    REFERENCES Forma_de_pagamento (Forma_Pagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa ADD CONSTRAINT FK_Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa_1
    FOREIGN KEY (fk_Suspencao_Suspender)
    REFERENCES Suspencao (Suspender)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa ADD CONSTRAINT FK_Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa_2
    FOREIGN KEY (fk_Emprestimo_Emprestimos)
    REFERENCES Emprestimo (Emprestimos)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa ADD CONSTRAINT FK_Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa_3
    FOREIGN KEY (fk_Produtos_Produtos)
    REFERENCES Produtos (Produtos)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa ADD CONSTRAINT FK_Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa_4
    FOREIGN KEY (fk_Estoque_Quanti_Estoque)
    REFERENCES Estoque (Quanti_Estoque)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa ADD CONSTRAINT FK_Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa_5
    FOREIGN KEY (fk_Retirada_Entrega_Data_Entrega)
    REFERENCES Retirada_Entrega (Data_Entrega)
    ON DELETE NO ACTION;
 
ALTER TABLE Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa ADD CONSTRAINT FK_Buscar_Suspencao_Emprestimo_Produtos_Estoque_Retirada_Entrega_Saldo_Caixa_6
    FOREIGN KEY (fk_Saldo_Saldo)
    REFERENCES Saldo (Saldo)
    ON DELETE NO ACTION;