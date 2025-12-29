--qual cliente fez mais transações em 2024?
SELECT idCliente,
        count(*),
        count(DISTINCT IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2024-01-01' AND DtCriacao < '2025-01-01'
-- WHERE substr(DtCriacao, 1, 4) = '2024'

GROUP BY idCliente

ORDER BY count(*) DESC

LIMIT 1
