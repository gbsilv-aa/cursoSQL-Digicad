SELECT*
FROM produtos;

/* Ex. 1 Listar os produtos da tabela produtos onde deverá aparecer o código do Produto, nome do produto, 
e o nome da categoria*/

SELECT* 
FROM categorias;

SELECT 
	PRODUTOS.pkCod_produto	AS Codigo,
	PRODUTOS.nome_produto	AS NomeProduto,
	PRODUTOS.precoUnitario	AS PrecoUnitario,
	CATEGORIAS.nome_categoria AS NomeCategoria
FROM 
	produtos AS PRODUTOS
LEFT JOIN categorias AS CATEGORIAS ON PRODUTOS.fkCod_categoria = CATEGORIAS.pkCod_categoria;

/* Exemplo 02: Listar o número de pedidos por Funcionário: */

SELECT*
FROM pedidos;

SELECT
fkCod_funcionario,
COUNT(pknum_pedido) AS Pedido
FROM pedidos
GROUP BY fkCod_funcionario ;

------------------------------
SELECT
	pkCod_funcionario AS CodFuncionario,
	nome AS NomeFuncionario
FROM funcionarios AS FUNCIONARIOS;
-----------------------------

SELECT
	F.nome AS NomeFuncionario,
	COUNT(P.pknum_pedido) AS QtdPedidos
FROM 
	funcionarios AS F
INNER JOIN 
	pedidos AS P ON P.fkCod_funcionario = F.pkCod_funcionario
GROUP BY 
	F.nome
ORDER BY 
	QtdPedidos;

/*Ex. 03 Liste os nomes dos produtos, a quantidade em estoque e a quantidade pedida em todos os pedidos.

TABELA PRODUTOS:
 - nome do produto
 - Unidades em Estoque

*/

/*TABELA DETALHES DO PEDIDO;
 - fkCodProduto
 - Qantidade
 */


 SELECT*
FROM DetalhesPedidos;

 SELECT*
FROM categorias;

 SELECT*
FROM fornecedores;

 SELECT*
FROM transportadoras;

 SELECT*
FROM produtos;

 SELECT*
FROM pedidos;
------------------------------------------------------------
 SELECT
	PRODUTO.nome_produto AS NomeProduto,
	PRODUTO.unidadesEmEstoque AS QtdEstoque,
	SUM(DTpedidos.quantidade) AS QtdVendida
 FROM 
	produtos AS PRODUTO
	JOIN 
	DetalhesPedidos AS DTPedidos ON PRODUTO.pkCod_produto = DTPedidos.fkCod_produto
	
	GROUP BY PRODUTO.unidadesEmEstoque,PRODUTO.nome_produto;

/* Ex. 04 Encontre os nomes das transportadoras e o total de frete cobrado por cada uma */

SELECT
	T.nome_Emp AS NomeTransportadora,
	SUM(P.frete) AS TotalFrete
	
 FROM 
	transportadoras AS T
	JOIN 
	pedidos AS P ON P.fkCod_transportadora = T.pkCod_transportadora
	
	GROUP BY T.nome_Emp;


/* Ex. 05 Liste os nomes dos produtos, o nome da categoria a que pertencem e o nome da empresa fornecedora*/

SELECT
	P.nome_produto AS NomeProduto,
	C.nome_categoria AS NomeCategoria,
	F.nome_Emp AS NomeFornecedor
 FROM 
	produtos AS P
	JOIN 
	categorias AS C ON P.fkCod_categoria = C.pkCod_categoria
		JOIN 
	fornecedores AS F ON F.pkCod_fornecedor = P.fkCod_fornecedor;

/* Ex. 4 Liste o nome dos funcionarios e os cargos dos contatos dos clientes para os quais eles realizaram pedidos */

SELECT 
	F.nome AS NomeFuncionario,
	C.nome_Emp AS Empresa,
	C.cargo_contato AS CargoContato

FROM pedidos AS P
JOIN funcionarios AS F ON P.fkCod_funcionario  = F.pkCod_funcionario
JOIN Clientes AS C ON C.pkCod_Cliente = P.fkCod_cliente;

----------------------------
SELECT 
	F.nome AS NomeFuncionario,
	C.nome_Emp AS Empresa,
	C.cargo_contato AS CargoContato

FROM pedidos AS P
JOIN funcionarios AS F ON P.fkCod_funcionario  = F.pkCod_funcionario
JOIN Clientes AS C ON C.pkCod_Cliente = P.fkCod_cliente;


