CREATE DATABASE SOLAR;
USE SOLAR;
SELECT DATABASE();

CREATE TABLE Clientes (
Cod_Cliente int auto_increment PRIMARY KEY,
Nome_Cliente varchar(100)
);

CREATE TABLE Produtos (
Cod_Produto int auto_increment PRIMARY KEY,
Nome_Produto varchar(100)
);

CREATE TABLE Compra (
Cod_Compra int auto_increment PRIMARY KEY,
Cod_Produto int,
Cod_Cliente int,
FOREIGN KEY(Cod_Produto) REFERENCES Produtos (Cod_Produto),
FOREIGN KEY(Cod_Cliente) REFERENCES Produtos (Cod_Cliente)
)

