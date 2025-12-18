-- ORDER BY serve para ordenar a tabela. Por padrão o comando sempre ordena de forma ASC (ascendente) então se eu quiser que seja de forma descendente preciso colocar o DESC como parâmetro.

-- 1. ordenar o top clientes com a maior quantidade de pontos de forma ascendente

SELECT *
FROM clientes
ORDER BY qtdePontos;

-- 2. ordenar o top 10 clientes com a maior quantidade de pontos de forma descendente 


SELECT *
FROM clientes
ORDER BY qtdePontos DESC;

-- 3. quem são os clientes mais antigos cadastrados? para descobrir ordeno pela data de criação

SELECT *
FROM clientes
ORDER BY DtCriacao;

-- 4. quem são os clientes mais antigos cadastrados e com a maior pontuação?

SELECT *
FROM clientes
ORDER BY DtCriacao ASC, qtdePontos DESC;

-- 5. quem são os clientes mais antigos com a maior pontuação e que tem Twitch?

SELECT *
FROM clientes
WHERE flTwitch = '1'
ORDER BY DtCriacao ASC, qtdePontos DESC;