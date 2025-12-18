-- SELECT - seleciona algo. não precisa de tabela

-- SELECT 'Olá mundo!'

-- selcione todas as colunas da tabela clientes: SELECT * FROM 'tabela' ->
-- SELECT * FROM clientes

-- selecione da tabela clientes apenas a coluna ID e Qtde de pontos

SELECT idCliente, 
    qtdePontos, 
    DtCriacao 

FROM clientes LIMIT 10;

-- para limitar apenas a 10 linhas, pega os primeiros 10
SELECT * FROM clientes LIMIT 10;


