CREATE DATABASE EMPRESA;

USE EMPRESA;

CREATE TABLE Fornecimento (
    Quantidade INT,
    Fcodigo INT,
    PRcod INT,
    PRIMARY KEY (Fcodigo, PRcod),
    INDEX idx_qtd (Quantidade)
);

CREATE TABLE Instituicao (
    Icodigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Inome VARCHAR(100)
);

CREATE TABLE Fornecedor (
    Fcodigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Status VARCHAR(100) DEFAULT 'Ativo',
    Cidade VARCHAR(100),
    Fnome VARCHAR(100)
);

CREATE TABLE Projeto (
    PRcod INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    PRnome VARCHAR(100),
    Cidade VARCHAR(100),
    Icodigo INT,
    INDEX idx_icodigo (Icodigo)
);

CREATE TABLE Peca (
    Pcodigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Pnome VARCHAR(100) NOT NULL,
    Cor VARCHAR(100) NOT NULL,
    Peso FLOAT NOT NULL,
    INDEX idx_pnome (Pnome)
);

ALTER TABLE Instituicao 
	RENAME TO Cidade,
    CHANGE Icodigo Ccod INT AUTO_INCREMENT NOT NULL,
    CHANGE Inome Cnome VARCHAR(100) NOT NULL,
    ADD uf CHAR(2) NOT NULL,
    ADD INDEX idx_cnome (Cnome);
    