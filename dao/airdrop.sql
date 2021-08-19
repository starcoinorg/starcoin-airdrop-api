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
  `name` varchar(50) NOT NULL DEFAULT '',
  `token` varchar(45) NOT NULL DEFAULT '0x1::STC::STC',
  `token_icon` varchar(100)  NULL DEFAULT '',
  `token_symbol` varchar(45) NOT NULL DEFAULT 'STC',
  `token_precision` int(10) DEFAULT 9,
  `total_amount` bigint DEFAULT 0,
  `valid_amount` bigint DEFAULT 0,
  `start_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `owner_address` varchar(45) DEFAULT NULL,
  `root` varchar(100) DEFAULT NULL,
  `network_version` int(10) DEFAULT 0,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
CREATE INDEX idx_projects_network_version ON airdrop_projects(network_version);
--
-- Dumping data for table `airdrop_projects`
--

alter 

LOCK TABLES `airdrop_projects` WRITE;
/*!40000 ALTER TABLE `airdrop_projects` DISABLE KEYS */;
INSERT INTO `airdrop_projects` (id, name, token, token_symbol, token_precision, start_at, end_at) VALUES (null,'投票#0奖励','0x1::STC::STC', 'STC', 9, '2021-08-20 10:00:00','2021-09-04 23:59:59');
update airdrop_projects set owner_address='0x3f19d5422824f47e6c021978cee98f35', root='0xe15e74f9dd1b347e94a96cf945bd82a873dc7cdf2c13fd7edd330cf524ff3ed5', network_version='253' where id = 1;
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
  `address` varchar(45) DEFAULT NULL,
  `amount` int(10) DEFAULT 0,
  `idx` int(10) DEFAULT 0,
  `proof` varchar(500) DEFAULT NULL,
  `airdrop_id` int(11) NOT NULL DEFAULT 0,
  `status` int(10) DEFAULT 0,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE airdrop_records ADD CONSTRAINT fk_airdrop_id FOREIGN KEY (airdrop_id) REFERENCES airdrop_projects (id);
CREATE INDEX idx_records_address ON airdrop_records(address);
--
-- Dumping data for table `airdrop_records`
--

LOCK TABLES `airdrop_records` WRITE;
/*!40000 ALTER TABLE `airdrop_records` DISABLE KEYS */;
insert into airdrop_records (id, address, amount, idx, proof, status, airdrop_id) values (null, '0x3f19d5422824f47e6c021978cee98f35', 1000000000, 0, '["0x5b35a70b0eba17ede94fdf2664e87438aa71e5d756220a8f8072482a9e9a0d5b"]', '0', 1);
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
