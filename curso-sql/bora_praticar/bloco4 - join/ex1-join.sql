--Exmplo: Qual categoria tem mais produtos vendidos?
--em pt-br: a categoria tenho na tabela de produtos, os mais vendidos tenho na tabela de transação produtos

-- tabela de transações dos produtos + tabela prdutos---

SELECT t1.idTransacao,
        t2.DescCategoriaProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto;

---- agora vou agrupar por categoria de produtos contando quantas transações teve cada categoria --

SELECT 
        t2.DescCategoriaProduto,
        count(DISTINCT t1.idTransacao)

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto

ORDER BY count(DISTINCT t1.idTransacao) DESC;
