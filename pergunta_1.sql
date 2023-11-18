-- Pergunta: Valor total das vendas e dos fretes por produto e ordem de venda.
SELECT
    fd.cupomid AS OrdemDeVenda,  -- Número da ordem de venda
    fd.produtoid AS ProdutoID,    -- Identificador do produto
    SUM(fd.quantidade * fd.valor) AS ValorTotalVendas,  -- Calcula o valor total das vendas para cada produto
    SUM(fc.valorfrete) AS ValorTotalFretes  -- Calcula o valor total dos fretes para cada ordem de venda
FROM
    fatodetalhes_dadosmodelagem fd
JOIN
    fatocabecalho_dadosmodelagem fc ON fd.cupomid = fc.cupomid  -- Junta detalhes de fato com informações do cabeçalho através do número da ordem de venda
JOIN
    dimensoes_dadosmodelagem d ON fc.clienteid = d.clienteid  -- Junta informações do cliente com o cabeçalho de fato
GROUP BY
    fd.cupomid, fd.produtoid  -- Agrupa os resultados pelo número da ordem de venda e pelo identificador do produto
ORDER BY
    fd.cupomid, fd.produtoid;  -- Ordena os resultados pela ordem de venda e pelo identificador do produto
