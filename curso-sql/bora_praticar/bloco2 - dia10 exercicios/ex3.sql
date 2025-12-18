--lista de clientes com 0 pontos--
SELECT idCliente,
        QtdePontos

FROM transacoes

WHERE QtdePontos = 0