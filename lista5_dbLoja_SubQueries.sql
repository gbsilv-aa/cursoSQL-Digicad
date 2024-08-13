-- Exercicios de subqueries 

USE dbLojas;

/* Ex.1 Encontre o nome da empresa e o cargo dos funcionarios que realizaram pedidos, 
cujo valor do frete � maior que 1000 reais. */

-- Retornar todos os dados das tabelas.

SELECT * FROM dbo.funcionarios;

SELECT * FROM dbo.Clientes;

SELECT * FROM dbo.pedidos;


-- PASSO 1: Encontrar os clientes cujo valor do frete � maior que 100;

SELECT
	fkCod_cliente
FROM
	dbo.pedidos
WHERE
	frete >100;

-- PASSO 2: Identificar os nome dos clientes que pagaram mais de 100 reais de frete;
SELECT
	nome_Emp
FROM 
	dbo.Clientes
WHERE 
	pkCod_Cliente 
		IN (SELECT
				fkCod_cliente
			FROM
				dbo.pedidos
			WHERE
				frete >100);

-- Ex. 2 Listar os nomes dos produtos que possuem um pre�o unit�rio maior que a m�dia de todos os produtos.

-- Passo 1: Calcular a M�dia de pre�o dos produtos

SELECT *
FROM dbo.produtos;

SELECT 
AVG(precoUnitario) AS MediaPre�oUnit

FROM dbo.produtos;

--Passo 2: Listar os produtos que possuem pre�o superior � m�dia calculada

SELECT 
	nome_produto,
	precoUnitario
FROM 
	produtos
WHERE 
	precoUnitario > (SELECT AVG(precoUnitario) AS MediaPre�oUnit FROM dbo.produtos)
ORDER BY 
	precoUnitario ASC;

--Ex. 3 Encontre os nomes das empresas e os cargos dos contatos de todos os clientes que nunca realizaram pedidos.

-- PASSO 1: identificar quais clientes j� compraram
SELECT 
DISTINCT fkCod_cliente
FROM dbo.pedidos;

-- PASSO 2: trazer o resultado dos que nunca compraram

SELECT
	nome_Emp		AS Cliente,
	nome_contato	AS CONTATO,
	cargo_contato	AS CARGO
FROM	
	Clientes
WHERE 
	pkCod_Cliente NOT IN (SELECT DISTINCT fkCod_cliente FROM dbo.pedidos);

--Ex. 4 Listar o nome dos produtos que nunca foram pedidos

SELECT 
	DISTINCT fkCod_produto
	
FROM DetalhesPedidos;
------------------------------------------

SELECT DISTINCT nome_produto
	
FROM produtos;
-----------------------------------------------
SELECT 
	nome_produto
	
FROM produtos

WHERE pkCod_produto NOT IN (SELECT 	DISTINCT fkCod_produto FROM DetalhesPedidos);

--Ex. 5 Encontre os fornecedores que fornecem produtos em quantidade m�dia maior do que 25 unidades

SELECT * FROM DetalhesPedidos;

--Passo 1: calcule a quantidade m�dia de produtos vendidos;

SELECT 
	AVG(quantidade) AS MediaQtd
FROM 
	DetalhesPedidos;


--Passo 2: Identificar o c�digo dos produtos cujo a qtde m�dia vendida � maior que 25;

SELECT 
	fkCod_produto
FROM 
	DetalhesPedidos
GROUP BY 
	fkCod_produto
	HAVING 
		AVG(quantidade) >25;

--Passo 3: Identificar o c�digo dos fornecedores destes produtos;
SELECT
	fkCod_fornecedor
FROM 
	produtos
WHERE
pkCod_produto IN(SELECT fkCod_produto FROM	DetalhesPedidos GROUP BY fkCod_produto	HAVING 	AVG(quantidade) >25);

--Passo 4: Listar o nome das empresas dos fornecedores.
SELECT 
	nome_Emp
FROM 
	fornecedores
WHERE
	pkCod_fornecedor IN (SELECT	fkCod_fornecedor FROM produtos  WHERE 
	pkCod_produto IN(SELECT fkCod_produto FROM	DetalhesPedidos GROUP BY fkCod_produto	HAVING 	AVG(quantidade) >25));
 






