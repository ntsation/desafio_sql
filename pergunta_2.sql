-- Pergunta: Valor de venda por tipo de produto.
SELECT
    fd.produtoid,  -- Identificador do produto
    SUM(fd.valor) AS ValorDeVenda  -- Calcula o valor total de vendas para cada produto
FROM
    fatodetalhes_dadosmodelagem fd
JOIN
    fatocabecalho_dadosmodelagem fc ON fd.cupomid = fc.cupomid  -- Junta detalhes de fato com informações do cabeçalho através do número da ordem de venda
JOIN
    dimensoes_dadosmodelagem dd ON fc.clienteid = dd.clienteid  -- Junta informações do cliente com o cabeçalho de fato
GROUP BY
    fd.produtoid;  -- Agrupa os resultados pelo identificador do produto
