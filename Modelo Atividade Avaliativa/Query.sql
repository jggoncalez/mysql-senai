CREATE TABLE Fornecimento (
    Quantidade INT,
    Fcodigo INT,
    PRcod INT,
    PRIMARY KEY (Fcodigo, PRcod)
);

CREATE TABLE Instituicao (
    Icodigo INT AUTO_INCREMENT PRIMARY KEY,
    Inome VARCHAR(100)
);

CREATE TABLE Fornecedor (
    Fcodigo INT AUTO_INCREMENT PRIMARY KEY,
    Status VARCHAR(100) DEFAULT 'Ativo',
    Cidade VARCHAR(100),
    Fnome VARCHAR(100)
);

CREATE TABLE Projeto (
    PRcod INT AUTO_INCREMENT PRIMARY KEY,
    PRnome VARCHAR(100),
    Cidade VARCHAR(100),
    Icodigo INT
);

CREATE TABLE Peca (
    Pcodigo INT AUTO_INCREMENT PRIMARY KEY,
    Cidade VARCHAR(100) NOT NULL,
    Pnome VARCHAR(100) NOT NULL,
    Cor VARCHAR(100) NOT NULL,
    Peso FLOAT NOT NULL
);

ALTER TABLE Fornecimento RENAME TO Cidade;

ALTER TABLE Cidade 
    ADD Ccod INT AUTO_INCREMENT PRIMARY KEY FIRST,
    ADD uf CHAR(2),
    ADD Cnome VARCHAR(100);

ALTER TABLE Instituicao 
    ADD Ccod INT,
    ADD FOREIGN KEY (Ccod) REFERENCES Cidade (Ccod);

ALTER TABLE Projeto 
    ADD FOREIGN KEY (Icodigo) REFERENCES Instituicao (Icodigo);
