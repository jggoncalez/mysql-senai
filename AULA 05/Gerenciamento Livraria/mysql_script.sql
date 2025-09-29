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

-- Mais Livros
INSERT INTO Livros (Preco, Quantidade, Editora, Titulo, Genero, Autor) VALUES
(42.00, 10, 'Horizonte Aberto', 'As Crônicas do Vento', 'Fantasia', 'Lucas Amaral'),
(35.75, 7, 'Palavra Livre', 'Sombras da Cidade', 'Suspense', 'Fernanda Ribeiro'),
(48.90, 15, 'Saber Infinito', 'Matemática Divertida', 'Educação', 'Rafael Lima'),
(27.30, 20, 'Vida Nova', 'Culinária para Todos', 'Culinária', 'Patrícia Gomes'),
(69.99, 4, 'Clássicos Eternos', 'Odisseia Grega', 'Clássico', 'Homero Trad. Silva');

-- Mais Clientes
INSERT INTO Clientes (CPF, Data_de_nascimento, Email, Nome_Clientes) VALUES
('321.654.987-22', '1992-12-01', 'carla.mendes@email.com', 'Carla Mendes'),
('741.852.963-33', '2000-03-15', 'pedro.almeida@email.com', 'Pedro Almeida'),
('159.753.486-44', '1978-10-10', 'lucia.ferreira@email.com', 'Lúcia Ferreira');

-- Mais Vendas
INSERT INTO Vendas (Quantidade, Data_vendas, Valor_total, FK_Cod_Livro) VALUES
(1, '2025-09-18', 42.00, 4), -- 1x As Crônicas do Vento
(2, '2025-09-19', 71.50, 5), -- 2x Sombras da Cidade
(5, '2025-09-20', 244.50, 6), -- 5x Matemática Divertida
(3, '2025-09-21', 81.90, 7), -- 3x Culinária para Todos
(1, '2025-09-22', 69.99, 8); -- 1x Odisseia Grega

-- Mais Autores
INSERT INTO Autores (Nacionalidade, Nome, Data_de_Nascimento, FK_Cod_Livro) VALUES
('Brasileiro', 'Lucas Amaral', '1982-05-11', 4),
('Brasileira', 'Fernanda Ribeiro', '1990-09-09', 5),
('Brasileiro', 'Rafael Lima', '1970-01-23', 6),
('Brasileira', 'Patrícia Gomes', '1985-06-18', 7),
('Grego', 'Homero (trad. Silva)', '1900-01-01', 8);

-- Mais Editoras
INSERT INTO Editoras (Contato, Nome_Editora, Cidade, Telefone, Endereco, CNPJ, FK_Cod_Livro) VALUES
('contato@horizonte.com', 'Horizonte Aberto', 'Belo Horizonte', '(31) 3333-7777', 'Rua Ventos, 400', '22.111.333/0001-44', 4),
('info@palavra.com', 'Palavra Livre', 'Porto Alegre', '(51) 2222-8888', 'Av. Sombras, 500', '33.222.444/0001-55', 5),
('atendimento@saberinfinito.com', 'Saber Infinito', 'Florianópolis', '(48) 9999-0000', 'Rua Matemática, 600', '44.333.555/0001-66', 6),
('contato@vidanova.com', 'Vida Nova', 'Salvador', '(71) 8888-1234', 'Rua Culinária, 700', '55.444.666/0001-77', 7),
('classicos@eternos.com', 'Clássicos Eternos', 'Recife', '(81) 7777-5678', 'Av. Grega, 800', '66.555.777/0001-88', 8);

-- Mais Compras
INSERT INTO Compram (FK_CPF, FK_Cod_Vendas) VALUES
('321.654.987-22', 4),
('741.852.963-33', 5),
('741.852.963-33', 6),
('159.753.486-44', 7),
('321.654.987-22', 8);

