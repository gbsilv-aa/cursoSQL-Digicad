-- EXEMPLOS DE APLICAÇÕES HAVING E SUBQUERIES

USE dbLojas;

-- Exemplo 01: Total de frete da tabela pedidos dos países Alemanha e Brasil:
-- usando WHERE para colunas da tabela
SELECT 
		paisDestino AS Paises,
		SUM(frete) AS TotalFrete
	

FROM dbo.pedidos
WHERE paisDestino IN ('alemanha', 'brasil')
GROUP BY paisDestino

;

-- usando HAVING para funções virtuais.
SELECT 
		paisDestino AS Paises,
		SUM(frete) AS TotalFrete
FROM dbo.pedidos

GROUP BY paisDestino

HAVING paisDestino IN ('alemanha', 'brasil')
;


--OUTRO EXEMPLO DO HAVING = qtd total de pedidos por pais (listar os paises com mais de 100 pedidos)

SELECT 
		paisDestino AS Paises,
		COUNT(pknum_pedido) AS TotalPedidos
FROM dbo.pedidos

GROUP BY paisDestino

HAVING 
COUNT(pknum_pedido) > 100
;


-- Exemplo 02: Maior e Menor valor de Frete tabela pedidos por país cujo total dos fretes seja maior que R$ 5.000,00:

SELECT 
	paisDestino AS Paises,
	MAX(frete)	AS MaiorValor,
	MIN(frete)	AS MenorValor,
	SUM(frete)	AS TotalFrete

FROM 
	dbo.pedidos
GROUP BY 
	paisDestino

HAVING 
	SUM(frete) >5000
ORDER BY 
	TotalFrete DESC

;
-- ORDER BY SEMPRE NO FINAL DA CONSULTA, PARA CLASSIFICAR
