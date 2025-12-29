-- Quais clientes mais perderam pontos por Lover?
SELECT t1.IdCliente,
        sum(t1.QtdePontos) AS totalPontos,
        t3.DescCategoriaProduto
FROM transacoes AS t1 --IdCliente

LEFT JOIN transacao_produto as t2
ON t1.IdTransacao = t2.IdTransacao --QtdePontos

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCategoriaProduto = 'lovers' 

GROUP BY t1.IdCliente

ORDER BY sum(t1.QtdePontos)

LIMIT 5
