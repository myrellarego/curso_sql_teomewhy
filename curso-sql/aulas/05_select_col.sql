--AS (alias) esse comando muda o nome da coluna

--substring pega parte de uma string

-- 1. selecione a coluna DtCriacao, cria uma coluna nova com os 19 primeiros elementos, depois uma coluna nova transformando em DateTime e por ultimo diz qual o numero do dia da semana

SELECT  IdCliente,

       QtdePontos,
       QtdePontos + 10 AS QtdePontosPlus10, 
       QtdePontos*2 AS QtdePontosEmDobro
        
        DtCriacao,

        substr(DtCriacao,1,19) AS dtSubString,

        datetime(substr(DtCriacao,1,19)) AS dtCriacaoNova,

        strftime('%w',datetime(substr(DtCriacao,1,19))) AS diaSemana

FROM clientes


