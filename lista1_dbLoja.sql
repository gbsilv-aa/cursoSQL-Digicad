/* Exercício Parte 04 – db_Loja

1. Listar o Código, Nome da Empresa, Nome do Contato, Pais e Telefone da tabela
Tbl_Fornecedores, banco de dados db_Loja, e classificar em ordem crescente por Pais. */


SELECT* FROM dbo.fornecedores;


SELECT 
		pkCod_fornecedor AS CODIGO, 
		nome_contato AS EMPRESA,
		nome_contato AS CONTATO,
		pais AS PAIS,
		telefone AS TELEFONE
		
		
		FROM
		 dbo.fornecedores
		 
		ORDER BY pais DESC;


		-- 2. Listar todos os clientes da tabela clientes cujo país não seja “Alemanha” ou “ Espanha”.

SELECT TOP 2 *
		
FROM dbo.Clientes;

SELECT
	pkCod_Cliente AS CODIGO,
	nome_Emp AS EMPRESA,
	pais AS PAIS


FROM 
	dbo.Clientes

	WHERE pais NOT IN ('alemanha', 'espanha')
;


--3.Listar todos os pedidos da tabela pedidos cujo data do pedido esteja entre 01/06/2017 e 30/06/2017:

SELECT TOP 2 *
		
FROM dbo.pedidos;

SELECT
	pknum_pedido AS PEDIDO,
	dataPedido AS DATA_PEDIDO
	

FROM 
	dbo.pedidos
WHERE dataPEdido BETWEEN '2017-06-01' AND '2017-06-30' 
;

--4.Listar todos os produtos da tabela produtos cujo preço esteja entre R$ 20,00 e R$ 50,00.

SELECT *
		
FROM dbo.produtos;

SELECT
	nome_produto AS PRODUTO,
	precoUnitario AS PRECO_UNITARIO
	

FROM 
	dbo.produtos

WHERE precoUnitario >=20 AND precoUnitario <=50;

--5. Listar todos os produtos da tabela produtos cuja categoria seja 2, 4 ou 6.

SELECT
	nome_produto AS PRODUTO,
	fkCod_categoria AS CATEGORIA
	

FROM 
	dbo.produtos

	WHERE fkCod_categoria IN (2,4,6)
	;

-- 6. Listar todos os clientes da tabela clientes cujo nom e do contato inicie com as letras “B”, “F” ou “S”.

SELECT TOP 2 *
		
FROM dbo.Clientes;

SELECT
	pkCod_Cliente AS CODIGO,
	nome_Emp AS EMPRESA,
	nome_contato AS NOME


FROM 
	dbo.Clientes

	WHERE  
	nome_contato LIKE 'B%' OR
	nome_contato LIKE 'F%' OR
	nome_contato LIKE 'S%'
	;


--7. Listar todos os clientes da tabela clientes cujo nom e do contato inicie com as letras entre “M” e “R”.

SELECT
	pkCod_Cliente AS CODIGO,
	nome_Emp AS EMPRESA,
	nome_contato AS NOME


FROM 
	dbo.Clientes

	WHERE  
	nome_contato LIKE '[M-R]%'
	
	;

	--8.Retornar os nomes e preços dos cinco primeiros produtos da tabela de produtos.

	SELECT TOP 5 
	nome_produto AS PRODUTO,
	precoUnitario AS PRECO
	

FROM 
	dbo.produtos;

	-- 5 MAIS CAROS

		SELECT TOP 5 
	nome_produto AS PRODUTO,
	precoUnitario AS PRECO
	

FROM 
	dbo.produtos 
	
	ORDER BY precoUnitario DESC;

	-- 5 MAIS BARATOS

			SELECT TOP 5 
	nome_produto AS PRODUTO,
	precoUnitario AS PRECO
	

FROM 
	dbo.produtos 
	
	ORDER BY precoUnitario ASC;
	   	  

	/* 9. Selecionar os Cargos da tabela de Funcionários, porém exibir apenas os registros distintos sem
repetições. */


SELECT TOP 2*

FROM dbo.funcionarios;



SELECT 

DISTINCT

cargo AS CARGO

FROM dbo.funcionarios

ORDER BY cargo DESC;