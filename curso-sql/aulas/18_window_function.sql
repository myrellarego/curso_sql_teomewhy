-- para saber a quantidade de transações durante os dias de curso, como posso fazer?

WITH tb_sumario_dias AS (

SELECT substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qntdeTransacao

FROM transacoes

WHERE DtCriacao >= '2025-08-25' 
AND DtCriacao < '2025-08-30'

GROUP BY dtDia
)

-- para criar uma coluna com os valores acumulados

SELECT *,
    sum(qntdeTransacao) OVER (ORDER BY dtDia) AS qntdeTransacaoAcm

FROM tb_sumario_dias
