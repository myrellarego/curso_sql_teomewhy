-- 12. Dentre os clientes de janeiro/2025, quantros assistiram o curso de SQL?

-- 1) clientes do mês de janeiro de 2025

WITH tb_clientes_janeiro AS (

    SELECT DISTINCT IdCliente AS clienteJaneiro

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'

),

-- 2) clientes do curso de sql

tb_clientes_sql AS (

    SELECT DISTINCT IdCliente AS clienteSQL

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

),

-- 3) join entre as tabelas para trazer os clientes de janeiro e os do curso de sql

tb_join AS (

    SELECT *

    FROM tb_clientes_janeiro AS t1

    LEFT JOIN tb_clientes_sql AS t2
    ON t1.clienteJaneiro = t2.clienteSQL

)

-- 4) contagem

SELECT count(DISTINCT clienteJaneiro),
        count(DISTINCT clienteSQL)

FROM tb_join



-- outra forma de fazer seria:

-- WITH tb_clientes_janeiro AS (

--     SELECT DISTINCT IdCliente

--     FROM transacoes

--     WHERE DtCriacao >= '2025-01-01'
--     AND DtCriacao < '2025-02-01'

-- ),

-- SELECT count(DISTINCT t1.cliente),
--         count(DISTINCT t2.cliente)

-- FROM tb_clientes_janeiro AS t1

-- LEFT JOIN transacoes AS t2 
-- ON t1.idCliente = t2.idCliente
-- AND DtCriacao >= '2025-08-25'
-- AND DtCriacao < '2025-08-30' -- busca as transações batendo cliente por cliente porem nas datas especificada
