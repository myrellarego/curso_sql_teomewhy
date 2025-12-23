-- O HAVING serve para "puxar"/filtrar após o agrupamento
-- o HAVING é o WHERE do group by, é o filtro da agregação
--exemplo: como selecionar apenas os clientes que tiveram a partir de 4000 pontos?
SELECT idCliente,
    SUM(QtdePontos) AS somaPontos, 
    COUNT(IdTransacao) AS contagemTransacoes
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY idCliente
HAVING somaPontos >= 4000
ORDER BY SUM(qtdePontos) DESC
LIMIT 10;
