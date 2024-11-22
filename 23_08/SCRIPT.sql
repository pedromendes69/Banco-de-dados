-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



	CREATE TABLE Pessoa Fisica (
	FaixaRenda 	   decimal(9,2),  NULL
	RG 			 varchar(15), NOT NULL
	CPF 		 varchar(15), NOT NULL
	EstadoCivil 	Caracter, NOT NULL
	Profissao 	    varchar(25),  NULL
	Habilitação  varchar(15), NOT NULL
	sexo 			caracter, NOT NULL
	DataNasc 			date, NOT NULL
	FOREIGN KEY(NumId) REFERENCES Cliente (NumId)
)

	CREATE TABLE Pessoa Juridica (
	ContatoResponsavel varchar(15), NOT NULL
	CNPJ 			   varchar(20), NOT NULL
	inscriçãoEstadual  varchar(10), NOT NULL
	ramoAtividade     varchar(25),  NOT NULL
	RazaoSocial		   varchar(30), NOT NULL
	FOREIGN KEY(NumId) REFERENCES Cliente (NumId)
)

	CREATE TABLE Acidente (
	IDAcidente 	int PRIMARY KEY, NOT NULL
	Local 			varchar(50), NOT NULL
	Data 				   date, NOT NULL
	Hora 		  			time NOT NULL
	 FOREIGN KEY(NumRegistro) REFERENCES Veiculo (NumRegistro)
)

	CREATE TABLE Veiculo (
	NumRegistro 	int PRIMARY KEY, NOT NULL
	Marca 				varchar(15), NOT NULL
	Modelo 				varchar(15), NOT NULL
	anoFabricacao        	   Date, NOT NULL
	Placa 			 	 varchar(10) NOT NULL
	 FOREIGN KEY(NumId) REFERENCES Cliente (NumId)
)

	CREATE TABLE Apolice (
	NumApolice 		int PRIMARY KEY, NOT NULL
	NumRegistro 				int, NOT NULL
	Valor 			   decimal(9,2), NOT NULL
	descricao 		   varchar(100), NOT NULL
	FOREIGN KEY(NumRegistro) REFERENCES Veiculo (NumRegistro)
)

	CREATE TABLE Cliente (
	NumId 	int PRIMARY KEY, NOT NULL
	endereço    varchar(50), NOT NULL
	Status 		varchar(15), NOT NULL
	Telefone	varchar(15), NOT NULL
	DataCadastro	   Date, NOT NULL
	nome 		varchar(50), NOT NULL
	email 		 Varchar(50) NOT NULL
)

