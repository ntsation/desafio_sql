-- Pergunta: Lucro dos meses.
SELECT
    DATE_FORMAT(STR_TO_DATE(fc.data, '%d/%m/%Y'), '%Y-%m') AS mes,  -- Converte a data para o formato de ano e mês do MySQL
    SUM(fd.valor - fd.custo) AS lucro_mensal  -- Calcula o lucro mensal, subtraindo o custo do valor de venda para cada mês
FROM
    fatodetalhes_dadosmodelagem fd
JOIN
    fatocabecalho_dadosmodelagem fc ON fd.cupomid = fc.cupomid  -- Junta detalhes de fato com informações do cabeçalho através do número da ordem de venda
GROUP BY
    mes;  -- Agrupa os resultados pelo mês
