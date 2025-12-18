--COUNT é uma função de agragção, ela "esmaga" a tabela e conta quantas linhas tem

--exemplo: quantas linhas tem na tabela de clientes

SELECT count(*)
FROM clientes

--obs1: o COUNT(*) considera todas as linhas e todas as colunas
--obs2: é possível utilizar o COUNT(1), ele "cria" uma coluna com varios "1" e conta quantos tem
--obs3: para contar uma coluna específica basta colocar o nome da coluna (campo) dentro do COUNT. mas, quando se trata de uma coluna específica, é feita a análise de nulos. toda coluna é percorrida, ou seja, é mais "custoso".