-- subQueries 

/* Exemplo 01: Selecionar todos os registros da tabela produtos onde o campo preço unitário for maior ou
igual valor da média do campo preço unitário: */

SELECT *

FROM dbo.produtos

WHERE precoUnitario >= (SELECT	AVG(precoUnitario) AS MediaPrecoUnitario FROM dbo.produtos);

