--como trazer para a tabela transação produto o nome do produto?
-- em pt-br: vou selecionar os dados da tabela TRANSACAO e quero ir na tabela de PRODUTOS, e através do ID retornar o nome do produto

SELECT *

FROM transacao_produto 

LEFT JOIN produtos 
ON transacao_produto.IdProduto = produtos.IdProduto;

--------------- com o INNER---------------

SELECT *

FROM transacao_produto

INNER JOIN produtos 
ON transacao_produto.IdProduto = produtos.IdProduto;

------ nomeando as tabelas (t1 e t2) ----------------

SELECT *

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

WHERE t2.IdProduto IS NULL;

------ para trazer somente a coluna 'DescProduto' da tabela 2 ao invés de todas as colunas ----------------

SELECT t1.*,  --trazendo todas as colunas da tabela 1
        t2.DescNomeProduto --trazendo só a descrição do nome da tabela 2

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto;




