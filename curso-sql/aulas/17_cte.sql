-- CTE: COMMON TABLE EXPRESSION. começa com o WITH coloca o nome do que quer representar e pod ir adicionando outras e depois pode fazer o cruzamento

--Dos clientes que começaram SQL no primeiro dia (2025-08-25), quantos chegaram ao 5º dia?

---------------------------------JEITO MOROSO----------------------
-- SELECT count(DISTINCT idCliente)
-- FROM transacoes AS t1

-- WHERE t1.idCliente IN (
--     SELECT DISTINCT(idCliente)
--     FROM transacoes
--     WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
-- )

-- AND substr(DtCriacao, 1, 10) = '2025-08-29'
-- ;



---------------------------------JEITO PERFORMATICO----------------
-- 1º descobrir os clientes que estavam no dia 25/08/2025
-- 2º nomear essa tabela (consulta) utilizando o WITH
-- 3º retornar a tabela (consulta) utilizando SELECT * FROM
-- 4º criar outra tabela temporaria selecionando os clientes do dia 29/08/2025


WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_cliente_ultimo_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'
)

SELECT * 
FROM tb_cliente_primeiro_dia AS t1

LEFT JOIN tb_cliente_ultimo_dia as t2
ON t1.IdCliente = t2.IdCliente
;

--posso tbm nomear a ultima consulta e retornar ela
WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
),

tb_cliente_ultimo_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'
),

tb_join AS (
    SELECT t1.IdCliente AS primeiroCliente, --renomeei pois as colunas tem o mesmo nome
            t2.IdCliente AS ultimoCliente

    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia as t2
    ON t1.IdCliente = t2.IdCliente
    )

SELECT count(primeiroCliente),
        count(ultimoCliente),
        1. * count(ultimoCliente) / count(primeiroCliente)

FROM tb_join;
