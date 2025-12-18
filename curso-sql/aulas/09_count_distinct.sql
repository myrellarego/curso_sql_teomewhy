--DISTINCT trás os registros únicos, distintos, de uma coluna.

--exemplo: retorne as linhas distintas entre das colunas FlTwitch e FlEmail

SELECT DISTINCT FlTwitch, FlEmail
FROM clientes;

--exemplo: quantos clientes  distintos tenho na tabela clientes

SELECT COUNT(DISTINCT idCliente)
FROM clientes;

--exemplo: qual a quantidade de transações em julho de 2025?
SELECT 
        COUNT(*)
FROM transacoes
WHERE DtCriacao >='2025-07-01' AND DtCriacao<'2025-08-01'
ORDER BY DtCriacao DESC;

--exemplo: quantos clientes transacionaram em julho de 2025?

SELECT 
    count(idCliente)
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND '2025-08-01'
ORDER BY DtCriacao DESC;