-- 15 Livros (assumindo que já existem registros até o ID 8; estes serão 9..23)
INSERT INTO Livros (Preco, Quantidade, Editora, Titulo, Genero, Autor) VALUES
(29.90, 12, 'Aurora 2', 'Noite de Neblina', 'Ficção', 'Marcos Teixeira'),
(54.00, 6, 'Horizonte 2', 'A Máquina do Tempo', 'Ficção Científica', 'Helena Costa'),
(18.50, 30, 'Pequenos Leitores', 'Aprendendo a Contar', 'Infantil', 'Clara Souza'),
(44.90, 8, 'Maré Alta', 'Ventos do Norte', 'Aventura', 'Roberto Nunes'),
(39.00, 10, 'Estilo Livre', 'Poemas ao Vento', 'Poesia', 'Letícia Duarte'),
(32.75, 14, 'Código Aberto', 'Introdução ao Python', 'Tecnologia', 'Mateus Rocha'),
(26.40, 18, 'Saberes', 'Jardinagem Urbana', 'Hobby', 'Beatriz Lobo'),
(49.90, 5, 'Capa Dura', 'Segredos da Cozinha', 'Culinária', 'Marcos Vilar'),
(21.99, 22, 'Infanto', 'Brincadeiras de Rua', 'Infantil', 'Sonia Reis'),
(65.00, 3, 'Mitos', 'Dragões e Lendas', 'Fantasia', 'Eduardo Faria'),
(15.00, 40, 'Pocket', 'Diário de Bolsos', 'Contos', 'Ana Paula'),
(72.90, 2, 'Ensino', 'Química Fácil', 'Educação', 'Dr. Paulo Meireles'),
(28.80, 16, 'Verbo', 'Histórias de Bairro', 'Realismo', 'Rita Moreira'),
(34.50, 11, 'Tecno', 'Redes e Protocolos', 'Tecnologia', 'Sergio Pinto'),
(55.25, 7, 'Clássicos 2', 'Teatro Moderno', 'Drama', 'Luiza Amaral');

-- 15 Clientes
INSERT INTO Clientes (CPF, Data_de_nascimento, Email, Nome_Clientes) VALUES
('012.345.678-90','1995-02-14','marcelo.alves@email.com','Marcelo Alves'),
('223.344.556-77','1980-07-30','juliana.costa@email.com','Juliana Costa'),
('334.556.778-88','1999-11-05','anderson.moraes@email.com','Anderson Moraes'),
('445.667.889-99','1972-04-22','paula.santos@email.com','Paula Santos'),
('556.778.990-00','1988-12-12','ricardo.neto@email.com','Ricardo Neto'),
('667.889.001-11','2001-06-06','isabela.martins@email.com','Isabela Martins'),
('778.990.112-22','1993-03-03','fernando.barros@email.com','Fernando Barros'),
('889.001.223-33','1979-09-19','maria.lima@email.com','Maria Lima'),
('990.112.334-44','1985-01-01','caio.silva@email.com','Caio Silva'),
('101.213.314-15','1990-10-10','patricia.oliveira@email.com','Patrícia Oliveira'),
('212.324.435-26','1965-08-08','jose.correia@email.com','José Correia'),
('323.435.546-37','2003-05-05','laura.gomes@email.com','Laura Gomes'),
('434.546.657-48','1996-04-04','vitor.ramos@email.com','Vitor Ramos'),
('545.657.768-59','1983-11-11','sandra.bento@email.com','Sandra Bento'),
('656.768.879-60','1977-02-02','roberto.azevedo@email.com','Roberto Azevedo');

-- 15 Vendas (assumindo que os próximos IDs de venda serão 9..23)
INSERT INTO Vendas (Quantidade, Data_vendas, Valor_total, FK_Cod_Livro) VALUES
(1, '2025-09-23', 29.90, 9),
(2, '2025-09-23', 108.00, 10),
(3, '2025-09-24', 55.50, 11),
(1, '2025-09-24', 44.90, 12),
(2, '2025-09-25', 78.00, 13),
(1, '2025-09-25', 32.75, 14),
(4, '2025-09-26', 105.60, 15),
(2, '2025-09-26', 49.90, 16),
(3, '2025-09-27', 65.97, 17),
(1, '2025-09-27', 65.00, 18),
(5, '2025-09-28', 75.00, 19),
(1, '2025-09-28', 72.90, 20),
(2, '2025-09-29', 57.60, 21),
(1, '2025-09-29', 34.50, 22),
(3, '2025-09-30', 165.75, 23);

