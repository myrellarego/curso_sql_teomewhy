--SUM é uma função estatistica, ela "esmaga" a tabela e soma os valores

-- exemplo 1: quantos pontos tive em julho?
SELECT sum(QtdePontos)
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01';

-- exemplo 2: agora quero somar somente os valores positivos (tenho negativos também pq tenho a opção de trocar os pontos por algo)
SELECT sum(QtdePontos)
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01'
    AND QtdePontos > 0;

-- exemplo 3: quero ver em uma coluna todos os pontos e na outra somente os pontos positivos
SELECT 
    IdTransacao,
    QtdePontos, 
    CASE 
        WHEN QtdePontos > 0 THEN QtdePontos 
    END AS qtdePontosPositivos
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01';

-- exemplo 4: quero ver em uma coluna todos os pontos e na outra somente os pontos positivos e mais uma com os negativos
SELECT 
    IdTransacao,
    QtdePontos, 
    
    CASE 
        WHEN QtdePontos > 0 THEN QtdePontos 
    END AS qtdePontosPositivos,

    CASE 
        WHEN QtdePontos < 0 THEN QtdePontos 
    END AS qtdePontosNegativos

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01'
ORDER BY QtdePontos;

--exemplo 5: agora quero "esmagar" essa tabela, somar os valores das colunas, como faço?
SELECT 
    sum(QtdePontos), 
    
    sum(
    CASE 
        WHEN QtdePontos > 0 THEN QtdePontos 
    END) AS qtdePontosPositivos,

    sum(
    CASE 
        WHEN QtdePontos < 0 THEN QtdePontos 
    END) AS qtdePontosNegativos

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01'
ORDER BY QtdePontos;

--exemplo 6: e para contar a quantidade de resgistros negativos?
    SELECT
    sum(QtdePontos), 
    
    sum(
    CASE 
        WHEN QtdePontos > 0 THEN QtdePontos 
    END) AS qtdePontosPositivos,

    sum(
    CASE 
        WHEN QtdePontos < 0 THEN QtdePontos 
    END) AS qtdePontosNegativos,

    COUNT(
    CASE 
        WHEN QtdePontos < 0 THEN QtdePontos
    END) AS qtdeTransacoesNegativas

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01'
ORDER BY QtdePontos;