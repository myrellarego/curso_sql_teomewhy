--CASE WHEN serve para condicionar, lembra o IF ELSE

--Quero dividir a minha tabela de clientes da seguinte forma:
-- 0 a 500 pontos -> Ponei
-- 501 a 1000 pontos -> Ponei Premium
-- 1001 a 5000 pontos -> Mago Aprendiz
-- 5001 a 10000 pontos -> Mago Mestre
-- 10001 pontos -> Mago Supremo

SELECT idCliente,
        QtdePontos,
            CASE
                WHEN QtdePontos <= 500 THEN 'Ponei'
                WHEN QtdePontos <= 1000 THEN 'Ponei Aprendiz'
                WHEN QtdePontos <= 5000 THEN 'Mago Aprendiz'
                WHEN QtdePontos <= 10000 THEN 'Mago Mestre'
                ELSE 'Mago Supremo'
            END AS NomeGrupo,

            CASE
                WHEN QtdePontos <= 1000 THEN 1
                ELSE 0
            END AS flPonei,

            CASE
                WHEN QtdePontos > 1000 THEN 1
                ELSE 0
            END AS flMago        

FROM clientes
ORDER BY qtdePontos DESC