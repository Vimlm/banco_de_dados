CREATE DATABASE  IF NOT EXISTS `BD_Bella` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `BD_Bella`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: banco
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `cpf` varchar(14) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `bairro` varchar(40) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `CodPaciente` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CodPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('345.567.890-00','Maria da Silva','41987658455','msilva@gmail.com','Rua das Margaridas, 33','Pilarzinho','Curitiba','PR',1),('123;654;987-11','Ana Maria Barbosa dos Santos','41989901234','anasantos@gmail.com','Rua Alegria, 234','Santo Inácio','Curitiba','PR',2),('321.543.654-22','Ana dos Santos','41984235446','ana_dos_santos@gmail.com','Rua 21 de Abril, 4130','Alto da VX','Curitiba','PR',3);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimentos`
--

DROP TABLE IF EXISTS `procedimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimentos` (
  `CodProcedimento` int NOT NULL AUTO_INCREMENT,
  `procedimento` varchar(40) NOT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`CodProcedimento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimentos`
--

LOCK TABLES `procedimentos` WRITE;
/*!40000 ALTER TABLE `procedimentos` DISABLE KEYS */;
INSERT INTO `procedimentos` VALUES (1,'Laser facial',3500),(2,'Laser mãos',2500),(3,'Peeling químico',1200),(4,'Peeling químico mãos',900);
/*!40000 ALTER TABLE `procedimentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06 21:55:40
