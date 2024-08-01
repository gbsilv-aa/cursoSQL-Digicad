-- 1.	Selecione todos os registros da tabela inventory.

SELECT* FROM tbl_inventory;

--2.	Selecione apenas as colunas product_name e quantity da tabela inventory;

SELECT 
		product_name AS nomeProduto, 
		quantity AS quantidade
FROM	tbl_inventory;

-- 3.	Conte o número total de produtos em estoque;

SELECT COUNT (DISTINCT product_name) AS countTotalProdutos
FROM tbl_inventory; 


--4.	Somar o número total de produtos em estoque;

SELECT SUM(quantity) AS Soma_produtos
FROM tbl_inventory; 

-- 5 trazer produtos maiores que 150

SELECT product_name, quantity FROM tbl_inventory WHERE quantity > 150;

-- 6.	Selecione os produtos onde o preço de venda é menor que 30.

SELECT 
	product_name AS PRODUTOS, 
	sale_price as PRECO_VENDA 

FROM 
	tbl_inventory 
	
	WHERE sale_price < 30;

	-- 7.	Selecione os produtos fornecidos por um determinado fornecedor (por exemplo, supplier_id = 3).

	SELECT 
	product_name AS PRODUTOS, 
	supplier_id AS FORNECEDOR 

FROM 
	tbl_inventory 
	
	WHERE supplier_id  =  'Fadel-Huel' OR supplier_id  = 'Pouros-Littel';


	---- OUUUU

	SELECT 
	product_name AS PRODUTOS, 
	supplier_id AS FORNECEDOR 

FROM 
	tbl_inventory 
	
	WHERE supplier_id IN('Fadel-Huel' ,'Pouros-Littel');


--8.	Calcule o valor total do estoque (quantidade * preço de custo) de todos os produtos.


SELECT 

	product_name AS PRODUTOS,
	SUM(quantity * cost_price) AS ValorTotalEstoque

FROM tbl_inventory


GROUP BY 

	product_name;


	SELECT 

	product_name AS PRODUTOS,
	SUM(quantity) AS QUANTIDADE,
	SUM(cost_price) AS PRECO_PRODUTO

FROM tbl_inventory


GROUP BY 

	product_name;

--	9.	Selecione os produtos onde o preço de venda é pelo menos o dobro do preço de custo.

SELECT 

	product_name AS PRODUTOS,
	cost_price AS PRECO_CUSTO,
	sale_price AS PRECO_VENDA

	
FROM tbl_inventory

WHERE 
sale_price >= cost_price *1.75;



