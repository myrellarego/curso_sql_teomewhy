--Clientes mais antigos tem mais frequência de transação?
SELECT t1.idCliente,
        julianday('now')-julianday(substr(t1.DtCriacao,1,19)) AS DifDatas,
        count(DISTINCT t2.IdTransacao) AS qtdeTransacoes

FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.IdCliente = t2.idCliente

GROUP BY t1.idCliente, DifDatas

ORDER BY count(DISTINCT t2.IdTransacao) DESC
