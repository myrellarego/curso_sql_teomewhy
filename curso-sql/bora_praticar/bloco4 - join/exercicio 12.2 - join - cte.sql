-- 10. Como foi a curva de Churn do Curso de SQL?
-- churn: cancelamento. fixo o 1 dia e os dias seguintes vao ser em relação ao 1 dia

-- 1) filtrar só quem teve transação dia 25-08-2025

WITH tb_clientes_d1 AS (

SELECT DISTINCT idCliente

FROM transacoes

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-26'

),

-- agora vou restringir as transacoes somente para clientes do 1º dia

tb_join AS (
SELECT 
        substr(t2.DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT t1.idCliente) AS qtdeCliente,
        1.* count(DISTINCT t1.idCliente) / (SELECT count(*) FROM tb_clientes_d1) AS percentRetencao, -- peguei a coluna criada dividido pelo total de clientes do 1 dia (total dia 2/total dia 1...)
        1 - 1.* count(DISTINCT t1.idCliente) / (SELECT count(*) FROM tb_clientes_d1) AS churn

FROM tb_clientes_d1 AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

WHERE t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'

GROUP BY dtDia
)

SELECT * FROM tb_join
