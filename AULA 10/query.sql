-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS ofc_Mecanica;
USE ofc_Mecanica;

-- Tabela de Clientes
CREATE TABLE CLIENTES(
    CLIENTEID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    CLIENTENOME VARCHAR(255) NOT NULL
);

-- Tabela de Veículos
CREATE TABLE VEICULOS(
    VEICULOID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    VEICULONOME VARCHAR(255) NOT NULL,
    VEICULOTIPO VARCHAR(255),
    VEICULOPLACA VARCHAR(7) NOT NULL,
    CLIENTEID INT NOT NULL,
    FOREIGN KEY (CLIENTEID) REFERENCES CLIENTES(CLIENTEID)
);

-- Tabela de Peças
CREATE TABLE PECAS(
    PECAID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    PECANOME VARCHAR(255) NOT NULL,
    PECAQTT INT NOT NULL DEFAULT 0
);

-- Tabela de Mecânicos
CREATE TABLE MECANICOS(
    MECANICOID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    MECANICONOME VARCHAR(255) NOT NULL
);

-- Tabela de Serviços
CREATE TABLE SERVICOS(
    SERVICOID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    SERVICONOME VARCHAR(255) NOT NULL
);

-- Tabela de Ordens de Serviço
CREATE TABLE ORDENS_SERVICO(
    ORDEMID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    VEICULOID INT NOT NULL,
    MECANICOID INT NOT NULL,
    ORDEMDATA DATE NOT NULL,
    FOREIGN KEY (VEICULOID) REFERENCES VEICULOS(VEICULOID),
    FOREIGN KEY (MECANICOID) REFERENCES MECANICOS(MECANICOID)
);

-- Serviços realizados na ordem
CREATE TABLE ORDEM_SERVICOS(
    ORDEMID INT NOT NULL,
    SERVICOID INT NOT NULL,
    PRIMARY KEY (ORDEMID, SERVICOID),
    FOREIGN KEY (ORDEMID) REFERENCES ORDENS_SERVICO(ORDEMID),
    FOREIGN KEY (SERVICOID) REFERENCES SERVICOS(SERVICOID)
);

-- Peças utilizadas na ordem
CREATE TABLE ORDEM_PECAS(
    ORDEMID INT NOT NULL,
    PECAID INT NOT NULL,
    QUANTIDADE INT NOT NULL DEFAULT 1,
    PRIMARY KEY (ORDEMID, PECAID),
    FOREIGN KEY (ORDEMID) REFERENCES ORDENS_SERVICO(ORDEMID),
    FOREIGN KEY (PECAID) REFERENCES PECAS(PECAID)
);

-- ============================================
-- INSERTS - DADOS DE EXEMPLO
-- ============================================

-- Inserindo Clientes
INSERT INTO CLIENTES (CLIENTENOME) VALUES
('Maria Silva'),
('João Santos'),
('Ana Costa'),
('Pedro Oliveira'),
('Carla Souza'),
('Ricardo Almeida'),
('Fernanda Lima'),
('Bruno Cardoso'),
('Juliana Rocha'),
('Marcos Tavares');

-- Inserindo Veículos (incluindo Ford)
INSERT INTO VEICULOS (VEICULONOME, VEICULOTIPO, VEICULOPLACA, CLIENTEID) VALUES
('Honda Civic', 'Sedã', 'ABC1234', 1),
('Toyota Corolla', 'Sedã', 'DEF5678', 2),
('Fiat Uno', 'Hatch', 'GHI9012', 3),
('Chevrolet S10', 'Picape', 'JKL3456', 4),
('Volkswagen Gol', 'Hatch', 'MNO7890', 5),
('Honda City', 'Sedã', 'PQR1122', 1),
('Ford Ka', 'Hatch', 'STU4567', 6),
('Ford Fiesta', 'Hatch', 'VWX8901', 7),
('Ford Focus', 'Sedã', 'YZA2345', 8),
('Ford Ranger', 'Picape', 'BCD6789', 9),
('Ford EcoSport', 'SUV', 'EFG0123', 10),
('Ford Fusion', 'Sedã', 'HIJ4567', 2),
('Hyundai HB20', 'Hatch', 'KLM8901', 6),
('Renault Sandero', 'Hatch', 'NOP2345', 7),
('Nissan Kicks', 'SUV', 'QRS6789', 8),
('Jeep Compass', 'SUV', 'TUV0123', 9),
('Chevrolet Onix', 'Hatch', 'WXY4567', 10),
('Volkswagen Polo', 'Hatch', 'ZAB8901', 3),
('Fiat Argo', 'Hatch', 'CDE2345', 4),
('Toyota Hilux', 'Picape', 'FGH6789', 5);

-- Inserindo Peças
INSERT INTO PECAS (PECANOME, PECAQTT) VALUES
('Filtro de Óleo', 50),
('Vela de Ignição', 100),
('Pastilha de Freio', 30),
('Disco de Freio', 20),
('Correia Dentada', 15),
('Bateria 60Ah', 10),
('Óleo Motor 5W30', 80),
('Amortecedor Dianteiro', 12),
('Lâmpada H4', 60),
('Pneu 175/70 R14', 25);

-- Inserindo Mecânicos
INSERT INTO MECANICOS (MECANICONOME) VALUES
('Roberto Ferreira'),
('Carlos Mendes'),
('José Ricardo'),
('Paulo Henrique');

-- Inserindo Serviços
INSERT INTO SERVICOS (SERVICONOME) VALUES
('Troca de Óleo'),
('Revisão Completa'),
('Troca de Freios'),
('Alinhamento e Balanceamento'),
('Troca de Correia Dentada'),
('Diagnóstico Eletrônico'),
('Troca de Bateria'),
('Suspensão'),
('Sistema Elétrico');

-- Inserindo Ordens de Serviço
INSERT INTO ORDENS_SERVICO (VEICULOID, MECANICOID, ORDEMDATA) VALUES
(1, 1, '2024-11-15'),
(2, 2, '2024-11-18'),
(3, 3, '2024-11-20'),
(4, 1, '2024-11-22'),
(5, 4, '2024-11-25'),
(6, 2, '2024-11-28');

-- Relacionando Serviços com Ordens
INSERT INTO ORDEM_SERVICOS (ORDEMID, SERVICOID) VALUES
(1, 1),
(1, 4),
(2, 2),
(3, 3),
(4, 5),
(4, 2),
(5, 7),
(6, 1),
(6, 8);

-- Relacionando Peças com Ordens
INSERT INTO ORDEM_PECAS (ORDEMID, PECAID, QUANTIDADE) VALUES
(1, 1, 1),
(1, 7, 4),
(2, 1, 1),
(2, 2, 4),
(2, 7, 4),
(3, 3, 4),
(3, 4, 2),
(4, 5, 1),
(5, 6, 1),
(6, 1, 1),
(6, 7, 4),
(6, 8, 2);