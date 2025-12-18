--lista de pedidos realizados no final de semana--
SELECT idCliente,
        DtCriacao,
        datetime(substr(DtCriacao,1,10)) AS DtCriacaoNova,
        strftime('%w', datetime(substr(DtCriacao,1,10))) AS PosicaoDia
        
FROM transacoes

WHERE PosicaoDia IN ('0','6')





