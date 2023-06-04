-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: somativa_maia
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `descricao` varchar(2500) NOT NULL,
  `solicitanteFK` bigint NOT NULL,
  `ambienteFK` bigint NOT NULL,
  `data_de_criacao` datetime NOT NULL DEFAULT (now()),
  `prazo` datetime NOT NULL DEFAULT (now()),
  `imagens` varchar(5000) DEFAULT NULL,
  `statusFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `statusFK` (`statusFK`),
  KEY `solicitanteFK` (`solicitanteFK`),
  KEY `ambienteFK` (`ambienteFK`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`statusFK`) REFERENCES `status_tarefas` (`id`),
  CONSTRAINT `tarefas_ibfk_2` FOREIGN KEY (`solicitanteFK`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tarefas_ibfk_3` FOREIGN KEY (`ambienteFK`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'Computador com Defeito','O Host27 da sala de Informática 01 está com travamentos constantes',2,5,'2023-06-03 20:35:03','2023-06-15 00:00:00','imagem.jpg',1),(2,'Microfones no auditório','Os novos microfones acabaram de chegar, preciso que alguem vá ao auditório e configure-os corretamente',1,2,'2023-06-03 20:35:03','2023-06-08 00:00:00','imagem.jpg',1),(3,'Equipamento com Defeito','Um dos multímetros do Laboratório de Eletrônica não está ligando',3,1,'2023-06-03 20:35:03','2023-06-25 00:00:00','imagem.jpg',1),(4,'Ferramentas Faltando','Algumas ferramentas do Laboratório de Mecânica não estavam na caixa quando fui abrí-la hoje de manhã, preciso que alguem encontre e coloque elas de volta no lugar',6,4,'2023-06-03 20:35:03','2023-06-20 00:00:00','imagem.jpg',1);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 20:58:50
