-- 10. Como foi a curva de Churn do Curso de SQL?
-- obs: Churn é uma métrica que indica a perda de clientes ou receita, é o inverso da retenção.
-- nessa base especifica cada ponto é um dia

-- uma das formas de fazer é contando quantos clientes eu tive por dia. 
-- 1) pego a "fatia" entre os dias 25 a 29/08/2025
-- 2) agrupo por dia contando quantos clientes tive em cada dia

SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT idCliente) AS qtdeCliente
FROM transacoes

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'

GROUP BY dtDia;

-- depois disso posso pegar o dataset e criar uma curva no sheet/power bi
-- pq não é a maneira mais correta? pq eu não garanto que o valor do dia 2 está contido no dia 1
-- então esses valores geram uma curva de publico do dia



