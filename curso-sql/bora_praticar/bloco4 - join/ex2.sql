--Em 2024 quantas transações de lovers tivemos?

SELECT 
        --t1.idCliente,
        --t2.IdProduto,
        t3.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.idTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01'
AND t1.DtCriacao < '2025-01-01'
--AND DescCategoriaProduto = 'lovers'

GROUP BY t3.DescCategoriaProduto
 --  p/ pegar quem tem menos de 1000
HAVING count(DISTINCT t1.IdTransacao) < 1000

ORDER BY count(DISTINCT t1.IdTransacao) DESC
