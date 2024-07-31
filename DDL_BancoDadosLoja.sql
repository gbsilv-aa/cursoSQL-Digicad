--  CRIAÇÃO DO BANCO DE DADOS dbLojas

CREATE DATABASE dbLojas;

USE dbLojas;

--CRIAÇÃO DAS TABELAS

-- TABELA CLIENTE

CREATE TABLE Clientes (
pkCod_Cliente		VARCHAR(5) PRIMARY KEY, 
nome_Emp		VARCHAR(40) NOT NULL,
nome_contato	VARCHAR(30), 
cargo_contato	VARCHAR(30),
endereço		VARCHAR(60),
cidade			VARCHAR(15),
regiao			VARCHAR(15),
cep				VARCHAR(10),
pais			VARCHAR(15),
telefone		VARCHAR(24),
fax				VARCHAR(24)

); 

-- TABELA FUNCIONARIOS

CREATE TABLE funcionarios (
pkCod_funcionario		INT PRIMARY KEY, 
sobrenome				VARCHAR(20) NOT NULL,
nome					VARCHAR(20) NOT NULL,
cargo					VARCHAR(30), 
tratamento				VARCHAR(25),
dataNascimento			DATE,
dataContratacao			DATE,
endereco				VARCHAR(60),
cidade					VARCHAR(15),
regiao					VARCHAR(15),
cep						VARCHAR(10),
pais					VARCHAR(15),
telefoneResidencial		VARCHAR(24),
ramal					VARCHAR(4),
observacoes				VARCHAR(500),
); 

-- TABELA FORNECEDORES

CREATE TABLE fornecedores (
pkCod_fornecedor		INT PRIMARY KEY, 
nome_Emp				VARCHAR(40) NOT NULL,
nome_contato			VARCHAR(30),
cargo_contato			VARCHAR(30),
endereco				VARCHAR(60),
cidade					VARCHAR(15),
regiao					VARCHAR(15),
cep						VARCHAR(10),
pais					VARCHAR(15),
telefone				VARCHAR(24),
fax						VARCHAR(24)

); 

-- TABELA TRANSPORTADORAS

CREATE TABLE transportadoras (
pkCod_transportadora	INT PRIMARY KEY, 
nome_Emp				VARCHAR(40) NOT NULL,
telefone				VARCHAR(24),

); 


-- TABELA CATEGORIAS

CREATE TABLE categorias (
pkCod_categoria			INT PRIMARY KEY, 
nome_categoria			VARCHAR(15) NOT NULL,
descricao				VARCHAR(500),

); 


-- TABELA PRODUTOS

CREATE TABLE produtos (
pkCod_produto			INT PRIMARY KEY, 
nome_produto			VARCHAR(40) NOT NULL,
fkCod_fornecedor		INT,
fkCod_categoria			INT,
quantidadePorUnidade	VARCHAR(25),
precoUnitario			MONEY,
unidadesEmEstoque		SMALLINT,
unidadesPerdidas		SMALLINT,
nivelDeReposicao		SMALLINT,
descontinuado			BIT NOT NULL

FOREIGN KEY (fkCod_fornecedor) REFERENCES fornecedores (pkCod_fornecedor),
FOREIGN KEY (fkCod_categoria) REFERENCES funcionarios	(pkCod_funcionario),


); 



-- TABELA PEDIDOS

CREATE TABLE pedidos (
pknum_pedido			INT PRIMARY KEY, 
fkCod_cliente			VARCHAR(5),
fkCod_funcionario		INT,
dataPedido				DATE,
dataEntrega				DATE,
dataEnvio				DATE,
fkCod_transportadora	INT,
frete					MONEY,
nomeDestinatario		VARCHAR (40),
enderecoDestinatario	VARCHAR (60),
cidadeDestino			VARCHAR(15),
regiaoDestino			VARCHAR(15),
CepDestino				VARCHAR(10),
paisDestino				VARCHAR(15),


FOREIGN KEY (fkCod_cliente) REFERENCES Clientes (pkCod_Cliente),
FOREIGN KEY (fkCod_funcionario) REFERENCES categorias	(pkCod_categoria),
FOREIGN KEY (fkCod_transportadora) REFERENCES transportadoras (pkCod_transportadora),

); 


-- TABELA DETALHES PEDIDOS

CREATE TABLE DetalhesPedidos (
pk_DetalhesPedidos		INT PRIMARY KEY IDENTITY (1,1),
fknum_pedido			INT NOT NULL, 
fkCod_produto			INT NOT NULL, 
precoUnitario			MONEY NOT NULL,
quantidade				SMALLINT NOT NULL,
desconto				REAL	NOT NULL,

FOREIGN KEY (fknum_pedido) REFERENCES pedidos (pknum_pedido),
FOREIGN KEY (fkCod_produto) REFERENCES produtos	(pkCod_produto)
);