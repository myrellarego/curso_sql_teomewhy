-- AVG é a média
-- min - mínimo
-- max maximo 

--exemplo 1: como faço para descorbir a média da carteira de pontos dos clientes
SELECT avg(QtdePontos)
FROM clientes;

-- é o mesmo que:
SELECT avg(QtdePontos),
        1. * sum(QtdePontos) / count(idCliente) AS média,
        min(QtdePontos) AS ptsMinimoCarteira, --menor ponto
        max(QtdePontos) as ptsMaximoCarteira, --maior ponto
        sum(flTwitch) AS comTwitch, --quantidade de pessoas com twitch
        sum(flEmail) AS comEmail-- quantidade de pessoas com email
FROM clientes;

-- obs: o '1.' torna decimal o valor
-- para arredondar usamos o 'round'