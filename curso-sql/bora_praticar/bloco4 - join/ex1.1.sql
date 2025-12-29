--Qual categoria tem mais produtos vendidos?

--Utilizando o LEFT JOIN---
SELECT 
        t2.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao)

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto

ORDER BY count(DISTINCT t1.IdTransacao) DESC;

--Para utilizar o RIGHT JOIN posso "trocar" a posição das tabelas
--obs: o SQLite não aceita o comando RIGHT JOIN

SELECT t1.DescCategoriaProduto,
        count(DISTINCT t2.IdTransacao)
FROM produtos AS t1

LEFT JOIN transacao_produto AS t2
ON t2.IdProduto = t1.IdProduto 

GROUP BY t1.DescCategoriaProduto

ORDER BY count(DISTINCT t2.IdTransacao) DESC;

--observe que utilizando o RIGHT JOIN (ou no nosso caso mudando
-- a tabela da esquerda - que fica junto com o FROM) o NULL some
-- e aparece o "food"
