CREATE DATABASE LIVRARIA;
USE LIVRARIA;

CREATE TABLE Livros (
Cod_Livro int auto_increment PRIMARY KEY,
Preco decimal(5, 2),
Quantidade int,
Editora varchar(100),
Titulo varchar(100),
Genero varchar(100),
Autor varchar(100)
);

CREATE TABLE Vendas (
Cod_Vendas int auto_increment PRIMARY KEY,
Quantidade int(10),
Data_vendas Date,
Valor_total decimal(10,2),
FK_Cod_Livro int,
FOREIGN KEY(FK_Cod_Livro) REFERENCES Livros (Cod_Livro)
);

CREATE TABLE Clientes (
CPF varchar(14) PRIMARY KEY,
Data_de_nascimento Date,
Email varchar(100),
Nome_Clientes varchar(100)
);

CREATE TABLE Autores (
Cod_Autor int auto_increment PRIMARY KEY,
Nacionalidade varchar(100),
Nome varchar(100),
Data_de_Nascimento Date,
FK_Cod_Livro int,
FOREIGN KEY(FK_Cod_Livro) REFERENCES Livros (Cod_Livro)
);

CREATE TABLE Editoras (
Cod_Editora int auto_increment PRIMARY KEY,
Contato varchar(100),
Nome_Editora varchar(100),
Cidade varchar(100),
Telefone varchar(17),
Endereco varchar(100),
CNPJ varchar(18),
FK_Cod_Livro int,
FOREIGN KEY(FK_Cod_Livro) REFERENCES Livros (Cod_Livro)
);

CREATE TABLE Compram (
FK_CPF varchar(14),
FK_Cod_Vendas int,
FOREIGN KEY(FK_CPF) REFERENCES Clientes (CPF),
FOREIGN KEY(FK_Cod_Vendas) REFERENCES Vendas (Cod_Vendas)
);

INSERT INTO Livros (Preco, Quantidade, Editora, Titulo, Genero, Autor) VALUES
(39.90, 12, 'Editora Aurora', 'O Último Sol', 'Ficção Científica', 'Carlos Mendes'),
(24.50, 5, 'Letras Vivas', 'Amor em Versos', 'Romance', 'Mariana Costa'),
(59.99, 3, 'Mundo Saber', 'História do Japão', 'História', 'Akira Tanaka');

-- Inserindo Clientes
INSERT INTO Clientes (CPF, Data_de_nascimento, Email, Nome_Clientes) VALUES
('123.456.789-00', '1990-05-12', 'ana.silva@email.com', 'Ana Silva'),
('987.654.321-11', '1985-08-25', 'joao.souza@email.com', 'João Souza');

-- Inserindo Vendas
INSERT INTO Vendas (Quantidade, Data_vendas, Valor_total, FK_Cod_Livro) VALUES
(2, '2025-09-15', 79.80, 1), -- 2x O Último Sol
(1, '2025-09-16', 24.50, 2), -- 1x Amor em Versos
(3, '2025-09-17', 179.97, 3); -- 3x História do Japão

-- Inserindo Autores
INSERT INTO Autores (Nacionalidade, Nome, Data_de_Nascimento, FK_Cod_Livro) VALUES
('Brasileiro', 'Carlos Mendes', '1975-03-20', 1),
('Brasileira', 'Mariana Costa', '1988-11-02', 2),
('Japonesa', 'Akira Tanaka', '1960-07-14', 3);

-- Inserindo Editoras
INSERT INTO Editoras (Contato, Nome_Editora, Cidade, Telefone, Endereco, CNPJ, FK_Cod_Livro) VALUES
('contato@aurora.com', 'Editora Aurora', 'São Paulo', '(11) 3333-4444', 'Rua das Flores, 100', '12.345.678/0001-90', 1),
('vivas@letras.com', 'Letras Vivas', 'Rio de Janeiro', '(21) 2222-5555', 'Av. Atlântica, 200', '98.765.432/0001-55', 2),
('info@saber.com', 'Mundo Saber', 'Curitiba', '(41) 1111-6666', 'Rua Cultura, 300', '11.222.333/0001-77', 3);

-- Inserindo relação de compras (Clientes -> Vendas)
INSERT INTO Compram (FK_CPF, FK_Cod_Vendas) VALUES
('123.456.789-00', 1),
('123.456.789-00', 2),
('987.654.321-11', 3);

se