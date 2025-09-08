CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

CREATE TABLE LIVRO (
	COD INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    GENERO VARCHAR(20),
    TITULO VARCHAR(255),
    AUTOR VARCHAR(255),
    EDITORA VARCHAR(255),
    LANCAMENTO DATE
);

CREATE TABLE CLIENTE (
	COD_US INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(100),
    NASC DATE,
    CPF VARCHAR(14)
);

ALTER TABLE LIVRO
	ADD LSTATUS VARCHAR(255) NOT NULL DEFAULT 'DISPONIVEL';
    
ALTER TABLE CLIENTE
	ADD EMAIL VARCHAR(255);
    
INSERT INTO LIVRO (GENERO, TITULO, AUTOR, EDITORA, LANCAMENTO)
VALUES
('Ficção', 'A Viagem do Herói', 'José Silva', 'Editora Horizonte', '2015-06-10'),
('Romance', 'Amor em Paris', 'Ana Pereira', 'Editora Moderna', '2018-02-14'),
('Fantasia', 'O Dragão e a Espada', 'Carlos Souza', 'Editora Mágica', '2020-09-01'),
('Mistério', 'Segredos da Mansão', 'Beatriz Lima', 'Editora Mistério', '2019-10-30'),
('Biografia', 'Vida e Caminhos', 'Roberto Dias', 'Editora Saber', '2017-03-22'),
('Ficção Científica', 'Horizonte Perdido', 'Marcos Oliveira', 'Editora Alfa', '2021-01-12'),
('Romance', 'Noites em Veneza', 'Clara Nunes', 'Editora Moderna', '2016-07-05'),
('Fantasia', 'A Floresta Encantada', 'Paulo Machado', 'Editora Mágica', '2019-11-15'),
('Mistério', 'O Último Suspiro', 'Renata Gomes', 'Editora Mistério', '2020-05-23'),
('Biografia', 'Jornada de um Artista', 'Fernanda Castro', 'Editora Saber', '2018-08-19'),
('Ficção', 'O Destino das Estrelas', 'André Lima', 'Editora Horizonte', '2022-03-08'),
('Romance', 'Entre Sonhos e Realidade', 'Juliana Rocha', 'Editora Moderna', '2020-12-01'),
('Fantasia', 'Cavaleiros da Aurora', 'Leonardo Martins', 'Editora Mágica', '2021-09-09'),
('Mistério', 'O Enigma do Relógio', 'Patrícia Alves', 'Editora Mistério', '2017-04-14'),
('Biografia', 'Memórias de uma Vida', 'Ricardo Mendes', 'Editora Saber', '2016-06-30');

INSERT INTO CLIENTE (NOME, NASC, CPF, EMAIL)
VALUES
('Lucas Silva', '1985-03-12', '123.456.789-00', 'lucas.silva@email.com'),
('Ana Pereira', '1990-07-25', '987.654.321-11', 'ana.pereira@email.com'),
('Carlos Souza', '1978-11-03', '456.789.123-22', 'carlos.souza@email.com'),
('Beatriz Lima', '1988-01-17', '321.654.987-33', 'beatriz.lima@email.com'),
('Roberto Dias', '1992-05-30', '789.123.456-44', 'roberto.dias@email.com'),
('Marcos Oliveira', '1983-08-21', '147.258.369-55', 'marcos.oliveira@email.com'),
('Clara Nunes', '1995-02-10', '963.852.741-66', 'clara.nunes@email.com'),
('Paulo Machado', '1975-09-05', '258.369.147-77', 'paulo.machado@email.com'),
('Renata Gomes', '1987-12-19', '741.963.852-88', 'renata.gomes@email.com'),
('Fernanda Castro', '1991-04-23', '369.147.258-99', 'fernanda.castro@email.com'),
('André Lima', '1980-06-15', '852.741.963-00', 'andre.lima@email.com'),
('Juliana Rocha', '1993-10-29', '159.357.486-12', 'juliana.rocha@email.com'),
('Leonardo Martins', '1986-11-07', '753.951.456-34', 'leonardo.martins@email.com'),
('Patrícia Alves', '1989-03-14', '951.753.258-56', 'patricia.alves@email.com'),
('Ricardo Mendes', '1982-01-02', '357.159.852-78', 'ricardo.mendes@email.com');

UPDATE CLIENTE
SET NOME = 'Carlos Jose Souza'
WHERE COD_US = 3;

UPDATE LIVRO
SET LSTATUS = 'INDISPONÍVEL'
WHERE EDITORA = 'Editora Moderna';

-- DELETE FROM CLIENTE WHERE NASC <= 1980-01-01;
-- TRUNCATE LIVROS;

SELECT * FROM CLIENTE;
SELECT * FROM LIVRO;