/* Lógico_1: */

CREATE TABLE NomesSS (
    Nome VARCHAR(100) PRIMARY KEY,
    Bairro VARCHAR(25),
    Endereco_Entrega VARCHAR(25),
    CEP INTEGER,
    Cidade VARCHAR(30),
    UF VARCHAR(2),
    CPF INTEGER,
    Cod_Cliente INTEGER
);

CREATE TABLE ReferenteMes (
    Codigo_Deb_Automatico INTEGER,
    Referente_Mes DATE PRIMARY KEY,
    Cod_Cliente INTEGER
);

CREATE TABLE ValoresFaturados (
    Valor_R__ INTEGER,
    Quantidade_Consumo INTEGER,
    Preco INTEGER,
    Descricao VARCHAR(100),
    Valores_Faturados INTEGER PRIMARY KEY,
    Cod_Cliente INTEGER
);

CREATE TABLE Buscar_ValoresFaturados_ReferenteMes_Nomes (
    fk_ValoresFaturados_Valores_Faturados INTEGER,
    fk_ReferenteMes_Referente_Mes DATE,
    fk_Nomes_Nome VARCHAR(100)
);
 
ALTER TABLE Buscar_ValoresFaturados_ReferenteMes_Nomes ADD CONSTRAINT FK_Buscar_ValoresFaturados_ReferenteMes_Nomes_1
    FOREIGN KEY (fk_ValoresFaturados_Valores_Faturados)
    REFERENCES ValoresFaturados (Valores_Faturados)
    ON DELETE SET NULL;
 
ALTER TABLE Buscar_ValoresFaturados_ReferenteMes_Nomes ADD CONSTRAINT FK_Buscar_ValoresFaturados_ReferenteMes_Nomes_2
    FOREIGN KEY (fk_ReferenteMes_Referente_Mes)
    REFERENCES ReferenteMes (Referente_Mes)
    ON DELETE SET NULL;
 
ALTER TABLE Buscar_ValoresFaturados_ReferenteMes_Nomes ADD CONSTRAINT FK_Buscar_ValoresFaturados_ReferenteMes_Nomes_3
    FOREIGN KEY (fk_Nomes_Nome)
    REFERENCES Nomes (Nome)
    ON DELETE CASCADE;


	ALTER TABLE ValoresFaturados
	ALTER COLUMN Descricao VARCHAR(100)

	ALTER TABLE NomesSS
	ALTER COLUMN Nome VARCHAR(100)

	


INSERT INTO ValoresFaturados (Valor_R__,Quantidade_Consumo,Preco,Descricao,Valores_Faturados,Cod_Cliente)values
(59,237,49,'Gastos mes',695,1),
(49,37,49,'Gastos mes',6,2),
(89,2357,49,'Gastos mes',9,3),
(69,27,49,'Gastos mes',99,4),
(29,23,49,'Gastos mes',89,5)

INSERT INTO NomesSS(Nome,Bairro,Endereco_Entrega,CEP,CIDADE,UF,CPF,Cod_Cliente) VALUES
( 'Erick','City Petropolis', 'Rua antonio Montanari ',14409524,'Franca','SP',454557,1),
( 'Vania','City Petropolis', 'Rua antonio Montanari ',14409524,'Franca','SP',587414,2)


INSERT INTO ReferenteMes(Codigo_Deb_Automatico,Referente_Mes,Cod_Cliente)VALUES
(1,'25/05/2021',1),
(2,'27/04/2021',2),
(3,'05/04/2021',3)

SELECT*
FROM ValoresFaturados

SELECT Bairro, CEP, Cidade AS 'Municipio'
FROM NomesSS
ORDER BY Cod_Cliente asc

SELECT COUNT(Cidade) AS 'Municipio'
FROM NomesSS

SELECT*
FROM ReferenteMes

UPDATE NomesSS
SET CPF = '545572'
WHERE Cod_Cliente = 1


SELECT *
FROM ValoresFaturados
RIGHT JOIN  ReferenteMes 
ON  ValoresFaturados.Cod_Cliente = ReferenteMes.Codigo_Deb_Automatico

SELECT SUM(Quantidade_Consumo) AS 'Soma total de consumo', AVG(Quantidade_Consumo) AS 'Media do consumo', MIN(Quantidade_Consumo) AS 'Minimo consumo' 
FROM ValoresFaturados

