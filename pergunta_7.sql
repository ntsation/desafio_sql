-- Pergunta: Média de produtos vendidos.
SELECT AVG(quantidade) AS media_produtos_vendidos  -- Calcula a média da quantidade de produtos vendidos na tabela de detalhes de fato
FROM fatodetalhes_dadosmodelagem;
