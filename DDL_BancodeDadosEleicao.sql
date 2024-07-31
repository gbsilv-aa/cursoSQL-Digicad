CREATE DATABASE eleicao;

USE eleicao;

-- criando as tabelas da eleição

CREATE TABLE cargo (
pk_cod_cargo			INT PRIMARY KEY,
nome_cargo				VARCHAR (30) NOT NULL UNIQUE, 
salario					DECIMAL (5,2) NOT NULL DEFAULT 17000.00,
num_vagas				INT NOT NULL

);

CREATE TABLE partido (
pk_num_partido			INT PRIMARY KEY,
sigla					CHAR(5) NOT NULL UNIQUE, 
nome_partido			VARCHAR (40) NOT NULL UNIQUE,
numero					INT NOT NULL UNIQUE, 

);

CREATE TABLE candidato (
pk_num_candidato		INT PRIMARY KEY,
nome					VARCHAR(40) NOT NULL UNIQUE, 
fk_cod_cargo			INT NOT NULL,
fk_cod_partido			INT	NOT NULL,

FOREIGN KEY	(fk_cod_cargo) REFERENCES cargo (pk_cod_cargo),
FOREIGN KEY	(fk_cod_partido) REFERENCES partido (pk_num_partido),


);

CREATE TABLE eleitor (
pk_titulo_eleitor		VARCHAR (30) NOT NULL UNIQUE,
ZonaEleitoral			CHAR (5) NOT NULL, 
SessaoEleitoral			CHAR (5) NOT NULL,
nome					VARCHAR (40) NOT NULL

);

CREATE TABLE voto (
pk_IDVoto				INT PRIMARY KEY,
fk_titulo_eleitor		VARCHAR(30) NOT NULL UNIQUE, 
fk_num_candidato		INT	NOT NULL,

FOREIGN KEY	(fk_titulo_eleitor) REFERENCES eleitor (pk_titulo_eleitor),
FOREIGN KEY	(fk_num_candidato)	REFERENCES candidato (pk_num_candidato),


);


SELECT* FROM candidato;

