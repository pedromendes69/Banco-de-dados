-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE FUNCIONARIO (
	matriculaFunc int PRIMARY KEY,
	Sexo varchar(15),
	Endereço varchar(30),
	Nome varchar(50),
	Telefone varchar(15),
	RG varchar(15),
	Nacionalidade varchar(15),
	DataAdmissão date,
	EstCivil varchar(15),
	CPF varchar(30),
	dataNasc date
)

CREATE TABLE CARGO OCUPADO (
	idDependente int PRIMARY KEY,
	Nome varchar(50),
	DataNasc date,
	matriculaFunc int, -- chave estrangeira
FOREIGN KEY(matriculaFunc) REFERENCES FUNCIONARIO (matriculaFunc)
)

CREATE TABLE DEPENDENTES (
	idCargo int PRIMARY KEY,
	DataInicio date,
	DataFim date,
	NomeCargo varchar(30)
)

CREATE TABLE ocupar (
	idCargo int, --chave estrangeira
	matriculaFunc int, --chave estrangeira
FOREIGN KEY(idCargo) REFERENCES DEPENDENTES (idCargo),
FOREIGN KEY(matriculaFunc) REFERENCES FUNCIONARIO (matriculaFunc)
)

