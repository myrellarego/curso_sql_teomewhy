-- selecione todos os produtos que contem 'churn' no nome

SELECT * 
FROM produtos

/*WHERE DescNomeProduto = 'Churn_5pp' OR DescNomeProduto = 'Churn_2pp' OR DescNomeProduto = 'Churn_10pp'*/ 

-- WHERE DescNomeProduto IN ('Churn_5pp','Churn_2pp','Churn_10pp')

WHERE DescNomeProduto LIKE 'churn%' 
--obs: se for uma base muito grande, o custo é muito alto
