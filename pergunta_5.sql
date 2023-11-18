-- Pergunta: Vendas por produto 
SELECT
    dd.clienteid,  -- Identificador do cliente
    dd.cliente,  -- Nome do cliente
    fd.produtoid,  -- Identificador do produto
    SUM(fd.quantidade) as quantidade_vendida,  -- Calcula a quantidade total vendida para cada cliente e produto
    SUM(fd.valor) as valor_total_vendido  -- Calcula o valor total vendido para cada cliente e produto
FROM
    fatodetalhes_dadosmodelagem fd
JOIN
    fatocabecalho_dadosmodelagem fc ON fd.cupomid = fc.cupomid  -- Junta detalhes de fato com informações do cabeçalho através do número da ordem de venda
JOIN
    dimensoes_dadosmodelagem dd ON fc.clienteid = dd.clienteid  -- Junta informações do cliente com o cabeçalho de fato
GROUP BY
    dd.clienteid, dd.cliente, fd.produtoid  -- Agrupa os resultados pelo identificador do cliente, nome do cliente e identificador do produto
ORDER BY
    quantidade_vendida DESC;  -- Ordena os resultados pela quantidade vendida em ordem decrescente
