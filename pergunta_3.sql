-- Pergunta: Quantidade e valor das vendas por dia, mês e ano.
SELECT
    STR_TO_DATE(fc.data, '%d/%m/%Y') AS data,  -- Converte a data para o formato de data do MySQL
    SUM(fd.quantidade) AS quantidade_total,  -- Calcula a quantidade total de produtos vendidos para cada data
    SUM(fd.valorliquido) AS valor_total  -- Calcula o valor total de vendas líquidas para cada data
FROM
    fatodetalhes_dadosmodelagem fd
JOIN
    fatocabecalho_dadosmodelagem fc ON fd.cupomid = fc.cupomid  -- Junta detalhes de fato com informações do cabeçalho através do número da ordem de venda
GROUP BY
    STR_TO_DATE(fc.data, '%d/%m/%Y');  -- Agrupa os resultados pela data convertida
