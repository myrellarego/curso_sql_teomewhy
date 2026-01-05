-- 11. Quem iniciou o curso no primeiro dia (2025-08-25), em média assistiu quantas aulas?

-- selecionar todos os clientes que começaram no primeiro dia. os clientes precisam ser distintos

-- 1) quem participou da primeira aula?
WITH tb_prim_dia AS (

    SELECT DISTINCT IdCliente AS IdCliente1dia
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) = '2025-08-25'

),

-- descobrir a quantidade de transacoes durante os dias de curso. para isso pego o cliente e definindo os dias que ele esteve presente. essa consulta dá uma visao do inicio ao fim do curso
-- 2) quem participou do curso inteiro?
tb_dias_curso AS (

    SELECT  DISTINCT
            idCliente AS IdClienteDias,
            substr(DtCriacao, 1, 10) AS presenteDia
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
    ORDER BY idCliente, presenteDia

),

-- agora vou pegar apenas as pessoas que estiveram no 1º dia e eu busco quais outros dias ela apareceu e por ultimo agrupo contando quantos dias cada cliente esteve
-- 3) contando quantas vezes quem participou do primeiro dia voltou
tb_cliente_dias AS (

SELECT t1.IdCliente1dia,
        count(DISTINCT t2.presenteDia) AS qtdDeDiasPresente

FROM tb_prim_dia AS t1

LEFT JOIN tb_dias_curso AS t2
ON t1.IdCliente1dia = t2.IdClienteDias

GROUP BY t1.IdCliente1dia

)

-- agora, por fim, posso descobrir a média de dias
-- 3) calculo da média 

SELECT avg(qtdDeDiasPresente),
       max(qtdDeDiasPresente),
       min(qtdDeDiasPresente)
FROM tb_cliente_dias
