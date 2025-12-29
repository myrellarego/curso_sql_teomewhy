--qual o produto com mais pontos transacionados?
SELECT IdProduto, 
        sum(vlProduto) AS totalPontos

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(vlProduto) DESC
