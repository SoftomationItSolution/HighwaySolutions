CREATE DATABASE  IF NOT EXISTS `tmsv1_lane` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `tmsv1_lane`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 192.168.11.22    Database: tmsv1_lane
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

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
-- Table structure for table `tbl_PlazaConfiguration`
--

DROP TABLE IF EXISTS `tbl_PlazaConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PlazaConfiguration` (
  `PlazaId` int(11) NOT NULL AUTO_INCREMENT,
  `SystemIntegratorId` int(11) DEFAULT NULL,
  `PlazaNumber` int(11) DEFAULT NULL,
  `PlazaName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaTypeId` int(11) DEFAULT NULL,
  `PlazaServerIpAddress` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ChainageNumber` decimal(16,3) DEFAULT NULL,
  `Latitude` decimal(8,6) DEFAULT NULL,
  `Longitude` decimal(9,6) DEFAULT NULL,
  `PlazaZoneId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaState` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaAddress` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaFromDistrict` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaToDistrict` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaAgencyCode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaAcquirerId` int(11) DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PlazaId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 18:54:01