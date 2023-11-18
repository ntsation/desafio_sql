-- Pergunta: Vendas por cliente, cidade do cliente e estado.
SELECT
    dc.cliente AS Cliente,  -- Nome do cliente
    dc.cidade AS Cidade,  -- Nome da cidade do cliente
    dc.pais AS Estado,  -- Nome do país do cliente
    fc.data AS Data,  -- Data da venda
    fd.produtoid AS ProdutoID,  -- Identificador do produto
    fd.quantidade AS Quantidade,  -- Quantidade de produtos vendidos
    fd.valor AS Valor,  -- Valor total da venda
    fd.desconto AS Desconto,  -- Valor do desconto aplicado
    fd.custo AS Custo,  -- Custo total dos produtos vendidos
    fd.valorliquido AS ValorLiquido  -- Valor líquido da venda após desconto
FROM
    fatocabecalho_dadosmodelagem fc
JOIN
    dimensoes_dadosmodelagem dc ON fc.clienteid = dc.clienteid  -- Junta informações do cliente com o cabeçalho de fato
JOIN
    fatodetalhes_dadosmodelagem fd ON fc.cupomid = fd.cupomid  -- Junta detalhes de fato com informações do cabeçalho através do número da ordem de venda
