-- Como saber o acumulado de transação das pessoas durante o curso?

-- 1) primeiro a quantidade de transações durante o curso

WITH transacoes_curso_sql AS(
    SELECT *

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
),

-- 2) agora quero contabilizar por pessoa por dia

transacoes_curso_sql_por_pessoa_dia AS(

    SELECT idCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY idCliente, dtDia
),

--3) agora quero ter uma visao acumulada por pessoa

tb_acm AS (

    SELECT *,
        sum(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS Acm --pq quero saber o acumulado por cliente ordenada pela data
    FROM transacoes_curso_sql_por_pessoa_dia

),

--4) e se eu quiser saber a diferença de um dia para o outro, qual o % em relação ao dia anterior (entre o proprio cliente)?

tb_lag AS (

    SELECT *,
        sum(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS Acm,
        lag(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagTransacao --no lag eu "empurro" pra baixo os valores
    FROM transacoes_curso_sql_por_pessoa_dia

)

SELECT *,
    1.* qtdeTransacao / lagTransacao

FROM tb_lag;

-- SELECT 1. * lagTransacao / qtdeTransacao
-- FROM tb_lag 
