-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: oficinamecanica
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CLIENTEID` int NOT NULL AUTO_INCREMENT,
  `CLIENTENOME` varchar(255) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CLIENTEID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`CLIENTEID`, `CLIENTENOME`, `EMAIL`) VALUES (1,'Maria Silva','maria.silva@email.com'),(2,'João Santos','joao.santos@email.com'),(3,'Ana Costa','ana.costa@email.com'),(4,'Pedro Oliveira','pedro.oliveira@email.com'),(5,'Carla Souza','carla.souza@email.com'),(6,'Ricardo Almeida','ricardo.almeida@email.com'),(7,'Fernanda Lima','fernanda.lima@email.com'),(8,'Bruno Cardoso','bruno.cardoso@email.com'),(9,'Juliana Rocha','juliana.rocha@email.com'),(10,'Marcos Tavares','marcos.tavares@email.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanicos`
--

DROP TABLE IF EXISTS `mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanicos` (
  `MECANICOID` int NOT NULL AUTO_INCREMENT,
  `MECANICONOME` varchar(255) NOT NULL,
  `ESPECIALIDADE` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`MECANICOID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanicos`
--

LOCK TABLES `mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanicos` DISABLE KEYS */;
INSERT INTO `mecanicos` (`MECANICOID`, `MECANICONOME`, `ESPECIALIDADE`) VALUES (1,'Roberto Ferreira','Motor'),(2,'Carlos Mendes','Injeção Eletrônica'),(3,'José Ricardo','Suspensão'),(4,'Paulo Henrique','Freios'),(5,'Anderson Silva','Motor'),(6,'Marcelo Costa','Injeção Eletrônica');
/*!40000 ALTER TABLE `mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens_servico`
--

DROP TABLE IF EXISTS `ordens_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens_servico` (
  `ORDEMID` int NOT NULL AUTO_INCREMENT,
  `VEICULOID` int NOT NULL,
  `DATA_ABERTURA` date NOT NULL,
  `DATA_CONCLUSAO` date DEFAULT NULL,
  `OS_STATUS` varchar(50) NOT NULL DEFAULT 'Em Execução',
  PRIMARY KEY (`ORDEMID`),
  KEY `idx_veiculoid` (`VEICULOID`),
  CONSTRAINT `ordens_servico_ibfk_1` FOREIGN KEY (`VEICULOID`) REFERENCES `veiculos` (`VEICULOID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens_servico`
--

LOCK TABLES `ordens_servico` WRITE;
/*!40000 ALTER TABLE `ordens_servico` DISABLE KEYS */;
INSERT INTO `ordens_servico` (`ORDEMID`, `VEICULOID`, `DATA_ABERTURA`, `DATA_CONCLUSAO`, `OS_STATUS`) VALUES (1,1,'2024-11-15','2024-11-16','Concluído'),(2,2,'2024-11-18','2024-11-20','Concluído'),(3,3,'2024-11-20','2024-11-22','Concluído'),(4,4,'2024-11-22','2024-11-25','Concluído'),(5,5,'2024-11-25',NULL,'Aguardando Peça'),(6,6,'2024-11-28','2024-11-30','Concluído'),(7,7,'2025-06-10','2025-06-12','Concluído'),(8,8,'2025-07-15',NULL,'Em Execução'),(9,9,'2025-08-20','2025-08-22','Concluído'),(10,10,'2025-09-05',NULL,'Em Execução'),(11,1,'2025-10-10','2025-10-12','Concluído'),(12,2,'2025-11-01',NULL,'Aguardando Peça'),(13,7,'2025-11-15','2025-11-17','Concluído');
/*!40000 ALTER TABLE `ordens_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_mecanicos`
--

DROP TABLE IF EXISTS `os_mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_mecanicos` (
  `ORDEMID` int NOT NULL,
  `MECANICOID` int NOT NULL,
  PRIMARY KEY (`ORDEMID`,`MECANICOID`),
  KEY `MECANICOID` (`MECANICOID`),
  CONSTRAINT `os_mecanicos_ibfk_1` FOREIGN KEY (`ORDEMID`) REFERENCES `ordens_servico` (`ORDEMID`),
  CONSTRAINT `os_mecanicos_ibfk_2` FOREIGN KEY (`MECANICOID`) REFERENCES `mecanicos` (`MECANICOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_mecanicos`
--

LOCK TABLES `os_mecanicos` WRITE;
/*!40000 ALTER TABLE `os_mecanicos` DISABLE KEYS */;
INSERT INTO `os_mecanicos` (`ORDEMID`, `MECANICOID`) VALUES (1,1),(4,1),(9,1),(2,2),(6,2),(8,2),(11,2),(3,3),(7,3),(13,3),(4,4),(5,4),(12,4),(10,5);
/*!40000 ALTER TABLE `os_mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_pecas`
--

DROP TABLE IF EXISTS `os_pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_pecas` (
  `ORDEMID` int NOT NULL,
  `PECAID` int NOT NULL,
  `QUANTIDADE_USADA` int NOT NULL DEFAULT '1',
  `PRECO_UNITARIO_COBRADO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ORDEMID`,`PECAID`),
  KEY `PECAID` (`PECAID`),
  CONSTRAINT `os_pecas_ibfk_1` FOREIGN KEY (`ORDEMID`) REFERENCES `ordens_servico` (`ORDEMID`),
  CONSTRAINT `os_pecas_ibfk_2` FOREIGN KEY (`PECAID`) REFERENCES `pecas` (`PECAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_pecas`
--

LOCK TABLES `os_pecas` WRITE;
/*!40000 ALTER TABLE `os_pecas` DISABLE KEYS */;
INSERT INTO `os_pecas` (`ORDEMID`, `PECAID`, `QUANTIDADE_USADA`, `PRECO_UNITARIO_COBRADO`) VALUES (1,1,1,25.00),(1,7,4,55.00),(2,1,1,25.00),(2,2,4,20.00),(2,7,4,55.00),(3,3,4,120.00),(3,4,2,220.00),(4,5,1,180.00),(5,6,1,450.00),(6,1,1,25.00),(6,7,4,55.00),(6,8,2,280.00),(7,10,4,350.00),(8,11,1,40.00),(9,1,1,25.00),(9,7,4,55.00),(10,3,4,120.00),(11,2,4,20.00),(12,6,1,450.00),(13,8,2,280.00);
/*!40000 ALTER TABLE `os_pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_servicos`
--

DROP TABLE IF EXISTS `os_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_servicos` (
  `ORDEMID` int NOT NULL,
  `SERVICOID` int NOT NULL,
  `PRECO_COBRADO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ORDEMID`,`SERVICOID`),
  KEY `SERVICOID` (`SERVICOID`),
  CONSTRAINT `os_servicos_ibfk_1` FOREIGN KEY (`ORDEMID`) REFERENCES `ordens_servico` (`ORDEMID`),
  CONSTRAINT `os_servicos_ibfk_2` FOREIGN KEY (`SERVICOID`) REFERENCES `servicos` (`SERVICOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_servicos`
--

LOCK TABLES `os_servicos` WRITE;
/*!40000 ALTER TABLE `os_servicos` DISABLE KEYS */;
INSERT INTO `os_servicos` (`ORDEMID`, `SERVICOID`, `PRECO_COBRADO`) VALUES (1,1,80.00),(1,4,120.00),(2,2,250.00),(3,3,150.00),(4,2,250.00),(4,5,200.00),(5,7,50.00),(6,1,80.00),(6,8,300.00),(7,4,120.00),(8,6,180.00),(9,1,80.00),(10,3,150.00),(11,2,250.00),(12,7,50.00),(13,8,300.00);
/*!40000 ALTER TABLE `os_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `PECAID` int NOT NULL AUTO_INCREMENT,
  `PECANOME` varchar(255) NOT NULL,
  `FABRICANTE` varchar(100) DEFAULT NULL,
  `QTD_ESTOQUE` int NOT NULL DEFAULT '0',
  `PRECO_CUSTO` decimal(10,2) NOT NULL,
  `PRECO_VENDA` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PECAID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` (`PECAID`, `PECANOME`, `FABRICANTE`, `QTD_ESTOQUE`, `PRECO_CUSTO`, `PRECO_VENDA`) VALUES (1,'Filtro de Óleo','Bosch',50,15.00,25.00),(2,'Vela de Ignição','NGK',100,12.00,20.00),(3,'Pastilha de Freio','Bosch',30,80.00,120.00),(4,'Disco de Freio','TRW',20,150.00,220.00),(5,'Correia Dentada','Gates',15,120.00,180.00),(6,'Bateria 60Ah','Moura',10,300.00,450.00),(7,'Óleo Motor 5W30','Castrol',80,35.00,55.00),(8,'Amortecedor Dianteiro','Cofap',12,180.00,280.00),(9,'Lâmpada H4','Philips',60,8.00,15.00),(10,'Pneu 175/70 R14','Pirelli',25,220.00,350.00),(11,'Filtro de Ar','Tecfil',3,25.00,40.00),(12,'Filtro de Combustível','Bosch',2,30.00,50.00),(13,'Junta do Cabeçote','Elring',8,250.00,380.00),(14,'Bomba de Água','Nakata',6,120.00,200.00),(15,'Radiador','Visconde',4,280.00,450.00);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `SERVICOID` int NOT NULL AUTO_INCREMENT,
  `SERVICONOME` varchar(255) NOT NULL,
  `ESPECIALIDADE` varchar(150) DEFAULT NULL,
  `PRECO_MAO_OBRA` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SERVICOID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` (`SERVICOID`, `SERVICONOME`, `ESPECIALIDADE`, `PRECO_MAO_OBRA`) VALUES (1,'Troca de Óleo','Motor',80.00),(2,'Revisão Completa','Geral',250.00),(3,'Troca de Freios','Freios',150.00),(4,'Alinhamento e Balanceamento','Suspensão',120.00),(5,'Troca de Correia Dentada','Motor',200.00),(6,'Diagnóstico Eletrônico','Injeção Eletrônica',180.00),(7,'Troca de Bateria','Elétrica',50.00),(8,'Reparo de Suspensão','Suspensão',300.00),(9,'Sistema Elétrico','Elétrica',220.00),(10,'Troca de Embreagem','Motor',450.00);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `VEICULOID` int NOT NULL AUTO_INCREMENT,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(255) NOT NULL,
  `PLACA` varchar(7) NOT NULL,
  `CLIENTEID` int NOT NULL,
  PRIMARY KEY (`VEICULOID`),
  UNIQUE KEY `PLACA` (`PLACA`),
  KEY `CLIENTEID` (`CLIENTEID`),
  KEY `idx_placa` (`PLACA`),
  CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`CLIENTEID`) REFERENCES `clientes` (`CLIENTEID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` (`VEICULOID`, `MARCA`, `MODELO`, `PLACA`, `CLIENTEID`) VALUES (1,'Honda','Civic','ABC1234',1),(2,'Toyota','Corolla','DEF5678',2),(3,'Fiat','Uno','GHI9012',3),(4,'Chevrolet','S10','JKL3456',4),(5,'Volkswagen','Gol','MNO7890',5),(6,'Honda','City','PQR1122',1),(7,'Ford','Ka','STU4567',6),(8,'Ford','Fiesta','VWX8901',7),(9,'Ford','Focus','YZA2345',8),(10,'Ford','Ranger','BCD6789',9),(11,'Ford','EcoSport','EFG0123',10),(12,'Ford','Fusion','HIJ4567',2),(13,'Hyundai','HB20','KLM8901',6),(14,'Renault','Sandero','NOP2345',7),(15,'Nissan','Kicks','QRS6789',8),(16,'Jeep','Compass','TUV0123',9),(17,'Chevrolet','Onix','WXY4567',10),(18,'Volkswagen','Polo','ZAB8901',3),(19,'Fiat','Argo','CDE2345',4),(20,'Toyota','Hilux','FGH6789',5);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 16:51:34
