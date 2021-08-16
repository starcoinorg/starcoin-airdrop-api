-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: starcoin_airdrop
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airdrop_amount`
--

DROP TABLE IF EXISTS `airdrop_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airdrop_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_id` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_amount`
--

LOCK TABLES `airdrop_amount` WRITE;
/*!40000 ALTER TABLE `airdrop_amount` DISABLE KEYS */;
INSERT INTO `airdrop_amount` VALUES (1,'0xeD4B0e884A11352c62EFC57aDf0d74c4','1','1','1'),(2,'0xeD4B0e884A11352c62EFC57aDf0d74c4','2','2','2');
/*!40000 ALTER TABLE `airdrop_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airdrop_project_list`
--

DROP TABLE IF EXISTS `airdrop_project_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airdrop_project_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `project` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `valid_amount` float DEFAULT NULL,
  `expire_time` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_project_list`
--

LOCK TABLES `airdrop_project_list` WRITE;
/*!40000 ALTER TABLE `airdrop_project_list` DISABLE KEYS */;
INSERT INTO `airdrop_project_list` VALUES (1,'STC','project1',10,8,'2021-08-25 18:00:00','2020-08-01 18:00:00'),(2,'USDT','project2',9,4,'2021-08-09 20:00:00','2021-08-01 20:00:00'),(3,'STC','project3',11,2,'2021-08-09 20:00:00','2021-08-01 20:00:00');
/*!40000 ALTER TABLE `airdrop_project_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airdrop_token_list`
--

DROP TABLE IF EXISTS `airdrop_token_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airdrop_token_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_token_list`
--

LOCK TABLES `airdrop_token_list` WRITE;
/*!40000 ALTER TABLE `airdrop_token_list` DISABLE KEYS */;
INSERT INTO `airdrop_token_list` VALUES (1,'STC','0x1::STC::STC\n0x1::STC::STC\n0x1::STC::STC'),(2,'USDT','0xxxxxxx:USDT:USDT\n');
/*!40000 ALTER TABLE `airdrop_token_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-16 15:42:08
