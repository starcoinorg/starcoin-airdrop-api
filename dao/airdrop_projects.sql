-- MySQL dump 10.13  Distrib 8.0.23, for osx10.15 (x86_64)
--
-- Host: localhost    Database: starcoin_event
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airdrop_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `token` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '0x1::STC::STC',
  `token_icon` varchar(100) COLLATE utf8mb4_bin DEFAULT '',
  `token_symbol` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'STC',
  `token_precision` int DEFAULT '9',
  `total_amount` bigint DEFAULT '0',
  `valid_amount` bigint DEFAULT '0',
  `start_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `owner_address` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `root` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `network_version` int DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_projects_network_version` (`network_version`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_projects`
--

LOCK TABLES `airdrop_projects` WRITE;
/*!40000 ALTER TABLE `airdrop_projects` DISABLE KEYS */;
INSERT INTO `airdrop_projects` VALUES (1,'投票#0奖励','0x1::STC::STC','','STC',9,0,0,'2021-08-20 10:00:00','2021-09-04 23:59:59','0x3f19d5422824f47e6c021978cee98f35','0xae395b73152a03cce72ce3f8f444650c9910933e1b30472933b870a97ec8e291',253,'2021-08-19 22:26:33','2021-08-20 00:11:49'),(2,'投票#1奖励','0x1::STC::STC','','STC',9,0,0,'2021-08-20 10:00:00','2021-09-04 23:59:59','0x3f19d5422824f47e6c021978cee98f35','0xc02e97b4ac557d4ddcf0c849d69f070ea6d50f479e5c525186af6d8c8e2f974a',253,'2021-08-19 22:26:34','2021-08-20 00:11:49'),(3,'投票#2奖励','0x1::STC::STC','','STC',9,0,0,'2021-08-20 10:00:00','2021-09-04 23:59:59','0x3f19d5422824f47e6c021978cee98f35','0xe15e74f9dd1b347e94a96cf945bd82a873dc7cdf2c13fd7edd330cf524ff3ed5',253,'2021-08-19 22:26:34','2021-08-20 00:11:49');
/*!40000 ALTER TABLE `airdrop_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-20 10:45:33
