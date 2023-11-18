-- Pergunta: Média de compras que um cliente faz.
SELECT
    AVG(total_compras) as media_compras_por_cliente  -- Calcula a média do número total de compras por cliente
FROM (
    SELECT
        clienteid,
        COUNT(clienteid) as total_compras  -- Conta o número total de compras para cada cliente
    FROM
        fatocabecalho_dadosmodelagem
    GROUP BY
        clienteid  -- Agrupa os resultados pelo identificador do cliente
) as subquery;  -- Subconsulta usada para calcular o total de compras por cliente
