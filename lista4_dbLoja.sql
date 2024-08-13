-- subQueries 

/* Exemplo 01: Selecionar todos os registros da tabela produtos onde o campo pre�o unit�rio for maior ou
igual valor da m�dia do campo pre�o unit�rio: */

SELECT *

FROM dbo.produtos

WHERE precoUnitario >= (SELECT	AVG(precoUnitario) AS MediaPrecoUnitario FROM dbo.produtos);

