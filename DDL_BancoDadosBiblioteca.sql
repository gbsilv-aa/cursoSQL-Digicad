--criando banco de dados biblioteca.

CREATE DATABASE biblioteca;

USE biblioteca;

--criando a tabelas

CREATE TABLE editora(

pk_idEditora		INT PRIMARY KEY IDENTITY(1,1),
nome_editora		VARCHAR(100) NOT NULL UNIQUE, 
endereco_editora	VARCHAR(100) NOT NULL,
telefone			CHAR(11) NOT NULL,


);

CREATE TABLE livro (
pk_idLivro			INT PRIMARY KEY IDENTITY (1,1),
titulo				VARCHAR (50) NOT NULL, 
fk_idEditora		INT NOT NULL, 

FOREIGN KEY (fk_idEditora) REFERENCES editora (pk_idEditora)

);

CREATE TABLE filial_Biblioteca (
pk_idFilial			INT PRIMARY KEY IDENTITY(1,1),
nome_filial			VARCHAR (100)NOT NULL UNIQUE,
endereco_filial		VARCHAR (100) NOT NULL

);


CREATE TABLE cliente	(
pk_numCard_Cliente		INT PRIMARY KEY IDENTITY(1,1),
nome_cliente			VARCHAR(100)	NOT NULL,
endereço_cliente		VARCHAR(100)	NOT NULL,
telefone_cliente		CHAR(11)		NOT NULL


);


CREATE TABLE emprestimos  (

pk_idEmprestimo		INT PRIMARY KEY IDENTITY(1,1),
fk_idLivro			INT NOT NULL,
fk_idFilial			INT NOT NULL,
fk_numCard_cliente	INT NOT NULL,
data_emprestimo		DATE NOT NULL,
data_devolucao		DATE NOT NULL,

FOREIGN KEY (fk_idLivro) REFERENCES livro (pk_idLivro),
FOREIGN KEY (fk_idFilial) REFERENCES filial_Biblioteca (pk_idFilial),
FOREIGN KEY (fk_numCard_cliente) REFERENCES cliente (pk_numCard_Cliente)


);


CREATE TABLE copia_livros (

pk_idCopia		INT PRIMARY KEY IDENTITY(1,1),
fk_IdLivro		INT NOT NULL,
fk_idFilial		INT NOT NULL,
num_copias		INT NOT NULL,

FOREIGN KEY (fk_idLivro) REFERENCES livro (pk_idLivro),
FOREIGN KEY (fk_idFilial) REFERENCES filial_Biblioteca (pk_idFilial),

);



CREATE TABLE autores_livros	(

pk_idAutor			INT PRIMARY KEY IDENTITY(1,1),
fk_idLivro			INT NOT NULL,
nome_autor			VARCHAR(50) NOT NULL,

FOREIGN KEY (fk_idLivro) REFERENCES livro (pk_idLivro),

);
