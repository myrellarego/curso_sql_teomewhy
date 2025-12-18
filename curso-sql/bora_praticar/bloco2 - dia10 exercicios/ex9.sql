--Listar todas as transações adicionando uma coluna nova sinalizando "alto", "medio" e "baixo" para o valor dos pontos [<10; <500; >=500]

SELECT idCliente,
        QtdePontos,

        CASE
            WHEN QtdePontos < 10 THEN "baixo"
            WHEN QtdePontos < 500 THEN "medio"
            ELSE "alto"
        END AS VolumePontos    

FROM transacoes

ORDER BY QtdePontos DESC