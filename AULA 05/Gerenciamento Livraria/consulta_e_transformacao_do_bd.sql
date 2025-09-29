USE LIVRARIA;

-- ADIÇÃO DE LIVROS ACIMA DE 100 REAIS
INSERT INTO Livros (Preco, Quantidade, Editora, Titulo, Genero, Autor) VALUES
(120.00, 2, 'Luxo Literário', 'Atlas do Universo', 'Ciência', 'Marina Rocha'),
(150.50, 1, 'Edição de Colecionador', 'Obras Completas de Shakespeare', 'Clássico', 'William Shakespeare'),
(110.99, 3, 'Arte & Imagem', 'Museus do Mundo', 'Arte', 'Helena Martins'),
(200.00, 1, 'Tecnologia Avançada', 'Inteligência Artificial Hoje', 'Tecnologia', 'Roberto Silva'),
(125.75, 5, 'Editoras Premium', 'Fotografia Fine Art', 'Fotografia', 'Luciano Almeida');


-- QUANTIDADE DE LIVROS
SELECT COUNT(*) AS TOTAL_LIVROS
FROM LIVROS;

-- CONSULTAR LIVROS QUE COMEÇAM COM A E PREÇO ACIMA DE 100
SELECT TITULO, PRECO
FROM LIVROS
WHERE TITULO LIKE "A%" AND PRECO > 100;

-- QTT DE LIVROS VENDIDOS
-- PENSANDO QUE O ESTOQUE MÁXIMO É 30
SELECT 
    SUM(Quantidade) AS QTT_TOTAL,
    COUNT(*) AS TOTAL_LIVROS,
    (COUNT(*) * 30 - SUM(Quantidade)) AS DIFFERENCE
FROM Livros;

-- QUANTIDADE DE LIVROS EM ESTOQUE
SELECT SUM(QUANTIDADE) AS QTT_TOTAL
FROM LIVROS;

-- APAGAR O LIVRO COM CÓDIGO 5
DELETE FROM TITULO
WHERE ID = 5;

-- ALTERAR A TABELA LIVROS E INSERIR A COLUNA ANO_PUBLICACAO COM TIPO DE DADOS DATE
ALTER TABLE LIVROS
ADD ANO_PUBLICACAO DATE;