-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE DEPARTAMENTO (
idDepartamento int PRIMARY KEY,
nome varchar(50),
localizacao varchar(30)
)

CREATE TABLE COLABORADOR (
idColaborador int PRIMARY KEY,
nome varchar(50),
CPF varchar(15),
dataAdmissao date,
idGerente int,               -- atributo gerado do auto-relacionamento � partir da chave primaria
idDepartamento int,    --chave estrangeira
FOREIGN KEY(idDepartamento) REFERENCES DEPARTAMENTO (idDepartamento)
)

