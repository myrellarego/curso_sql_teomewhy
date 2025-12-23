-- GROUP BY é uma função de agregação por CARACTERISTICAS
--exemplo 1: como descobrir a quantidade de vendas por !presente eu tive (Id = 11)?
--R: pode ser dessa forma
SELECT *
FROM transacao_produto 
WHERE IdProduto = 11;

-- e se eu quiser saber o de Ponei (Id = 15)?
SELECT *
FROM transacao_produto 
WHERE IdProduto = 15;

-- p/ não precisar mudar sempre, eu posso fazer um agrupamento dos produtos 

SELECT IdProduto,
COUNT(*)
FROM transacao_produto
GROUP BY IdProduto;

-- exemplo 2: como posso saber qual o usuáro que mais juntou pontos em julho de 2025?
SELECT idCliente,
    SUM(QtdePontos)
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY idCliente;

-- exemplo 3: e para saber a quantidade de transações?
SELECT idCliente,
    SUM(QtdePontos) AS somaPontos, 
    COUNT(IdTransacao) AS contagemTransacoes
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY idCliente
ORDER BY SUM(qtdePontos) DESC;

-- exemplo 4: e qual cliente teve mais transações?
SELECT idCliente,
    SUM(QtdePontos) AS somaPontos, 
    COUNT(IdTransacao) AS contagemTransacoes
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY idCliente
ORDER BY COUNT(IdTransacao) DESC;

-- exemplo 5: e para saber o top 10 por Quantidade de Pontos?
SELECT idCliente,
    SUM(QtdePontos) AS somaPontos, 
    COUNT(IdTransacao) AS contagemTransacoes
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY idCliente
ORDER BY SUM(qtdePontos) DESC
LIMIT 10;
