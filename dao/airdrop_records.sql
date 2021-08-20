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
-- Table structure for table `airdrop_records`
--

DROP TABLE IF EXISTS `airdrop_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airdrop_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int DEFAULT '0',
  `idx` int DEFAULT '0',
  `proof` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `airdrop_id` int NOT NULL DEFAULT '0',
  `status` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_airdrop_id` (`airdrop_id`),
  KEY `idx_records_address` (`address`),
  CONSTRAINT `fk_airdrop_id` FOREIGN KEY (`airdrop_id`) REFERENCES `airdrop_projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airdrop_records`
--

LOCK TABLES `airdrop_records` WRITE;
/*!40000 ALTER TABLE `airdrop_records` DISABLE KEYS */;
INSERT INTO `airdrop_records` VALUES (1,'0x3f19d5422824f47e6c021978cee98f35',1000000000,0,'[\"0xb2214f2452d81019493db885477ae70eecabe823946a84a0da3be496cf96ff6d\"]',1,3,'2021-08-19 22:27:26','2021-08-20 00:24:13'),(2,'0xd7f20befd34b9f1ab8aeae98b82a5a51',1000000000,1,'[\"0x22aa2671f4cc4d63939e978093e97b95a4787173c1edce54d3151698868f50f1\"]',1,3,'2021-08-19 22:27:26','2021-08-20 00:26:05'),(3,'0x3f19d5422824f47e6c021978cee98f35',1000000000,0,'[\"0x1e9770ec08e2de8023589cdf19afc8bd5841c1eedca3d04eff749160cbb84893\"]',2,3,'2021-08-19 22:31:43','2021-08-20 00:24:12'),(4,'0xd7f20befd34b9f1ab8aeae98b82a5a51',1000000000,1,'[\"0xfbff8a7ec8ca8d4b50a10590fd8667a84027f78d8a1771883348c4f9bf0e589b\"]',2,1,'2021-08-19 22:31:43','2021-08-20 08:27:12'),(5,'0x3f19d5422824f47e6c021978cee98f35',1000000000,0,'[\"0x5b35a70b0eba17ede94fdf2664e87438aa71e5d756220a8f8072482a9e9a0d5b\"]',3,1,'2021-08-19 22:32:35','2021-08-20 00:34:18');
/*!40000 ALTER TABLE `airdrop_records` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-20 10:45:49
