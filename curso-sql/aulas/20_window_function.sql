-- De quanto em quanto tempo as pessoas voltam a assistir o teomewhy?
-- com o lag eu posso fazer a comparação dia a dia, subtraindo uma coluna da outra


WITH tb_cliente_dia AS (

SELECT 
        DISTINCT idCliente,
        substr(DtCriacao, 1, 10) AS dtDia
FROM transacoes

WHERE substr(DtCriacao, 1, 4) = '2025'

ORDER BY idCliente, dtDia

),

tb_lag AS (

SELECT *,
    lag(dtDia) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagDia

FROM tb_cliente_dia
),

tb_diff_dt AS (

SELECT *,
    julianday(dtDia) - julianday(lagDia) AS dtDiff

FROM tb_lag

),

avg_cliente AS (

SELECT idCliente,
        avg(dtDiff) AS mediaDiaRetorno

FROM tb_diff_dt

GROUP BY idCliente
)

-- para descobrir a média de quanto em quanto tempo os usuarios voltam:

SELECT avg(mediaDiaRetorno)
FROM avg_cliente

