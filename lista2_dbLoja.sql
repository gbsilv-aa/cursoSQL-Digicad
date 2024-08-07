-- Exercício Parte 05 – db_Loja

-- 1. Criar uma lista com os nomes completos dos funcionários em letras maiúsculas.

/*  
UPPER - Uppercase - Letra Maiúsculas
LOWER - Lowercase - Letras Minusculas
*/
SELECT TOP 2* 

FROM dbo.funcionarios;


SELECT
	UPPER(nome + ' ' + sobrenome) AS NOME_COMPLETO

FROM 
dbo.funcionarios;

-----------------

SELECT
	LOWER(nome + ' ' + sobrenome) AS NOME_COMPLETO

FROM 
dbo.funcionarios;

-- 2. A quantidade de Pedidos emitidos na tabela Pedidos.

SELECT *

FROM dbo.pedidos;

SELECT 
	
	COUNT(pknum_pedido) AS QTD_PEDIDO
	

FROM dbo.pedidos;

-- 3. A quantidade de países cadastrados na tabela Pedidos sem repetição.


SELECT 

	COUNT (DISTINCT paisDestino) AS QTD_PAISES	

FROM dbo.pedidos;


-- 4. A soma dos valores de frete de todos os pedidos emitidos para o país Brasil.

SELECT
	paisDestino AS PAIS,
	SUM(frete) AS VALOR_FRETE

	FROM dbo.pedidos
	WHERE paisDestino = 'brasil'
	GROUP BY paisDestino;


	-- Quantidade de pedidos emitidos entre as data de 01-09-2015 a 30-09-2016.

	SELECT * 

	FROM dbo.pedidos;

	SELECT 

	COUNT( DISTINCT pknum_pedido) AS PEDIDOS_TOTAL

		FROM dbo.pedidos
		WHERE dataPedido BETWEEN '2015-09-01' AND '2016-09-30'
						;

-- 6. Quantidade de clientes da tabela clientes cujo país seja Argentina.

SELECT* 

FROM dbo.Clientes;

SELECT 
 pais AS PAIS,
 COUNT (nome_contato) AS NOME

 FROM dbo.Clientes
 WHERE pais = 'argentina'
GROUP BY pais
 ;

