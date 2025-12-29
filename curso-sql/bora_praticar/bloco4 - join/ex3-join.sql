--Qual mês tivemos mais lista de presença assinada?

SELECT 
        substr(t1.DtCriacao, 1, 7) AS anoMes,
        t3.DescCategoriaProduto,
        count(DISTINCT t1.idTransacao) AS qtTransacao

FROM transacoes AS t1 --pego info da data

LEFT JOIN transacao_produto AS t2 -- consigo o id do produto através do IdTransacao
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3 -- consigo as categorias de produtos
ON t2.IdProduto = t3.IdProduto

WHERE DescNomeProduto = 'Lista de presença'

GROUP BY anoMes

ORDER BY qtTransacao DESC
