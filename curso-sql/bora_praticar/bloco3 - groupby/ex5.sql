--qual o valor médio de pontos por dia?

SELECT  sum(QtdePontos) AS totalPontos,
        
        count(DISTINCT(substr(DtCriacao,1,10))) AS quantidadeDiasDistintos,        
        
        sum(QtdePontos) / count(DISTINCT(substr(DtCriacao,1,10))) AS avgPontosDia

FROM transacoes

WHERE qtdePontos>0;

-----------ou-----------------
--obs: o 1 ordena pela primeira coluna do SELECT

SELECT substr(DtCriacao,1,10) AS dtDia,
       avg(QtdePontos) AS avgPontosDia
FROM transacoes

WHERE qtdePontos>0

GROUP BY 1
ORDER BY 1;

