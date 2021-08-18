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
-- Table structure for table `airdrop_projects`
--

DROP TABLE IF EXISTS `airdrop_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airdrop_projects` (
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
-- Dumping data for table `airdrop_projects`
--

LOCK TABLES `airdrop_projects` WRITE;
/*!40000 ALTER TABLE `airdrop_projects` DISABLE KEYS */;
INSERT INTO `airdrop_projects` VALUES (1,'STC','project1',10,8,'2021-08-25 18:00:00','2020-08-01 18:00:00'),(2,'USDT','project2',9,4,'2021-08-09 20:00:00','2021-08-01 20:00:00'),(3,'STC','project3',11,2,'2021-08-09 20:00:00','2021-08-01 20:00:00');
/*!40000 ALTER TABLE `airdrop_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airdrop_records`
--

DROP TABLE IF EXISTS `airdrop_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airdrop_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(10) DEFAULT '0',
  `idx` int(10) DEFAULT '0',
  `proof` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `project_id` int(10) DEFAULT '0',
  `air_drop_id` bigint(20) DEFAULT '0',
  `owner_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `root` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `network_version` int(10) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_records`
--

LOCK TABLES `airdrop_records` WRITE;
/*!40000 ALTER TABLE `airdrop_records` DISABLE KEYS */;
INSERT INTO `airdrop_records` VALUES (5,'0x3f19d5422824f47e6c021978cee98f35',1000000000,0,'[\"0x2df1673b2fd2df6712b5cc3e3c9c75833a26e8a7b3aa4f5fded7d8d052829f90\"]',1,1629277067307,'0x7beb045f2dea2f7fe50ede88c3e19a72','0x060bf7bd703ebb85380710489359445b4723d60fdf236a65736ba132f6e5a0f6',NULL,'2021-08-18 17:30:04','2021-08-18 23:03:56',253,'2021-08-30 17:30:53','2021-08-18 17:30:04'),(6,'0xd7f20befd34b9f1ab8aeae98b82a5a51',1000000000,1,'[\"0xe20e1f54dc78d9f6672c1364c17c2bac8126650d43e1c93e112c3572f9fde7b5\"]',1,1629277067307,'0x7beb045f2dea2f7fe50ede88c3e19a72','0x060bf7bd703ebb85380710489359445b4723d60fdf236a65736ba132f6e5a0f6','2',253,'2021-08-18 17:30:40','2021-08-18 23:03:56','2021-08-30 17:30:53','2021-08-18 17:30:04');
/*!40000 ALTER TABLE `airdrop_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airdrop_tokens`
--

DROP TABLE IF EXISTS `airdrop_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airdrop_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_tokens`
--

LOCK TABLES `airdrop_tokens` WRITE;
/*!40000 ALTER TABLE `airdrop_tokens` DISABLE KEYS */;
INSERT INTO `airdrop_tokens` VALUES (1,'STC','0x1::STC::STC\n0x1::STC::STC\n0x1::STC::STC'),(2,'USDT','0xxxxxxx:USDT:USDT\n');
/*!40000 ALTER TABLE `airdrop_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-18 23:05:23
