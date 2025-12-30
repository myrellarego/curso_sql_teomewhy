--SUBQUERRY é uma querry dentro da query. Deve ser utilizado com cautela pq consome mta memoria pois faz 2 consultas. depende do volume de dados

--Lista de transações com o produto "Resgatar Ponei"

-- ao fazer essa consulta eu retorno uma outra tabela se eu fizesse uma consulta apenas com o SELECT ainda assim seria outra tabela. dessa forma eu posso fazer uma consulta dentro dessa consulta anterior eu coloco como uma condição dentro do WHERE o resultado de uma outra querry. 
-- a consulta que é executada primeiro é a consulta "de dentro"

SELECT *
FROM transacao_produto AS t1

WHERE t1.IdProduto IN (
    SELECT IdProduto
    FROM produtos
    WHERE DescCategoriaProduto = 'ponei'
);

-- em pt-br: retorno todos os dados da tabela 'transacao_produto' que tem o IdProduto igual a consulta de dentro do WHERE (que retorna o valor 15)
