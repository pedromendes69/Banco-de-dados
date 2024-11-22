-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Fatura (
IdFatura 	int PRIMARY KEY, Não nulo
DataPedido 	date Not null,
valorTotal 	numeric Not null,
IdPedido 	int Not null,
FOREIGN KEY(IdPedido) REFERENCES Pedido (IdPedido)
)

CREATE TABLE Cliente (
IDCliente 	int PRIMARY KEY Not null,
endereço 	varchar(30), Não nulo
telefone 	varchar(15), Não nulo
email 	varchar(100),  Não nulo
nome 	varchar(50), Não nulo
)

CREATE TABLE Produto (
IdProduto 	int PRIMARY KEY, Não nulo
preço 		numeric, Não nulo
estoque 	numeric, Não nulo
descrição 	varchar(50), Não nulo
nome 		varchar(50), Não nulo
)

CREATE TABLE item_pedido (
IdPedido 	    int PRIMARY KEY,Não nulo
PreçoUnitario 	numeric, Não nulo
Quantidade 		numeric, Não nulo
IdProduto 		int, FK, Não nulo
FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto)
)

CREATE TABLE Pedido (
IdPedido 	int PRIMARY KEY, Não nulo
DataPedido 	date, Não nulo
Status 		varchar(15), Não nulo
IDCliente 	int, FK, Não nulo
FOREIGN KEY(IDCliente) REFERENCES Cliente (IDCliente)
)

ALTER TABLE Fatura ADD 
ALTER TABLE item_pedido ADD FOREIGN KEY(IdPedido) REFERENCES Pedido (IdPedido)
