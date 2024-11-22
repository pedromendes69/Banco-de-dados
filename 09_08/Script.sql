-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Fatura (
IdFatura 	int PRIMARY KEY, N�o nulo
DataPedido 	date Not null,
valorTotal 	numeric Not null,
IdPedido 	int Not null,
FOREIGN KEY(IdPedido) REFERENCES Pedido (IdPedido)
)

CREATE TABLE Cliente (
IDCliente 	int PRIMARY KEY Not null,
endere�o 	varchar(30), N�o nulo
telefone 	varchar(15), N�o nulo
email 	varchar(100),  N�o nulo
nome 	varchar(50), N�o nulo
)

CREATE TABLE Produto (
IdProduto 	int PRIMARY KEY, N�o nulo
pre�o 		numeric, N�o nulo
estoque 	numeric, N�o nulo
descri��o 	varchar(50), N�o nulo
nome 		varchar(50), N�o nulo
)

CREATE TABLE item_pedido (
IdPedido 	    int PRIMARY KEY,N�o nulo
Pre�oUnitario 	numeric, N�o nulo
Quantidade 		numeric, N�o nulo
IdProduto 		int, FK, N�o nulo
FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto)
)

CREATE TABLE Pedido (
IdPedido 	int PRIMARY KEY, N�o nulo
DataPedido 	date, N�o nulo
Status 		varchar(15), N�o nulo
IDCliente 	int, FK, N�o nulo
FOREIGN KEY(IDCliente) REFERENCES Cliente (IDCliente)
)

ALTER TABLE Fatura ADD 
ALTER TABLE item_pedido ADD FOREIGN KEY(IdPedido) REFERENCES Pedido (IdPedido)