-- 15 Autores (vinculados aos livros 9..23)
INSERT INTO Autores (Nacionalidade, Nome, Data_de_Nascimento, FK_Cod_Livro) VALUES
('Brasileiro','Marcos Teixeira','1979-05-05',9),
('Brasileira','Helena Costa','1984-08-08',10),
('Brasileira','Clara Souza','1992-02-02',11),
('Brasileiro','Roberto Nunes','1970-12-12',12),
('Brasileira','Letícia Duarte','1991-03-03',13),
('Brasileiro','Mateus Rocha','1987-07-07',14),
('Brasileira','Beatriz Lobo','1986-09-09',15),
('Brasileiro','Marcos Vilar','1976-06-06',16),
('Brasileira','Sonia Reis','1989-01-01',17),
('Brasileiro','Eduardo Faria','1968-11-11',18),
('Brasileira','Ana Paula','1998-10-10',19),
('Brasileiro','Dr. Paulo Meireles','1960-04-04',20),
('Brasileira','Rita Moreira','1975-02-02',21),
('Brasileiro','Sergio Pinto','1981-06-06',22),
('Brasileira','Luiza Amaral','1973-09-09',23);

-- 15 Editoras (vinculadas aos livros 9..23)
INSERT INTO Editoras (Contato, Nome_Editora, Cidade, Telefone, Endereco, CNPJ, FK_Cod_Livro) VALUES
('contato@aurora2.com','Aurora 2','São Paulo','(11)4000-9000','Rua A, 9','77.111.222/0001-09',9),
('info@horizonte2.com','Horizonte 2','Belo Horizonte','(31)4000-9001','Av. B, 10','88.222.333/0001-10',10),
('contato@pequenos.com','Pequenos Leitores','Porto Alegre','(51)4000-9002','Rua C, 11','99.333.444/0001-11',11),
('vendas@marea.com','Maré Alta','Fortaleza','(85)4000-9003','Av. D, 12','11.444.555/0001-12',12),
('poesia@estilolivre.com','Estilo Livre','Curitiba','(41)4000-9004','Rua E, 13','22.555.666/0001-13',13),
('suporte@codigoaberto.com','Código Aberto','Florianópolis','(48)4000-9005','Av. F, 14','33.666.777/0001-14',14),
('contato@saberes.com','Saberes','Salvador','(71)4000-9006','Rua G, 15','44.777.888/0001-15',15),
('info@capadura.com','Capa Dura','Recife','(81)4000-9007','Av. H, 16','55.888.999/0001-16',16),
('kids@infanto.com','Infanto','Manaus','(92)4000-9008','Rua I, 17','66.999.000/0001-17',17),
('lendas@mitos.com','Mitos','Belém','(91)4000-9009','Av. J, 18','77.000.111/0001-18',18),
('pocket@pocket.com','Pocket','Goiânia','(62)4000-9010','Rua K, 19','88.111.222/0001-19',19),
('ensino@ensino.com','Ensino','Vitória','(27)4000-9011','Av. L, 20','99.222.333/0001-20',20),
('verbo@verbo.com','Verbo','Natal','(84)4000-9012','Rua M, 21','11.333.444/0001-21',21),
('tecno@tecno.com','Tecno','Cuiabá','(65)4000-9013','Av. N, 22','22.444.555/0001-22',22),
('classico2@classicos.com','Clássicos 2','São Luís','(98)4000-9014','Rua O, 23','33.555.666/0001-23',23);

-- 15 Compram (relacionando CPFs dos novos clientes com as vendas 9..23)
INSERT INTO Compram (FK_CPF, FK_Cod_Vendas) VALUES
('012.345.678-90', 9),
('223.344.556-77', 10),
('334.556.778-88', 11),
('445.667.889-99', 12),
('556.778.990-00', 13),
('667.889.001-11', 14),
('778.990.112-22', 15),
('889.001.223-33', 16),
('990.112.334-44', 17),
('101.213.314-15', 18),
('212.324.435-26', 19),
('323.435.546-37', 20),
('434.546.657-48', 21),
('545.657.768-59', 22),
('656.768.879-60', 23);