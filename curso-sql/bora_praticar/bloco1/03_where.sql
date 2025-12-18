---ex 3: selecione todos clientes com mais de 500 pontos--
SELECT * 

FROM clientes

WHERE qtdePontos > 500;

---- selecionando apenas 2 colunas---
SELECT idCliente, QtdePontos 

FROM clientes

WHERE qtdePontos > 500;



