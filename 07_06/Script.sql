-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE MATERIAL (
codMaterial int PRIMARY KEY,
valorTotal numeric, not null
descricaovarchar(50), not null
ValorUnitario numeric, not null
quantidade numeric not null
)

CREATE TABLE FORNECEDOR (
codigoForn int PRIMARY KEY,
varchar varchar(15), not null
endereco varchar(50), not null
estado char(2),  not null
cidade varchar(50), not null
nome varchar(50) not null
)

CREATE TABLE ORDEM_COMPRA (
codigoOC int PRIMARY KEY,
nomeResponsavel varchar(50),not null
data date,not null
valor numeric,not null
codigoForn int,not null
FOREIGN KEY(codigoForn) REFERENCES FORNECEDOR (codigoForn)
)

CREATE TABLE ItemCompra (
codigoOC int,
codMaterial int,
FOREIGN KEY(codigoOC) REFERENCES ORDEM_COMPRA (codigoOC)/*falha: chave estrangeira*/
)

