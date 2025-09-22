-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Livros (
Cod_Livro int auto_increment PRIMARY KEY,
Preco decimal(5, 2),
Quantidade int,
Editora varchar(100),
Titulo varchar(100),
Genero varchar(100),
Autor varchar(100)
)

CREATE TABLE Vendas (
Cod_Vendas int auto_increment PRIMARY KEY,
Quantidade int(10),
Data_vendas Date,
Valor_total decimal(10,2),
Cod_Livro int auto_increment,
FOREIGN KEY(Cod_Livro) REFERENCES Livros (Cod_Livro)
)

CREATE TABLE Clientes (
CPF varchar(14) PRIMARY KEY,
Data_de_nascimento Date,
Email varchar(100),
Nome_Clientes varchar(100)
)

CREATE TABLE Autores (
Cod_Autor int auto_increment PRIMARY KEY,
Nacionalidade varchar(100),
Nome varchar(100),
Data_de_Nascimento Date,
Cod_Livro int auto_increment,
FOREIGN KEY(Cod_Livro) REFERENCES Livros (Cod_Livro)
)

CREATE TABLE Editoras (
Cod_Editora int auto_increment PRIMARY KEY,
Contato varchar(100),
Nome_Editora varchar(100),
Cidade varchar(100),
Telefone varchar(17),
Endereco varchar(100),
CNPJ varchar(18),
Cod_Livro int auto_increment,
FOREIGN KEY(Cod_Livro) REFERENCES Livros (Cod_Livro)
)

CREATE TABLE Compram (
CPF varchar(14),
Cod_Vendas int auto_increment,
FOREIGN KEY(CPF) REFERENCES Clientes (CPF),
FOREIGN KEY(Cod_Vendas) REFERENCES Vendas (Cod_Vendas)
)

