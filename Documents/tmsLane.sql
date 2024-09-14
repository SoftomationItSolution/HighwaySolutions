CREATE DATABASE  IF NOT EXISTS `tmsv1_lane` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tmsv1_lane`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tmsv1_lane
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `tbl_avctransaction`
--

DROP TABLE IF EXISTS `tbl_avctransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_avctransaction` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `LaneId` smallint DEFAULT NULL,
  `TransactionCount` bigint DEFAULT NULL,
  `AvcClassId` smallint DEFAULT NULL,
  `AxleCount` smallint DEFAULT NULL,
  `IsReverseDirection` bit(1) DEFAULT b'0',
  `WheelBase` bigint DEFAULT NULL,
  `TransactionDateTime` datetime(6) DEFAULT NULL,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avctransaction`
--

LOCK TABLES `tbl_avctransaction` WRITE;
/*!40000 ALTER TABLE `tbl_avctransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avctransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datastatusmaster`
--

DROP TABLE IF EXISTS `tbl_datastatusmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_datastatusmaster` (
  `DataStatusId` smallint NOT NULL,
  `DataStatusName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`DataStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datastatusmaster`
--

LOCK TABLES `tbl_datastatusmaster` WRITE;
/*!40000 ALTER TABLE `tbl_datastatusmaster` DISABLE KEYS */;
INSERT INTO `tbl_datastatusmaster` VALUES (0,'Deleted',1,'2023-11-22 11:28:55',0,'2023-11-22 11:28:55',0),(1,'Active',1,'2023-11-22 11:28:55',0,'2023-11-22 11:28:55',0),(2,'Inactive',1,'2023-11-22 11:28:55',0,'2023-11-22 11:28:55',0);
/*!40000 ALTER TABLE `tbl_datastatusmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_denominationmaster`
--

DROP TABLE IF EXISTS `tbl_denominationmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_denominationmaster` (
  `DenominationId` smallint NOT NULL,
  `DenominationValue` smallint DEFAULT '0',
  `OrderBy` smallint DEFAULT '0',
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`DenominationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_denominationmaster`
--

LOCK TABLES `tbl_denominationmaster` WRITE;
/*!40000 ALTER TABLE `tbl_denominationmaster` DISABLE KEYS */;
INSERT INTO `tbl_denominationmaster` VALUES (3,500,3,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(4,200,4,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(5,100,5,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(6,50,6,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(7,20,7,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(8,10,8,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(9,5,9,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(10,2,10,1,'2022-05-06 16:53:38',0,'2022-05-06 16:53:38',0),(11,1,11,1,'2023-08-24 10:40:37',0,'2023-08-24 10:40:37',0);
/*!40000 ALTER TABLE `tbl_denominationmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_equipmentdetails`
--

DROP TABLE IF EXISTS `tbl_equipmentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_equipmentdetails` (
  `EquipmentId` bigint NOT NULL,
  `PlazaId` int NOT NULL,
  `LaneId` int NOT NULL,
  `EquipmentTypeId` int DEFAULT NULL,
  `EquipmentName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProtocolTypeId` int DEFAULT NULL,
  `IpAddress` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PortNumber` int DEFAULT NULL,
  `LoginId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginPassword` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufacturerId` int DEFAULT NULL,
  `MacAddress` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModelNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufacturerDate` date DEFAULT NULL,
  `PurchageDate` date DEFAULT NULL,
  `WarrantyExpireDate` date DEFAULT NULL,
  `UrlAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnLineStatus` tinyint DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_equipmentdetails`
--

LOCK TABLES `tbl_equipmentdetails` WRITE;
/*!40000 ALTER TABLE `tbl_equipmentdetails` DISABLE KEYS */;
INSERT INTO `tbl_equipmentdetails` VALUES (49,1,2,2,'L-02-OHLS',7,'NR',0,NULL,NULL,8,NULL,NULL,NULL,'2024-01-01','2024-01-10','2024-12-31','s11e',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(50,1,2,4,'L-02-WIM',1,'192.168.10.25',4711,NULL,NULL,10,NULL,NULL,NULL,'2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(51,1,2,5,'L-02-RFID-Reader',1,'192.168.10.29',9090,NULL,NULL,9,'6C:EC:A1:FF:8F:87','RFGH15T','230386926','2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(52,1,2,6,'L-02-TLC',1,'192.168.10.22',0,NULL,NULL,8,'48:B0:2D:EC:2F:37','B02-4GB','1423323016716','2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(53,1,2,7,'L-02-DIO/PLC',1,'192.168.10.23',23,NULL,NULL,8,'D4:AD:20:74:B0:8C','USR-K7',NULL,'2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(54,1,2,14,'L-02-Hooter-Violation-Light',7,'NR',0,NULL,NULL,8,NULL,NULL,NULL,'2024-01-01','2024-01-10','2024-12-31','s41e',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(55,1,2,15,'L-02-LPIC-Camera',6,'192.168.10.26',554,NULL,NULL,3,'28:18:FD:AA:48:40','CP-UNC-TA41PL3-Y0360','2302012888001107','2024-01-01','2024-01-10','2024-12-31','cam/realmonitor?channel=1&subtype=0',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(56,1,2,16,'L-02-Incident-Camera',6,'192.168.10.27',554,NULL,NULL,3,'28:18:FD:6E:B4:25','CP-UNC-TA41PL3-Y0360','2308013239009337','2024-01-01','2024-01-10','2024-12-31','cam/realmonitor?channel=1&subtype=0',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(57,1,2,17,'L-02-Traffic-light',7,'NR',0,NULL,NULL,8,NULL,NULL,NULL,'2024-01-01','2024-01-10','2024-12-31','s21e',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(58,1,2,18,'L-02-UFD',1,'192.168.10.24',23,NULL,NULL,8,'D4:AD:20:74:B1:7F','USR-K6',NULL,'2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(59,1,2,19,'L-02-Boom Barrier',7,'NR',0,'NR','NR',12,'L1-Boom Barrier','L1-Boom Barrier','L1-Boom Barrier','2024-01-01','2024-01-10','2024-12-31','s31e',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(60,1,2,20,'L-02-Boom Loop',7,'NR',0,'NR','NR',12,'L1-BRL','L1-BRL','L1-BRL','2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(61,1,2,21,'L-02-AVC-System',1,'192.168.10.21',4001,NULL,NULL,13,'D4:AD:20:72:D0:0B','SE-1050',NULL,'2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(62,1,2,22,'L-02-Avc Loop',7,'NR',0,'NR','NR',12,'L1-AL','L1-AL','L1-AL','2024-01-01','2024-01-10','2024-12-31','',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0),(63,1,2,24,'L-02-Network-Switch',1,'192.168.10.20',80,NULL,NULL,11,'34:98:B5:99:38:62','GS108Ev3','3UHE2255007D5','2024-01-01','2024-01-10','2024-12-31','NR',NULL,1,'2024-03-27 12:00:23',0,'2024-03-27 12:00:23',0);
/*!40000 ALTER TABLE `tbl_equipmentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_equipmenttypemaster`
--

DROP TABLE IF EXISTS `tbl_equipmenttypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_equipmenttypemaster` (
  `EquipmentTypeId` smallint NOT NULL,
  `EquipmentTypeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EquipmentIconName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`EquipmentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_equipmenttypemaster`
--

LOCK TABLES `tbl_equipmenttypemaster` WRITE;
/*!40000 ALTER TABLE `tbl_equipmenttypemaster` DISABLE KEYS */;
INSERT INTO `tbl_equipmenttypemaster` VALUES (1,'Fog Light','fog-light.png',1,'2023-12-08 18:42:33',0,'2023-12-08 18:42:33',0),(2,'OHLS','OHLS-OFF.png',1,'2023-12-08 18:46:49',0,'2023-12-08 18:46:49',0),(3,'LOOP','loop.png',1,'2023-12-08 18:54:40',0,'2023-12-08 18:54:40',0),(4,'WIM','wim.png',1,'2023-12-08 18:55:00',0,'2023-12-08 18:55:00',0),(5,'RFID Reader','rfid.png',1,'2023-12-08 18:56:55',0,'2023-12-08 18:56:55',0),(6,'RFID Handheld',NULL,1,'2023-12-14 17:04:40',0,'2023-12-14 17:04:40',0),(7,'DIO/PLC','dio.png',1,'2023-12-14 17:04:55',0,'2023-12-14 17:04:55',0),(8,'Bar-Code Reader','barcode.png',1,'2023-12-14 17:05:17',0,'2023-12-14 17:05:17',0),(9,'ID-Scan','id-scanner.png',1,'2023-12-14 17:05:31',0,'2023-12-14 17:05:31',0),(10,'Recipt-Printer','recipt-printer.png',1,'2023-12-14 17:05:43',0,'2023-12-14 17:05:43',0),(11,'Booth Camera','booth-camera.png',1,'2023-12-14 17:05:56',0,'2023-12-14 17:05:56',0),(12,'MBC',NULL,1,'2023-12-14 17:09:01',0,'2023-12-14 17:09:01',0),(13,'Foot-Switch','foot-switch',1,'2023-12-14 17:09:25',0,'2023-12-14 17:09:25',0),(14,'Hooter-Violation Light','Hooter-Violation-Light-OFF.png',1,'2023-12-14 17:09:36',0,'2023-12-14 17:09:36',0),(15,'LPIC-Camera','lpic-camera.png',1,'2023-12-14 17:09:53',0,'2023-12-14 17:09:53',0),(16,'Incident Camera','camera.png',1,'2023-12-14 17:09:59',0,'2023-12-14 17:09:59',0),(17,'Traffic light','traffic-light.png',1,'2023-12-14 17:10:05',0,'2023-12-14 17:10:05',0),(18,'UFD','ufd.png',1,'2023-12-14 17:10:07',0,'2023-12-14 17:10:07',0),(19,'Boom Barrier','Boom-Barrier-OFF.png',1,'2023-12-14 17:10:26',0,'2023-12-14 17:10:26',0),(20,'Exit Loop','loop.png',1,'2023-12-14 17:10:34',0,'2023-12-14 17:10:34',0),(21,'AVC System','avc.png',1,'2023-12-14 17:10:39',0,'2023-12-14 17:10:39',0),(22,'AVC Loop','loop.png',1,'2023-12-14 18:52:36',0,'2023-12-14 18:52:36',0),(23,'Server',NULL,1,'2024-03-23 17:53:25',0,'2024-03-23 17:53:25',0),(24,'Networ Switch',NULL,1,'2024-03-23 17:53:39',0,'2024-03-23 17:53:39',0),(25,'Intercom Client',NULL,1,'2024-03-23 17:54:00',0,'2024-03-23 17:54:00',0),(26,'Intercom Master',NULL,1,'2024-03-27 11:41:43',0,'2024-03-27 11:41:43',0),(27,'Intercom Server',NULL,1,'2024-03-27 11:41:56',0,'2024-03-27 11:41:56',0),(28,'CCTV',NULL,1,'2024-03-27 11:42:43',0,'2024-03-27 11:42:43',0),(29,'TLC',NULL,1,'2024-03-27 11:43:21',0,'2024-03-27 11:43:21',0),(30,'Joystick',NULL,1,'2024-03-27 11:44:32',0,'2024-03-27 11:44:32',0),(31,'Printer',NULL,1,'2024-03-27 11:44:59',0,'2024-03-27 11:44:59',0),(32,'NVR',NULL,1,'2024-03-27 11:45:17',0,'2024-03-27 11:45:17',0),(33,'PTZ Camera',NULL,1,'2024-03-27 11:45:32',0,'2024-03-27 11:45:32',0),(34,'Workstation',NULL,1,'2024-03-27 11:45:51',0,'2024-03-27 11:45:51',0),(35,'Network Router',NULL,1,'2024-03-27 11:47:44',0,'2024-03-27 11:47:44',0);
/*!40000 ALTER TABLE `tbl_equipmenttypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exempttypemaster`
--

DROP TABLE IF EXISTS `tbl_exempttypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_exempttypemaster` (
  `ExemptTypeId` smallint NOT NULL,
  `ExemptTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`ExemptTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exempttypemaster`
--

LOCK TABLES `tbl_exempttypemaster` WRITE;
/*!40000 ALTER TABLE `tbl_exempttypemaster` DISABLE KEYS */;
INSERT INTO `tbl_exempttypemaster` VALUES (1,'VIP',1,'2021-11-09 12:43:40',0,'2023-03-22 12:52:09',1),(2,'Government of India',1,'2021-11-09 12:43:48',0,'2022-12-17 10:47:41',1),(3,'Defence',1,'2021-11-09 12:43:55',0,'2022-12-17 10:47:21',1),(4,'Fire Vehicle',1,'2021-11-09 12:44:07',0,'2023-03-22 12:52:20',1),(5,'UPEIDA',1,'2021-11-09 12:44:15',0,'2022-12-17 10:48:09',1),(6,'Ambulance',1,'2021-11-09 12:44:28',0,'2022-12-17 10:49:17',1),(7,'Funeral Van',1,'2021-11-09 12:44:37',0,'2022-12-17 10:49:35',1),(8,'Person with disability',1,'2021-11-09 12:44:44',0,'2022-12-17 10:49:57',1),(9,'Police',1,'2021-11-09 12:44:55',0,'2023-04-04 11:09:12',7),(10,'Government of U.P',1,'2021-11-09 12:45:07',0,'2023-04-05 15:55:24',7);
/*!40000 ALTER TABLE `tbl_exempttypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fastagvehicleclass`
--

DROP TABLE IF EXISTS `tbl_fastagvehicleclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fastagvehicleclass` (
  `FasTagVehicleClassId` bigint NOT NULL,
  `FasTagVehicleClassName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FasTagVehicleClassDescription` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermissibleWeight` decimal(18,3) DEFAULT NULL,
  `AxcelCount` smallint DEFAULT '0',
  `VehicleHeight` decimal(16,3) DEFAULT '0.000',
  `VehicleLength` decimal(16,3) DEFAULT '0.000',
  `FasTagVehicleClassColor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`FasTagVehicleClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fastagvehicleclass`
--

LOCK TABLES `tbl_fastagvehicleclass` WRITE;
/*!40000 ALTER TABLE `tbl_fastagvehicleclass` DISABLE KEYS */;
INSERT INTO `tbl_fastagvehicleclass` VALUES (4,'Car/Jeep/Van','Car / Jeep / Van',7500.000,0,0.000,0.000,'#ede15b',1,'2023-08-16 12:40:22',0,'2023-08-20 23:54:19',0),(5,'LCV-2 Axle','Light Commercial Vehicle - 2 Axle',12000.000,0,0.000,0.000,'#bdcf32',1,'2023-08-16 12:40:22',0,'2023-08-20 17:20:49',0),(6,'LCV-3 Axle','Light Commercial Vehicle - 3 Axle',12000.000,0,0.000,0.000,'#87bc45',1,'2023-08-16 12:40:22',0,'2023-08-20 17:21:05',0),(7,'Bus 2-Axle','Bus 2 Axle',16200.000,0,0.000,0.000,'#27aeef',1,'2023-08-16 12:40:22',0,'2023-08-20 17:21:34',0),(8,'Bus 3-Axle','Bus 3 Axle',28000.000,0,0.000,0.000,'#b33dc6',1,'2023-08-16 12:40:22',0,'2023-08-20 17:22:23',0),(9,'Mini Bus','Mini Bus',16200.000,0,0.000,0.000,'#e60049',1,'2023-08-16 12:40:22',0,'2023-08-20 17:37:23',0),(10,'Truck 2 Axle','Truck 2 Axle',18500.000,0,0.000,0.000,'#0bb4ff',1,'2023-08-16 12:40:22',0,'2023-08-20 17:21:54',0),(11,'Truck 3 Axle','Truck 3 Axle',28000.000,0,0.000,0.000,'#50e991',1,'2023-08-16 12:40:22',0,'2023-08-20 17:22:28',0),(12,'Truck 4 Axle','Truck 4 Axle',35000.000,0,0.000,0.000,'#e6d800',1,'2023-08-16 12:40:22',0,'2023-08-20 17:22:41',0),(13,'Truck 5 Axle','Truck 5 Axle',53500.000,0,0.000,0.000,'#9b19f5',1,'2023-08-16 12:40:22',0,'2023-08-20 17:36:25',0),(14,'Truck 6 Axle','Truck 6 Axle',49000.000,0,0.000,0.000,'#ffa300',1,'2023-08-16 12:40:22',0,'2023-08-20 17:36:05',0),(15,'Truck Multi Axle ( 7 and above )','Truck Multi Axle ( 7 and above )',55000.000,0,0.000,0.000,'#dc0ab4',1,'2023-08-16 12:40:22',0,'2023-08-20 17:35:55',0),(16,'Earth moving machinery','Earth moving machinery',53500.000,0,0.000,0.000,'#b3d4ff',1,'2023-08-16 12:40:22',0,'2023-08-20 17:36:50',0),(17,'Heavy Construction machinery','Heavy Construction machinery',53500.000,0,0.000,0.000,'#00bfa0',1,'2023-08-16 12:40:22',0,'2023-08-20 17:36:55',0),(18,'Tractor','Tractor',15000.000,0,0.000,0.000,'#b30000',1,'2023-08-16 12:40:22',0,'2023-08-20 17:35:25',0),(19,'Tractor with trailor','Tractor with trailor',15000.000,0,0.000,0.000,'#7c1158',1,'2023-08-16 12:40:22',0,'2023-08-20 17:35:14',0),(20,'Tata Ace or Mini LCV','Tata Ace or similar mini light commercial vehicle',15000.000,0,0.000,0.000,'#4421af',1,'2023-08-16 12:40:22',0,'2023-08-20 17:35:05',0);
/*!40000 ALTER TABLE `tbl_fastagvehicleclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_journeymaster`
--

DROP TABLE IF EXISTS `tbl_journeymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_journeymaster` (
  `JourneyId` bigint DEFAULT NULL,
  `JourneyName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SourcePlazaId` bigint DEFAULT NULL,
  `DestinationPlazaId` bigint DEFAULT NULL,
  `JourneyDirectionId` int DEFAULT NULL,
  `JourneyDistance` decimal(10,3) DEFAULT NULL,
  `MaxTravelTime` bigint DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_journeymaster`
--

LOCK TABLES `tbl_journeymaster` WRITE;
/*!40000 ALTER TABLE `tbl_journeymaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_journeymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_laneconfiguration`
--

DROP TABLE IF EXISTS `tbl_laneconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_laneconfiguration` (
  `LaneId` int NOT NULL AUTO_INCREMENT,
  `PlazaId` int DEFAULT NULL,
  `LaneNumber` int DEFAULT NULL,
  `LaneName` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LaneTypeId` int DEFAULT NULL,
  `LanePositionId` int DEFAULT NULL,
  `LanePointId` int DEFAULT NULL,
  `LaneDirectionId` int DEFAULT NULL,
  `LaneStatusId` int DEFAULT NULL,
  `LaneModeId` int DEFAULT NULL,
  `LaneSystemIpAddress` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint DEFAULT NULL,
  PRIMARY KEY (`LaneId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_laneconfiguration`
--

LOCK TABLES `tbl_laneconfiguration` WRITE;
/*!40000 ALTER TABLE `tbl_laneconfiguration` DISABLE KEYS */;
INSERT INTO `tbl_laneconfiguration` VALUES (2,1,2,'L002',3,0,1,3,0,1,'192.168.1.21',1,'2023-08-16 15:43:06',0,'2024-03-27 10:21:07',1);
/*!40000 ALTER TABLE `tbl_laneconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanedirectionmaster`
--

DROP TABLE IF EXISTS `tbl_lanedirectionmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanedirectionmaster` (
  `LaneDirectionId` smallint NOT NULL,
  `LaneDirectionName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LaneDirectionCode` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`LaneDirectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanedirectionmaster`
--

LOCK TABLES `tbl_lanedirectionmaster` WRITE;
/*!40000 ALTER TABLE `tbl_lanedirectionmaster` DISABLE KEYS */;
INSERT INTO `tbl_lanedirectionmaster` VALUES (1,'East','E',1,'2023-11-23 18:29:51',0,'2023-11-23 18:29:51',0),(2,'West','W',1,'2023-11-23 18:29:56',0,'2023-11-23 18:29:56',0),(3,'North','N',1,'2023-11-23 18:30:00',0,'2023-11-23 18:30:00',0),(4,'South','S',1,'2023-11-23 18:30:04',0,'2023-11-23 18:30:04',0),(5,'North East','NE',1,'2023-12-04 16:24:28',0,'2023-12-04 16:24:28',0),(6,'North West','NW',1,'2023-12-04 16:24:34',0,'2023-12-04 16:24:34',0),(7,'South East','SE',1,'2023-12-04 16:24:46',0,'2023-12-04 16:24:46',0),(8,'South West','SW',1,'2023-12-04 16:24:48',0,'2023-12-04 16:24:48',0);
/*!40000 ALTER TABLE `tbl_lanedirectionmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanemodemaster`
--

DROP TABLE IF EXISTS `tbl_lanemodemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanemodemaster` (
  `LaneModeId` smallint NOT NULL,
  `LaneModeName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`LaneModeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanemodemaster`
--

LOCK TABLES `tbl_lanemodemaster` WRITE;
/*!40000 ALTER TABLE `tbl_lanemodemaster` DISABLE KEYS */;
INSERT INTO `tbl_lanemodemaster` VALUES (0,'Maintenance',1,'2023-11-23 18:35:59',0,'2023-11-23 18:35:59',0),(1,'Normal',1,'2023-11-23 18:36:07',0,'2023-11-23 18:36:07',0);
/*!40000 ALTER TABLE `tbl_lanemodemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanepointmaster`
--

DROP TABLE IF EXISTS `tbl_lanepointmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanepointmaster` (
  `LanePointId` smallint NOT NULL,
  `LanePointName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`LanePointId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanepointmaster`
--

LOCK TABLES `tbl_lanepointmaster` WRITE;
/*!40000 ALTER TABLE `tbl_lanepointmaster` DISABLE KEYS */;
INSERT INTO `tbl_lanepointmaster` VALUES (0,'Normal',1,'2023-11-23 18:34:00',0,'2023-11-23 18:34:00',0),(1,'Entry',1,'2023-11-23 18:34:02',0,'2023-11-23 18:34:02',0),(2,'Exit',1,'2023-11-23 18:34:04',0,'2023-11-23 18:34:04',0);
/*!40000 ALTER TABLE `tbl_lanepointmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanepositionmaster`
--

DROP TABLE IF EXISTS `tbl_lanepositionmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanepositionmaster` (
  `LanePositionId` smallint NOT NULL,
  `LanePositionName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`LanePositionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanepositionmaster`
--

LOCK TABLES `tbl_lanepositionmaster` WRITE;
/*!40000 ALTER TABLE `tbl_lanepositionmaster` DISABLE KEYS */;
INSERT INTO `tbl_lanepositionmaster` VALUES (0,'LHS',1,'2023-11-23 18:32:27',0,'2023-11-23 18:32:27',0),(1,'RHS',1,'2023-11-23 18:32:27',0,'2023-11-23 18:32:27',0);
/*!40000 ALTER TABLE `tbl_lanepositionmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanestatusmaster`
--

DROP TABLE IF EXISTS `tbl_lanestatusmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanestatusmaster` (
  `LaneStatusId` smallint NOT NULL,
  `LaneStatusName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`LaneStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanestatusmaster`
--

LOCK TABLES `tbl_lanestatusmaster` WRITE;
/*!40000 ALTER TABLE `tbl_lanestatusmaster` DISABLE KEYS */;
INSERT INTO `tbl_lanestatusmaster` VALUES (0,'Open',1,'2023-11-23 18:34:57',0,'2023-11-23 18:34:57',0),(1,'Close',1,'2023-11-23 18:35:00',0,'2023-11-23 18:35:00',0);
/*!40000 ALTER TABLE `tbl_lanestatusmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanetransaction`
--

DROP TABLE IF EXISTS `tbl_lanetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanetransaction` (
  `MasterTransactionId` bigint DEFAULT '0',
  `PlazaTransactionId` bigint DEFAULT '0',
  `LaneTransactionId` bigint NOT NULL,
  `SystemIntegratorId` smallint DEFAULT NULL,
  `JourneyId` int DEFAULT NULL,
  `PlazaId` smallint DEFAULT NULL,
  `LaneId` smallint DEFAULT NULL,
  `LaneStatusId` bit(1) DEFAULT NULL,
  `LaneModeId` bit(1) DEFAULT NULL,
  `LaneDirectionId` bit(1) DEFAULT NULL,
  `ShiftId` smallint DEFAULT NULL,
  `TransactionTypeId` smallint DEFAULT NULL,
  `PaymentTypeId` smallint DEFAULT '0',
  `ExemptTypeId` smallint DEFAULT '0',
  `ExemptSubTypeId` smallint DEFAULT '0',
  `VehicleClassId` smallint DEFAULT NULL,
  `VehicleSubClassId` smallint DEFAULT NULL,
  `VehicleAvcClassId` smallint DEFAULT NULL,
  `PlateNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RCTNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TagEPC` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TagClassId` smallint DEFAULT '0',
  `TagPlateNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `TagReadDateTime` datetime(6) DEFAULT NULL,
  `TagReadCount` int DEFAULT '0',
  `IsReadByReader` bit(1) DEFAULT b'1',
  `PermissibleVehicleWeight` decimal(18,3) DEFAULT '0.000',
  `ActualVehicleWeight` decimal(18,3) DEFAULT '0.000',
  `IsOverWeightCharged` bit(1) DEFAULT b'0',
  `OverWeightAmount` decimal(18,2) DEFAULT '0.00',
  `TagPenaltyAmount` decimal(18,2) DEFAULT '0.00',
  `TransactionAmount` decimal(18,2) DEFAULT '0.00',
  `TransactionDateTime` datetime(6) DEFAULT NULL,
  `TransactionFrontImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionBackImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionAvcImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionVideo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExemptionProofImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `DestinationPlazaId` smallint DEFAULT '0',
  `UserId` bigint DEFAULT NULL,
  `LoginId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `IsReturnJourney` bit(1) DEFAULT b'0',
  `IsExcessJourney` bit(1) DEFAULT b'0',
  `IsBarrierAutoClose` bit(1) DEFAULT b'0',
  `IsTowVehicle` bit(1) DEFAULT b'0',
  `IsFleetTranscation` bit(1) DEFAULT b'0',
  `FleetCount` smallint DEFAULT '0',
  `TransactionStatus` bit(1) DEFAULT b'1',
  `IsReviewedRequired` bit(1) DEFAULT b'1',
  `ReviewedStatus` bit(1) DEFAULT b'0',
  `ReviewedPlateNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ReviewedClassCorrectionId` smallint DEFAULT '0',
  `ReviewedSubClassId` smallint DEFAULT '0',
  `ReviewedTransactionTypeId` smallint DEFAULT '0',
  `ReviewedTransactionAmount` decimal(18,2) DEFAULT '0.00',
  `DifferenceAmount` decimal(18,2) DEFAULT '0.00',
  `ReviewedById` bigint DEFAULT '0',
  `ReviewedDateTime` datetime(6) DEFAULT NULL,
  `ReviewedRemark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ReceivedDateTime` datetime(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ReceivedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  `IsMediaTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`LaneTransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanetransaction`
--

LOCK TABLES `tbl_lanetransaction` WRITE;
/*!40000 ALTER TABLE `tbl_lanetransaction` DISABLE KEYS */;
INSERT INTO `tbl_lanetransaction` VALUES (0,0,2024032220480102,1,0,1,2,_binary '\0',_binary '',_binary '\0',3,1,0,0,0,0,4,0,'','2403222048010102','',0,'','2024-03-22 20:47:42.687000',0,_binary '\0',75000.000,0.000,_binary '\0',0.00,0.00,40.00,'2024-03-22 20:48:01.134000','','','','','',0,1,'admin',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',0,_binary '',_binary '',_binary '\0','',0,0,0,0.00,0.00,0,NULL,'',NULL,'2024-03-22 20:48:01','2024-03-22 20:48:01',_binary '\0',_binary '\0'),(0,0,2024032720104502,1,0,1,2,_binary '\0',_binary '',_binary '\0',3,2,1,0,0,4,4,0,'','2403272010450102','',0,'','2024-03-27 20:10:32.352000',0,_binary '\0',7500.000,0.000,_binary '\0',0.00,100.00,100.00,'2024-03-27 20:10:45.176000','','','','','',0,1,'admin',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',0,_binary '',_binary '',_binary '\0','',0,0,0,0.00,0.00,0,NULL,'',NULL,'2024-03-27 20:10:45','2024-03-27 20:10:45',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `tbl_lanetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lanetypemaster`
--

DROP TABLE IF EXISTS `tbl_lanetypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lanetypemaster` (
  `LaneTypeId` smallint NOT NULL,
  `LaneTypeName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`LaneTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lanetypemaster`
--

LOCK TABLES `tbl_lanetypemaster` WRITE;
/*!40000 ALTER TABLE `tbl_lanetypemaster` DISABLE KEYS */;
INSERT INTO `tbl_lanetypemaster` VALUES (0,'Dedicated',1,'2023-11-23 18:31:09',0,'2023-11-23 18:31:09',0),(1,'Hybrid',1,'2023-11-23 18:31:16',0,'2023-11-23 18:31:16',0),(2,'Handheld',1,'2023-11-23 18:31:24',0,'2023-11-23 18:31:24',0),(3,'Booth Less',1,'2024-03-27 11:32:23',0,'2024-03-27 11:32:23',0);
/*!40000 ALTER TABLE `tbl_lanetypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manufacturedetails`
--

DROP TABLE IF EXISTS `tbl_manufacturedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_manufacturedetails` (
  `ManufactureId` int NOT NULL AUTO_INCREMENT,
  `ManufactureName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufactureAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufactureEmailId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufactureMobileNumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` int DEFAULT NULL,
  PRIMARY KEY (`ManufactureId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manufacturedetails`
--

LOCK TABLES `tbl_manufacturedetails` WRITE;
/*!40000 ALTER TABLE `tbl_manufacturedetails` DISABLE KEYS */;
INSERT INTO `tbl_manufacturedetails` VALUES (1,'Star','Start Data','start@gmail.com','9865324523',1,'2021-11-09 15:04:11',0,'2023-08-17 13:07:59',0),(2,'Hikvision',NULL,NULL,NULL,1,'2021-11-09 15:04:33',0,'2021-11-09 15:04:33',0),(3,'Kathrine',NULL,NULL,NULL,1,'2021-11-09 15:05:08',0,'2021-11-09 15:05:08',0),(4,'Spectra',NULL,NULL,NULL,1,'2021-11-11 20:48:11',0,'2021-11-11 20:48:11',0),(5,'Photon',NULL,NULL,NULL,1,'2021-11-11 20:48:58',0,'2021-11-11 20:48:58',0),(6,'In House',NULL,NULL,NULL,1,'2021-11-11 21:12:08',0,'2021-11-11 21:12:08',0),(7,'omron',NULL,NULL,NULL,1,'2021-11-11 21:28:34',0,'2021-11-11 21:28:34',0);
/*!40000 ALTER TABLE `tbl_manufacturedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manufacturerdetails`
--

DROP TABLE IF EXISTS `tbl_manufacturerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_manufacturerdetails` (
  `ManufacturerId` smallint NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint DEFAULT NULL,
  PRIMARY KEY (`ManufacturerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manufacturerdetails`
--

LOCK TABLES `tbl_manufacturerdetails` WRITE;
/*!40000 ALTER TABLE `tbl_manufacturerdetails` DISABLE KEYS */;
INSERT INTO `tbl_manufacturerdetails` VALUES (1,'Canon',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(2,'CCL',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(3,'CP Plus',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(4,'D LINK',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(5,'DELL',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(6,'FORTINET 40F',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(7,'HPE',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(8,'KITS','GreenField Colony','9718399557','supports@kavyan.com',1,'2024-03-23 17:36:00',0,'2024-03-27 08:31:01',1),(9,'Mantra',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(10,'NagaArjun',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(11,'Netgear',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(12,'PARAMA',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(13,'Sagar',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(14,'Toshiba',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0),(15,'TVS',NULL,NULL,NULL,1,'2024-03-23 17:36:00',0,'2024-03-23 17:36:00',0);
/*!40000 ALTER TABLE `tbl_manufacturerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paymenttypemaster`
--

DROP TABLE IF EXISTS `tbl_paymenttypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_paymenttypemaster` (
  `PaymentTypeId` smallint NOT NULL,
  `PaymentTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionTypeId` smallint DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`PaymentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paymenttypemaster`
--

LOCK TABLES `tbl_paymenttypemaster` WRITE;
/*!40000 ALTER TABLE `tbl_paymenttypemaster` DISABLE KEYS */;
INSERT INTO `tbl_paymenttypemaster` VALUES (1,'Cash',2,1,'2021-11-09 16:28:15',0,'2022-10-31 11:52:16',1),(2,'Google Pay',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(3,'Google Pay',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(4,'Phone Pay',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(5,'HDFC PayZapp',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(6,'ICICI Pockets',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(7,'Credit Card',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(8,'Credit Card',2,1,'2021-11-09 16:28:15',0,'2021-11-09 16:28:15',0),(9,'Yono by SBI',2,1,'2021-11-09 16:28:15',0,'2022-10-31 11:52:16',1),(10,'Debit Card',2,1,'2021-11-09 16:28:15',0,'2022-08-12 13:42:09',0),(11,'Debit Card',2,1,'2021-11-09 16:28:15',0,'2022-08-12 13:42:09',0);
/*!40000 ALTER TABLE `tbl_paymenttypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_plazaconfiguration`
--

DROP TABLE IF EXISTS `tbl_plazaconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_plazaconfiguration` (
  `PlazaId` int NOT NULL AUTO_INCREMENT,
  `SystemIntegratorId` int DEFAULT NULL,
  `PlazaNumber` int DEFAULT NULL,
  `PlazaName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaTypeId` int DEFAULT NULL,
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
  `PlazaAcquirerId` int DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint DEFAULT NULL,
  PRIMARY KEY (`PlazaId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_plazaconfiguration`
--

LOCK TABLES `tbl_plazaconfiguration` WRITE;
/*!40000 ALTER TABLE `tbl_plazaconfiguration` DISABLE KEYS */;
INSERT INTO `tbl_plazaconfiguration` VALUES (1,1,NULL,'Jujumura Toll Plaza',0,'127.0.0.1',5.000,0.000000,0.000000,'123456',NULL,NULL,NULL,NULL,NULL,NULL,1,'2023-08-15 18:29:56',0,'2024-03-27 08:31:13',1);
/*!40000 ALTER TABLE `tbl_plazaconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_protocoltypemaster`
--

DROP TABLE IF EXISTS `tbl_protocoltypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_protocoltypemaster` (
  `ProtocolTypeId` smallint NOT NULL,
  `ProtocolTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`ProtocolTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_protocoltypemaster`
--

LOCK TABLES `tbl_protocoltypemaster` WRITE;
/*!40000 ALTER TABLE `tbl_protocoltypemaster` DISABLE KEYS */;
INSERT INTO `tbl_protocoltypemaster` VALUES (1,'TCP',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0),(2,'UDP',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0),(3,'Serail',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0),(4,'MQTT',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0),(5,'HTTP',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0),(6,'RTSP',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0),(7,'Other',1,'2024-02-12 14:58:15',0,'2024-02-12 14:58:15',0);
/*!40000 ALTER TABLE `tbl_protocoltypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shiftstatuslanedetails`
--

DROP TABLE IF EXISTS `tbl_shiftstatuslanedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shiftstatuslanedetails` (
  `ShiftStatusId` bigint DEFAULT NULL,
  `LaneId` int DEFAULT NULL,
  `LaneTransactionCount` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shiftstatuslanedetails`
--

LOCK TABLES `tbl_shiftstatuslanedetails` WRITE;
/*!40000 ALTER TABLE `tbl_shiftstatuslanedetails` DISABLE KEYS */;
INSERT INTO `tbl_shiftstatuslanedetails` VALUES (3,1,0),(0,1,0);
/*!40000 ALTER TABLE `tbl_shiftstatuslanedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shifttimining`
--

DROP TABLE IF EXISTS `tbl_shifttimining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shifttimining` (
  `ShiftId` smallint NOT NULL,
  `StartTimmng` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EndTimming` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`ShiftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shifttimining`
--

LOCK TABLES `tbl_shifttimining` WRITE;
/*!40000 ALTER TABLE `tbl_shifttimining` DISABLE KEYS */;
INSERT INTO `tbl_shifttimining` VALUES (1,'00:00:00','07:59:59',1,'2022-05-04 16:36:13',0,'2022-05-04 16:36:13',0),(2,'08:00:00','15:59:59',1,'2022-05-04 16:36:13',0,'2022-05-04 16:36:13',0),(3,'16:00:00','23:59:59',1,'2022-05-04 16:36:13',0,'2022-05-04 16:36:13',0);
/*!40000 ALTER TABLE `tbl_shifttimining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_systemintegratorconfiguration`
--

DROP TABLE IF EXISTS `tbl_systemintegratorconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_systemintegratorconfiguration` (
  `SystemIntegratorId` int NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint DEFAULT NULL,
  PRIMARY KEY (`SystemIntegratorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_systemintegratorconfiguration`
--

LOCK TABLES `tbl_systemintegratorconfiguration` WRITE;
/*!40000 ALTER TABLE `tbl_systemintegratorconfiguration` DISABLE KEYS */;
INSERT INTO `tbl_systemintegratorconfiguration` VALUES (1,'M Cube','Baraily','9878654523','support@MCube.com','','',1,'2023-08-15 16:30:36',0,'2024-03-27 08:31:08',1);
/*!40000 ALTER TABLE `tbl_systemintegratorconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_systemsetting`
--

DROP TABLE IF EXISTS `tbl_systemsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_systemsetting` (
  `DefaultPlazaId` smallint DEFAULT NULL,
  `AllotmentDays` smallint DEFAULT NULL,
  `IsAccessControl` tinyint(1) DEFAULT '0',
  `CashPenalty` tinyint(1) DEFAULT '1',
  `LoginAccess` tinyint(1) DEFAULT '0',
  `ExemptAccess` tinyint(1) DEFAULT '0',
  `FleetAccess` tinyint(1) DEFAULT '0',
  `SubClassRequired` tinyint(1) DEFAULT '1',
  `OpeningBalance` decimal(18,2) DEFAULT '0.00',
  `ClosingBalance` decimal(18,2) DEFAULT '0.00',
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_systemsetting`
--

LOCK TABLES `tbl_systemsetting` WRITE;
/*!40000 ALTER TABLE `tbl_systemsetting` DISABLE KEYS */;
INSERT INTO `tbl_systemsetting` VALUES (1,4,0,1,1,1,1,1,50000.00,0.00,1,'2023-08-24 14:28:39',0,'2024-03-27 08:33:58',1);
/*!40000 ALTER TABLE `tbl_systemsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_systemvehicleclass`
--

DROP TABLE IF EXISTS `tbl_systemvehicleclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_systemvehicleclass` (
  `SystemVehicleClassId` smallint NOT NULL,
  `FasTagVehicleClassId` smallint DEFAULT NULL,
  `AvcVehicleClassId` smallint DEFAULT NULL,
  `SystemVehicleClassName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemVehicleClassDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemSubClassIds` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermissibleWeight` decimal(18,3) DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`SystemVehicleClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_systemvehicleclass`
--

LOCK TABLES `tbl_systemvehicleclass` WRITE;
/*!40000 ALTER TABLE `tbl_systemvehicleclass` DISABLE KEYS */;
INSERT INTO `tbl_systemvehicleclass` VALUES (1,4,1,'Car/Jeep/Van','Car / Jeep / Van','4',7500.000,1,'2023-08-21 17:02:24',0,'2024-03-27 10:19:03',1),(2,5,2,'LCV 2-4 Axle','Light Commercial Vehicle - 2 Axle','6,5',12000.000,1,'2023-08-21 17:22:52',0,'2024-03-27 09:43:43',1),(3,7,3,'Bus','Bus 2 Axle','8,7',16200.000,1,'2023-08-21 18:35:04',0,'2024-03-27 09:44:19',1),(4,10,5,'Truck ','Truck 2 Axle','11,10',18500.000,1,'2023-08-21 18:43:27',0,'2024-03-27 09:45:40',1),(5,12,6,'MAV 4-6 Axle','Truck 4 Axle','12,13,14',35000.000,1,'2023-08-21 18:45:28',0,'2024-03-27 10:05:02',1),(6,15,7,'MAV 7 or More Axle','Truck Multi Axle ( 7 and above )','17,16,15',55000.000,1,'2023-08-21 18:46:16',0,'2024-03-27 10:16:51',1);
/*!40000 ALTER TABLE `tbl_systemvehicleclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_systemvehiclesubclass`
--

DROP TABLE IF EXISTS `tbl_systemvehiclesubclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_systemvehiclesubclass` (
  `SystemVehicleClassId` smallint DEFAULT NULL,
  `FasTagVehicleClassId` smallint DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_systemvehiclesubclass`
--

LOCK TABLES `tbl_systemvehiclesubclass` WRITE;
/*!40000 ALTER TABLE `tbl_systemvehiclesubclass` DISABLE KEYS */;
INSERT INTO `tbl_systemvehiclesubclass` VALUES (1,4,1,'2023-12-17 21:24:41',0,'2024-03-27 15:49:03',0),(2,5,1,'2023-08-21 18:37:38',0,'2024-03-27 15:13:43',0),(2,6,1,'2023-08-21 18:37:38',0,'2024-03-27 15:13:43',0),(3,7,1,'2023-08-21 18:37:39',0,'2024-03-27 15:14:19',0),(3,8,1,'2023-08-21 18:37:39',0,'2024-03-27 15:14:19',0),(9,9,1,'2023-08-21 18:48:21',0,'2023-08-21 18:48:21',0),(4,10,1,'2023-11-23 16:11:29',0,'2024-03-27 15:15:40',0),(4,11,1,'2023-11-23 16:11:29',0,'2024-03-27 15:15:40',0),(5,12,1,'2023-08-21 18:45:28',0,'2024-03-27 15:35:02',0),(5,13,1,'2023-08-21 18:45:28',0,'2024-03-27 15:35:02',0),(5,14,1,'2023-08-21 18:45:28',0,'2024-03-27 15:35:02',0),(6,15,1,'2023-08-21 18:46:16',0,'2024-03-27 15:46:51',0),(6,16,1,'2023-08-21 18:46:16',0,'2024-03-27 15:46:51',0),(6,17,1,'2023-08-21 18:46:16',0,'2024-03-27 15:46:51',0),(7,18,1,'2023-08-21 18:46:58',0,'2023-08-21 18:46:58',0),(8,19,1,'2023-12-01 14:56:46',0,'2023-12-01 14:56:46',0),(9,20,1,'2023-08-21 18:48:21',0,'2023-08-21 18:48:21',0);
/*!40000 ALTER TABLE `tbl_systemvehiclesubclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tollfareconfiguration`
--

DROP TABLE IF EXISTS `tbl_tollfareconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tollfareconfiguration` (
  `TollFareId` bigint DEFAULT NULL,
  `JourneyId` bigint DEFAULT NULL,
  `SystemVehicleClassId` smallint DEFAULT NULL,
  `SubVehicleClassId` smallint DEFAULT NULL,
  `TollFare` decimal(18,2) DEFAULT NULL,
  `ReturnFare` decimal(18,2) DEFAULT NULL,
  `FasTagPenalty` decimal(18,2) DEFAULT NULL,
  `OverweightPenalty` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tollfareconfiguration`
--

LOCK TABLES `tbl_tollfareconfiguration` WRITE;
/*!40000 ALTER TABLE `tbl_tollfareconfiguration` DISABLE KEYS */;
INSERT INTO `tbl_tollfareconfiguration` VALUES (2,0,1,4,40.00,20.00,40.00,40.00),(2,0,2,5,50.00,25.00,50.00,50.00),(2,0,2,6,60.00,30.00,60.00,60.00),(2,0,3,7,70.00,35.00,70.00,70.00),(2,0,3,8,80.00,40.00,80.00,80.00),(2,0,4,10,100.00,50.00,100.00,100.00),(2,0,4,11,110.00,55.00,110.00,110.00),(2,0,5,12,120.00,60.00,120.00,120.00),(2,0,5,13,130.00,65.00,130.00,130.00),(2,0,5,14,140.00,70.00,140.00,140.00),(2,0,6,15,150.00,75.00,150.00,150.00),(2,0,6,16,160.00,80.00,160.00,160.00),(2,0,6,17,170.00,85.00,170.00,170.00),(2,0,7,18,180.00,90.00,180.00,180.00),(2,0,8,19,190.00,95.00,190.00,190.00),(2,0,9,9,90.00,45.00,90.00,90.00),(2,0,9,20,200.00,100.00,200.00,200.00);
/*!40000 ALTER TABLE `tbl_tollfareconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tollfaremaster`
--

DROP TABLE IF EXISTS `tbl_tollfaremaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tollfaremaster` (
  `TollFareId` bigint NOT NULL AUTO_INCREMENT,
  `EffectedFrom` date DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`TollFareId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tollfaremaster`
--

LOCK TABLES `tbl_tollfaremaster` WRITE;
/*!40000 ALTER TABLE `tbl_tollfaremaster` DISABLE KEYS */;
INSERT INTO `tbl_tollfaremaster` VALUES (2,'2023-12-18',1,'2023-08-21 18:58:31',0,'2023-11-23 17:17:21',0);
/*!40000 ALTER TABLE `tbl_tollfaremaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transactiontypemaster`
--

DROP TABLE IF EXISTS `tbl_transactiontypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transactiontypemaster` (
  `TransactionTypeId` smallint NOT NULL,
  `TransactionTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReviewRequired` tinyint(1) DEFAULT '0',
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`TransactionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactiontypemaster`
--

LOCK TABLES `tbl_transactiontypemaster` WRITE;
/*!40000 ALTER TABLE `tbl_transactiontypemaster` DISABLE KEYS */;
INSERT INTO `tbl_transactiontypemaster` VALUES (1,'FasTag',1,1,'2021-11-11 10:33:02',0,'2021-11-11 10:33:02',0),(2,'Cash',1,1,'2021-05-04 18:31:21',0,'2021-05-04 18:31:21',0),(3,'Exempt',1,1,'2021-05-04 18:31:21',0,'2021-05-04 18:31:21',0),(4,'Violation',1,1,'2021-05-04 18:31:21',0,'2021-05-04 18:31:21',0),(5,'Discount Pass\r',1,1,'2022-04-04 17:06:48',0,'2022-04-04 17:06:48',0);
/*!40000 ALTER TABLE `tbl_transactiontypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usermaster`
--

DROP TABLE IF EXISTS `tbl_usermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usermaster` (
  `UserId` bigint NOT NULL,
  `PlazaId` int DEFAULT NULL,
  `LoginId` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginPassword` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountExpiredDate` date DEFAULT NULL,
  `UserProfileImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserTypeId` smallint DEFAULT NULL,
  `RoleId` int DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usermaster`
--

LOCK TABLES `tbl_usermaster` WRITE;
/*!40000 ALTER TABLE `tbl_usermaster` DISABLE KEYS */;
INSERT INTO `tbl_usermaster` VALUES (1,1,'admin','g70WQdAPaI8OuyeBHISrlg==','Admin','adminAS','admin@tp.com','897856351256','0000-00-00',NULL,4,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,NULL,'Tcadmin','/jOfdeulGvUuYZepNEuqgg==','toll','collector ','tc1@plaza.com','7898654523','2029-12-31',NULL,4,2,1,'0000-00-00 00:00:00',1,'2024-03-07 16:01:30',0);
/*!40000 ALTER TABLE `tbl_usermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wimtransaction`
--

DROP TABLE IF EXISTS `tbl_wimtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wimtransaction` (
  `LaneId` smallint DEFAULT NULL,
  `TransactionId` bigint DEFAULT NULL,
  `TotalWeight` decimal(18,3) DEFAULT NULL,
  `AxleCount` smallint DEFAULT NULL,
  `TransactionDateTime` datetime(6) DEFAULT NULL,
  `IsDataTransfer` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wimtransaction`
--

LOCK TABLES `tbl_wimtransaction` WRITE;
/*!40000 ALTER TABLE `tbl_wimtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wimtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wimtransactionaxledetails`
--

DROP TABLE IF EXISTS `tbl_wimtransactionaxledetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wimtransactionaxledetails` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `LaneId` smallint DEFAULT NULL,
  `TransactionId` bigint DEFAULT NULL,
  `AxleNumber` smallint DEFAULT NULL,
  `AxleWeight` decimal(18,3) DEFAULT NULL,
  `Speed` decimal(18,2) DEFAULT NULL,
  `AxleDistance` decimal(18,2) DEFAULT NULL,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wimtransactionaxledetails`
--

LOCK TABLES `tbl_wimtransactionaxledetails` WRITE;
/*!40000 ALTER TABLE `tbl_wimtransactionaxledetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wimtransactionaxledetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tmsv1_lane'
--
/*!50003 DROP FUNCTION IF EXISTS `fnc_CommaSeparated` */;
ALTER DATABASE `tmsv1_lane` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_CommaSeparated`(inputString VARCHAR(8000)) RETURNS varchar(8000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
    READS SQL DATA
BEGIN
    DECLARE pos INT;
    DECLARE value VARCHAR(1000);
    DECLARE result VARCHAR(8000) DEFAULT '';

    CREATE TEMPORARY TABLE TempList (
        DataValue VARCHAR(1000)
    );

    WHILE LENGTH(inputString) > 0 DO
        SET pos = IFNULL(LOCATE(',', inputString), 0);

        IF pos = 0 THEN
            SET value = inputString;
            SET inputString = '';
        ELSE
            SET value = SUBSTRING(inputString, 1, pos - 1);
            SET inputString = SUBSTRING(inputString, pos + 1);
        END IF;

        INSERT INTO TempList (DataValue) VALUES (value);
    END WHILE;

    -- Concatenate the values into a single string
    SELECT GROUP_CONCAT(DataValue) INTO result FROM TempList;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS TempList;

    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `tmsv1_lane` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_AvcTransactionInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_AvcTransactionInsert`(
IN p_LaneId smallint,
IN p_TransactionCount bigint,
IN p_AvcClassId smallint,
IN p_AxleCount smallint,
IN p_IsReverseDirection bit,
IN p_WheelBase bigint,
IN p_TransactionDateTime DATETIME(6)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	INSERT INTO tbl_AvcTransaction(LaneId,TransactionCount,AvcClassId,AxleCount,IsReverseDirection,WheelBase,TransactionDateTime)
	VALUES(p_LaneId,p_TransactionCount,p_AvcClassId,p_AxleCount,p_IsReverseDirection,p_WheelBase,p_TransactionDateTime);
	SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_AvcTransactionMarkedTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_AvcTransactionMarkedTransfer`(
IN p_Id bigint,
IN p_IsDataTransfer bit
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
    UPDATE tbl_AvcTransaction SET IsDataTransfer=p_IsDataTransfer
    WHERE Id=p_Id;
	
	SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_AvcTransactionPending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_AvcTransactionPending`()
BEGIN
	SELECT * FROM tbl_AvcTransaction 
    WHERE IsDataTransfer=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_DataStatusInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_DataStatusInsertUpdate`(
IN p_DataStatusId smallint,
IN p_DataStatusName varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT DataStatusId FROM tbl_DataStatusMaster WHERE DataStatusId = p_DataStatusId) THEN
      INSERT INTO tbl_DataStatusMaster (DataStatusId, DataStatusName, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_DataStatusId, p_DataStatusName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Data status added successfully;';
	ELSE
        UPDATE tbl_DataStatusMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            DataStatusName = p_DataStatusName
            
        WHERE DataStatusId = p_DataStatusId;
        
        SET AlertMessage = 'Data status updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_DenominationMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_DenominationMasterInsertUpdate`(
	IN p_DenominationId smallint,
	IN p_DenominationValue smallint,
    IN p_OrderBy smallint,
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT DenominationId FROM tbl_DenominationMaster WHERE DenominationId = p_DenominationId) THEN
       insert into tbl_DenominationMaster(DenominationId,DenominationValue,OrderBy,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_DenominationId, p_DenominationValue,p_OrderBy,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Denomination added successfully;';
    ELSE
        UPDATE tbl_DenominationMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            DenominationValue = p_DenominationValue,
            OrderBy=p_OrderBy
        WHERE DenominationId = p_DenominationId;
        
        SET AlertMessage = 'Denomination updated successfully;';
    END IF;

    SELECT AlertMessage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_EquipmentDetailsGetByLaneId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_EquipmentDetailsGetByLaneId`(
IN p_LaneId smallint)
BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId  
	WHERE ED.LaneId=p_LaneId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_EquipmentDetailsInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_EquipmentDetailsInsertUpdate`(
IN p_EquipmentId bigint,
IN p_PlazaId smallint,
IN p_LaneId smallint,
IN p_EquipmentTypeId smallint,
IN p_EquipmentName varchar(100),
IN p_ProtocolTypeId smallint,
IN p_IpAddress varchar(20),	 
IN p_PortNumber int,
IN p_LoginId varchar(50),	     
IN p_LoginPassword varchar(50),
IN p_ManufacturerId int,
IN p_MacAddress varchar(100),	     
IN p_ModelNumber varchar(100),	     
IN p_SerialNumber varchar(100),
IN p_ManufacturerDate date,
IN p_PurchageDate date,
IN p_WarrantyExpireDate date, 
IN p_UrlAddress varchar(255),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT EquipmentId FROM tbl_EquipmentDetails WHERE EquipmentId = p_EquipmentId) THEN
       insert into tbl_EquipmentDetails(EquipmentId,LaneId,PlazaId,EquipmentTypeId,ProtocolTypeId,EquipmentName,IpAddress,PortNumber,
				LoginId,LoginPassword,ManufacturerId,MacAddress,ModelNumber,SerialNumber,ManufacturerDate,PurchageDate,WarrantyExpireDate,
				UrlAddress,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
				values(p_EquipmentId,p_LaneId,p_PlazaId,p_EquipmentTypeId,p_ProtocolTypeId,p_EquipmentName,p_IpAddress,p_PortNumber,
				p_LoginId,p_LoginPassword,p_ManufacturerId,p_MacAddress,p_ModelNumber,p_SerialNumber,p_ManufacturerDate,p_PurchageDate,p_WarrantyExpireDate,
				p_UrlAddress,p_DataStatus,p_CreatedDate,p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Equipment added successfully;';
    ELSE
        UPDATE tbl_EquipmentDetails
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            PlazaId=p_PlazaId,
			LaneId=p_LaneId,
			EquipmentTypeId=p_EquipmentTypeId,
			EquipmentName=p_EquipmentName,
			ProtocolTypeId=p_ProtocolTypeId,
			IpAddress=p_IpAddress,
			PortNumber=p_PortNumber,
			LoginId=p_LoginId,
			LoginPassword=p_LoginPassword,
			ManufacturerId=p_ManufacturerId,
			MacAddress=p_MacAddress,
			ModelNumber=p_ModelNumber,
			SerialNumber=p_SerialNumber,
			ManufacturerDate=p_ManufacturerDate,
			PurchageDate=p_PurchageDate,
			WarrantyExpireDate=p_WarrantyExpireDate,
            UrlAddress=p_UrlAddress
        WHERE EquipmentId = p_EquipmentId;
        
        SET AlertMessage = 'Equipment updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_EquipmentTypeMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_EquipmentTypeMasterInsertUpdate`(
	IN p_EquipmentTypeId smallint,
    IN p_EquipmentTypeName varchar(100),
	IN p_EquipmentIconName varchar(100),
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT EquipmentTypeId FROM tbl_EquipmentTypeMaster WHERE EquipmentTypeId = p_EquipmentTypeId) THEN
        insert into tbl_EquipmentTypeMaster(EquipmentTypeId,EquipmentTypeName,EquipmentIconName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		VALUES (p_EquipmentTypeId, p_EquipmentTypeName,p_EquipmentIconName,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Equipment type added successfully;';
    ELSE
        UPDATE tbl_EquipmentTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
           EquipmentTypeName=p_EquipmentTypeName,
           EquipmentIconName=p_EquipmentIconName
        WHERE EquipmentTypeId = p_EquipmentTypeId;
        
        SET AlertMessage = 'Equipment type updated successfully;';
    END IF;

    SELECT AlertMessage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_ExemptTypeGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ExemptTypeGetAll`()
BEGIN
	SELECT * FROM tbl_ExemptTypeMaster
    WHERE DataStatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_ExemptTypeMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ExemptTypeMasterInsertUpdate`(
IN p_ExemptTypeId smallint,
IN p_ExemptTypeName varchar(100),
IN p_DataStatus smallint(6),
IN p_CreatedDate datetime,
IN p_CreatedBy bigint(20),
IN p_ModifiedDate datetime,
IN p_ModifiedBy bigint(20)
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT ExemptTypeId FROM tbl_ExemptTypeMaster WHERE ExemptTypeId = p_ExemptTypeId) THEN
        INSERT INTO tbl_ExemptTypeMaster (ExemptTypeId, ExemptTypeName,  DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_ExemptTypeId, p_ExemptTypeName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Exempt type added successfully;';
    ELSE
        UPDATE tbl_ExemptTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            ExemptTypeName = p_ExemptTypeName
        WHERE ExemptTypeId = p_ExemptTypeId;
        
        SET AlertMessage = 'Exempt type updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_FasTagVehicleClassInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_FasTagVehicleClassInsertUpdate`(
	IN p_FasTagVehicleClassId smallint,
	IN p_FasTagVehicleClassName varchar(100),
	IN p_FasTagVehicleClassDescription varchar(100),
	IN p_PermissibleWeight decimal(18,3),
    IN p_AxcelCount smallint,
    IN p_VehicleHeight decimal(16,3),
	IN p_VehicleLength decimal(16,3),
	IN p_FasTagVehicleClassColor varchar(50),
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT FasTagVehicleClassId FROM tbl_FasTagVehicleClass WHERE FasTagVehicleClassId = p_FasTagVehicleClassId) THEN
       insert into tbl_FasTagVehicleClass(FasTagVehicleClassId,FasTagVehicleClassName,FasTagVehicleClassDescription,
       PermissibleWeight,AxcelCount,VehicleHeight,VehicleLength,FasTagVehicleClassColor,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_FasTagVehicleClassId, p_FasTagVehicleClassName, p_FasTagVehicleClassDescription, 
        p_PermissibleWeight,p_AxcelCount,p_VehicleHeight,p_VehicleLength,p_FasTagVehicleClassColor,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'FasTag vehicle class added successfully;';
    ELSE
        UPDATE tbl_FasTagVehicleClass
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            FasTagVehicleClassName = p_FasTagVehicleClassName,
            FasTagVehicleClassDescription = p_FasTagVehicleClassDescription,
            PermissibleWeight = p_PermissibleWeight,
            AxcelCount = p_AxcelCount,
            VehicleHeight = p_VehicleHeight,
            VehicleLength = p_VehicleLength,
            FasTagVehicleClassColor = p_FasTagVehicleClassColor
        WHERE FasTagVehicleClassId = p_FasTagVehicleClassId;
        
        SET AlertMessage = 'FasTag vehicle class updated successfully;';
    END IF;

    SELECT AlertMessage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneDirectionInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneDirectionInsertUpdate`(
IN p_LaneDirectionId smallint,
IN p_LaneDirectionName varchar(50),
IN p_LaneDirectionCode varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT LaneDirectionId FROM tbl_LaneDirectionMaster WHERE LaneDirectionId = p_LaneDirectionId) THEN
      INSERT INTO tbl_LaneDirectionMaster (LaneDirectionId, LaneDirectionName,LaneDirectionCode, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LaneDirectionId, p_LaneDirectionName,p_LaneDirectionCode, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane direction added successfully;';
	ELSE
        UPDATE tbl_LaneDirectionMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            LaneDirectionName = p_LaneDirectionName,
            LaneDirectionCode=p_LaneDirectionCode
        WHERE LaneDirectionId = p_LaneDirectionId;
        SET AlertMessage = 'Lane direction updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneGetbyIpAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneGetbyIpAddress`(IN inLaneSystemIpAddress VARCHAR(50))
BEGIN
    SELECT L.LaneId,L.PlazaId,P.SystemIntegratorId,S.Name as SystemIntegratorName,P.PlazaName,P.PlazaTypeId,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,L.LaneName,L.LaneNumber,L.LaneTypeId,L.LanePositionId,L.LanePointId,
	L.LaneDirectionId,L.LaneStatusId,L.LaneModeId,L.LaneSystemIpAddress,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,
	L.ModifiedBy,DS.DataStatusName,LD.LaneDirectionName,LT.LaneTypeName,LPP.LanePositionName,LP.LanePointName,LS.LaneStatusName,
	LM.LaneModeName
	FROM tbl_LaneConfiguration L 
	LEFT JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	LEFT JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	LEFT JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	LEFT JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	LEFT JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	LEFT JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	LEFT JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	LEFT JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	LEFT JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
    WHERE 
        L.LaneSystemIpAddress = inLaneSystemIpAddress;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneInsertUpdate`(
IN p_LaneId bigint,
IN p_PlazaId int,
IN p_LaneNumber smallint,
IN p_LaneName varchar(10),
IN p_LaneTypeId smallint,
IN p_LanePositionId smallint,
IN p_LanePointId smallint,
IN p_LaneDirectionId smallint,
IN p_LaneStatusId smallint,
IN p_LaneModeId smallint,
IN p_LaneSystemIpAddress varchar(20),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT LaneId FROM tbl_LaneConfiguration WHERE LaneId = p_LaneId) THEN
        insert into tbl_LaneConfiguration(LaneId,PlazaId,LaneNumber,LaneName,LaneTypeId,LanePositionId,LanePointId,LaneDirectionId,LaneStatusId,LaneModeId,LaneSystemIpAddress,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LaneId,p_PlazaId,p_LaneNumber,p_LaneName,p_LaneTypeId,p_LanePositionId,p_LanePointId,p_LaneDirectionId,p_LaneStatusId,p_LaneModeId,p_LaneSystemIpAddress, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane added successfully;';
    ELSE
        UPDATE tbl_LaneConfiguration
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            PlazaId=p_PlazaId,
            LaneName=p_LaneName,
            LaneNumber=p_LaneNumber,
            LaneTypeId=p_LaneTypeId,
            LanePositionId=p_LanePositionId,
            LanePointId=p_LanePointId,
            LaneDirectionId=p_LaneDirectionId,
            LaneStatusId=p_LaneStatusId,
            LaneModeId=p_LaneModeId,
            LaneSystemIpAddress=p_LaneSystemIpAddress
        WHERE LaneId = p_LaneId;
        
        SET AlertMessage = 'Lane updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneModeInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneModeInsertUpdate`(
IN p_LaneModeId smallint,
IN p_LaneModeName varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT LaneModeId FROM tbl_LaneModeMaster WHERE LaneModeId = p_LaneModeId) THEN
      INSERT INTO tbl_LaneModeMaster (LaneModeId, LaneModeName, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LaneModeId, p_LaneModeName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane mode added successfully;';
	ELSE
        UPDATE tbl_LaneModeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            LaneModeName = p_LaneModeName
            
        WHERE LaneModeId = p_LaneModeId;
        
        SET AlertMessage = 'Lane mode updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LanePointInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LanePointInsertUpdate`(
IN p_LanePointId smallint,
IN p_LanePointName varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT LanePointId FROM tbl_LanePointMaster WHERE LanePointId = p_LanePointId) THEN
      INSERT INTO tbl_LanePointMaster (LanePointId, LanePointName, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LanePointId, p_LanePointName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane point added successfully;';
	ELSE
        UPDATE tbl_LanePointMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            LanePointName = p_LanePointName
            
        WHERE LanePointId = p_LanePointId;
        
        SET AlertMessage = 'Lane point updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LanePositionInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LanePositionInsertUpdate`(
IN p_LanePositionId smallint,
IN p_LanePositionName varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT LanePositionId FROM tbl_LanePositionMaster WHERE LanePositionId = p_LanePositionId) THEN
      INSERT INTO tbl_LanePositionMaster (LanePositionId, LanePositionName, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LanePositionId, p_LanePositionName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane position added successfully;';
	ELSE
        UPDATE tbl_LanePositionMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            LanePositionName = p_LanePositionName
            
        WHERE LanePositionId = p_LanePositionId;
        
        SET AlertMessage = 'Lane position updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneStatusInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneStatusInsertUpdate`(
IN p_LaneStatusId smallint,
IN p_LaneStatusName varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT LaneStatusId FROM tbl_LaneStatusMaster WHERE LaneStatusId = p_LaneStatusId) THEN
      INSERT INTO tbl_LaneStatusMaster (LaneStatusId, LaneStatusName, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LaneStatusId, p_LaneStatusName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane status added successfully;';
	ELSE
        UPDATE tbl_LaneStatusMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            LaneStatusName = p_LaneStatusName
            
        WHERE LaneStatusId = p_LaneStatusId;
        
        SET AlertMessage = 'Lane status updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionGetLatest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneTransactionGetLatest`()
BEGIN
SELECT L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name as SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,L.LaneModeId,L.LaneDirectionId,L.ShiftId,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,
	L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,L.PlateNumber,L.RCTNumber,L.TagEPC,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,
	L.TagPlateNumber,L.TagReadDateTime,L.TagReadCount,L.IsReadByReader,L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.IsOverWeightCharged,
	L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,L.TransactionFrontImage,L.TransactionBackImage,
	L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,L.IsReturnJourney,L.IsExcessJourney,
	L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount
	FROM tbl_LaneTransaction L
	LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
	LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
	LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
	LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
	LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
ORDER BY L.TransactionDateTime DESC
LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneTransactionInsert`(
IN p_LaneTransactionId BIGINT,
IN p_SystemIntegratorId SMALLINT,
IN p_JourneyId INT,
IN p_PlazaId SMALLINT,
IN p_LaneId SMALLINT,
IN p_LaneStatusId BIT,
IN p_LaneModeId BIT,
IN p_LaneDirectionId BIT,
IN p_ShiftId SMALLINT,
IN p_TransactionTypeId SMALLINT,
IN p_PaymentTypeId SMALLINT,
IN p_ExemptTypeId SMALLINT,
IN p_ExemptSubTypeId SMALLINT,
IN p_VehicleClassId SMALLINT,
IN p_VehicleSubClassId SMALLINT,
IN p_VehicleAvcClassId SMALLINT,
IN p_PlateNumber VARCHAR(20),
IN p_RCTNumber VARCHAR(32),
IN p_TagEPC VARCHAR(32),
IN p_TagClassId SMALLINT,
IN p_TagPlateNumber VARCHAR(20),
IN p_TagReadDateTime DATETIME(6),
IN p_TagReadCount INT,
IN p_IsReadByReader BIT,
IN p_PermissibleVehicleWeight DECIMAL(18,3),
IN p_ActualVehicleWeight DECIMAL(18,3),
IN p_IsOverWeightCharged BIT,
IN p_OverWeightAmount DECIMAL(18,2),
IN p_TagPenaltyAmount DECIMAL(18,2),
IN p_TransactionAmount DECIMAL(18,2),
IN p_TransactionDateTime DATETIME(6),
IN p_TransactionFrontImage VARCHAR(255),
IN p_TransactionBackImage VARCHAR(255),
IN p_TransactionAvcImage VARCHAR(255),
IN p_TransactionVideo VARCHAR(255),
IN p_ExemptionProofImage VARCHAR(255),
IN p_DestinationPlazaId SMALLINT,
IN p_UserId BIGINT,
IN p_LoginId VARCHAR(20),
IN p_IsReturnJourney BIT,
IN p_IsExcessJourney BIT,
IN p_IsBarrierAutoClose BIT,
IN p_IsTowVehicle BIT,
IN p_IsFleetTranscation BIT,
IN p_FleetCount SMALLINT
)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
INSERT INTO tbl_LaneTransaction (
        LaneTransactionId,
        SystemIntegratorId,
        JourneyId,
        PlazaId,
        LaneId,
        LaneStatusId,
        LaneModeId,
        LaneDirectionId,
        ShiftId,
        TransactionTypeId,
        PaymentTypeId,
        ExemptTypeId,
        ExemptSubTypeId,
        VehicleClassId,
        VehicleSubClassId,
        VehicleAvcClassId,
        PlateNumber,
        RCTNumber,
        TagEPC,
        TagClassId,
        TagPlateNumber,
        TagReadDateTime,
        TagReadCount,
        IsReadByReader,
        PermissibleVehicleWeight,
        ActualVehicleWeight,
        IsOverWeightCharged,
        OverWeightAmount,
        TagPenaltyAmount,
        TransactionAmount,
        TransactionDateTime,
        TransactionFrontImage,
        TransactionBackImage,
        TransactionAvcImage,
        TransactionVideo,
        ExemptionProofImage,
        DestinationPlazaId,
        UserId,
        LoginId,
        IsReturnJourney,
        IsExcessJourney,
        IsBarrierAutoClose,
        IsTowVehicle,
        IsFleetTranscation,
        FleetCount,
        CreatedDate
    )VALUES (
        p_LaneTransactionId,
        p_SystemIntegratorId,
        p_JourneyId,
        p_PlazaId,
        p_LaneId,
        p_LaneStatusId,
        p_LaneModeId,
        p_LaneDirectionId,
        p_ShiftId,
        p_TransactionTypeId,
        p_PaymentTypeId,
        p_ExemptTypeId,
        p_ExemptSubTypeId,
        p_VehicleClassId,
        p_VehicleSubClassId,
        p_VehicleAvcClassId,
        p_PlateNumber,
        p_RCTNumber,
        p_TagEPC,
        p_TagClassId,
        p_TagPlateNumber,
        p_TagReadDateTime,
        p_TagReadCount,
        p_IsReadByReader,
        p_PermissibleVehicleWeight,
        p_ActualVehicleWeight,
        p_IsOverWeightCharged,
        p_OverWeightAmount,
        p_TagPenaltyAmount,
        p_TransactionAmount,
        p_TransactionDateTime,
        p_TransactionFrontImage,
        p_TransactionBackImage,
        p_TransactionAvcImage,
        p_TransactionVideo,
        p_ExemptionProofImage,
        p_DestinationPlazaId,
        p_UserId,
        p_LoginId,
        p_IsReturnJourney,
        p_IsExcessJourney,
        p_IsBarrierAutoClose,
        p_IsTowVehicle,
        p_IsFleetTranscation,
        p_FleetCount,
        CURRENT_TIMESTAMP
    );
      SET AlertMessage = 'successfully';
      SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionMarkedTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneTransactionMarkedTransfer`(
IN p_LaneTransactionId BIGINT
)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
    UPDATE tbl_LaneTransaction SET IsDataTransfer=1
    WHERE LaneTransactionId=p_LaneTransactionId;

      SET AlertMessage = 'successfully';
      SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionPending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneTransactionPending`()
BEGIN
	SELECT * FROM tbl_lanetransaction 
    WHERE IsDataTransfer=0
    ORDER BY CreatedDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTypeInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LaneTypeInsertUpdate`(
IN p_LaneTypeId smallint,
IN p_LaneTypeName varchar(50),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT LaneTypeId FROM tbl_LaneTypeMaster WHERE LaneTypeId = p_LaneTypeId) THEN
      INSERT INTO tbl_LaneTypeMaster (LaneTypeId, LaneTypeName, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_LaneTypeId, p_LaneTypeName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Lane type added successfully;';
	ELSE
        UPDATE tbl_LaneTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            LaneTypeName = p_LaneTypeName
            
        WHERE LaneTypeId = p_LaneTypeId;
        
        SET AlertMessage = 'Lane type updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_ManufacturerInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ManufacturerInsertUpdate`(
IN p_ManufacturerId smallint,
IN p_Name varchar(100),
IN p_Address varchar (100),
IN p_MobileNumber varchar (15),
IN p_EmailId varchar (100),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT ManufacturerId FROM tbl_ManufacturerDetails WHERE ManufacturerId = p_ManufacturerId) THEN
        insert into tbl_ManufacturerDetails(ManufacturerId,Name,Address,MobileNumber,EmailId,DataStatus,CreatedDate,CreatedBy)
        VALUES (p_ManufacturerId,p_Name,p_Address,p_MobileNumber,p_EmailId,p_DataStatus, p_CreatedDate, p_CreatedBy);
        SET AlertMessage = 'Manufacturer added successfully;';
    ELSE
        UPDATE tbl_ManufacturerDetails
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            Name=p_Name,
            Address=p_Address,
            MobileNumber=p_MobileNumber,
            EmailId=p_EmailId
        WHERE ManufacturerId = p_ManufacturerId;
        
        SET AlertMessage = 'Manufacturer updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_PaymentTypeGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_PaymentTypeGetAll`()
BEGIN
	SELECT * FROM tbl_PaymentTypeMaster
    WHERE DataStatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_PaymentTypeMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_PaymentTypeMasterInsertUpdate`(
IN p_PaymentTypeId smallint,
IN p_PaymentTypeName varchar(100),
IN p_TransactionTypeId smallint(6),
IN p_DataStatus smallint(6),
IN p_CreatedDate datetime,
IN p_CreatedBy bigint(20),
IN p_ModifiedDate datetime,
IN p_ModifiedBy bigint(20)
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT PaymentTypeId FROM tbl_PaymentTypeMaster WHERE PaymentTypeId = p_PaymentTypeId) THEN
        INSERT INTO tbl_PaymentTypeMaster (PaymentTypeId, PaymentTypeName, TransactionTypeId, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_PaymentTypeId, p_PaymentTypeName,p_TransactionTypeId, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Payment type added successfully;';
    ELSE
        UPDATE tbl_PaymentTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            PaymentTypeName = p_PaymentTypeName,
            TransactionTypeId = p_TransactionTypeId
        WHERE PaymentTypeId = p_PaymentTypeId;
        
        SET AlertMessage = 'Payment type updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_PlazaGetbyId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_PlazaGetbyId`(
IN p_PlazaId smallint)
BEGIN
	Select P.PlazaId,P.SystemIntegratorId,S.Name AS SystemIntegratorName,P.PlazaName,P.PlazaTypeId,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,
	DS.DataStatusName,ChainageNumber AS ChainageName
	from tbl_PlazaConfiguration P 
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
    WHERE P.PlazaId=p_PlazaId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_PlazaInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_PlazaInsertUpdate`(
IN p_PlazaId int,
IN p_SystemIntegratorId smallint,
IN p_PlazaName varchar(100),
IN p_PlazaTypeId smallint,
IN p_PlazaServerIpAddress varchar(20),
IN p_PlazaZoneId varchar(20),
IN p_ChainageNumber decimal(16,3),  
IN p_Latitude decimal(8,6),
IN p_Longitude	decimal(9,6), 
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT PlazaId FROM tbl_PlazaConfiguration WHERE PlazaId = p_PlazaId) THEN
        insert into tbl_PlazaConfiguration(PlazaId,SystemIntegratorId,PlazaName,PlazaTypeId,PlazaServerIpAddress,ChainageNumber,Latitude,Longitude,PlazaZoneId,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_PlazaId,p_SystemIntegratorId,p_PlazaName,p_PlazaTypeId,p_PlazaServerIpAddress,p_ChainageNumber,p_Latitude,p_Longitude,p_PlazaZoneId, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Plaza added successfully;';
    ELSE
        UPDATE tbl_PlazaConfiguration
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            SystemIntegratorId=p_SystemIntegratorId,
			PlazaName=p_PlazaName,
			PlazaTypeId=p_PlazaTypeId,
			PlazaServerIpAddress=p_PlazaServerIpAddress,
			ChainageNumber=p_ChainageNumber,
			Latitude=p_Latitude,
			Longitude=p_Longitude,
			PlazaZoneId=p_PlazaZoneId
        WHERE PlazaId = p_PlazaId;
        
        SET AlertMessage = 'Plaza updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_ProtocolTypeMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ProtocolTypeMasterInsertUpdate`(
IN p_ProtocolTypeId smallint,
IN p_ProtocolTypeName varchar(100),
IN p_DataStatus smallint(6),
IN p_CreatedDate datetime,
IN p_CreatedBy bigint(20),
IN p_ModifiedDate datetime,
IN p_ModifiedBy bigint(20)
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT ProtocolTypeId FROM tbl_ProtocolTypeMaster WHERE ProtocolTypeId = p_ProtocolTypeId) THEN
        INSERT INTO tbl_ProtocolTypeMaster (ProtocolTypeId, ProtocolTypeName,  DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_ProtocolTypeId, p_ProtocolTypeName, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Protocol type added successfully;';
    ELSE
        UPDATE tbl_ProtocolTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            ProtocolTypeName = p_ProtocolTypeName
        WHERE ProtocolTypeId = p_ProtocolTypeId;
        
        SET AlertMessage = 'Protocol type updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_ShiftTiminingGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ShiftTiminingGetAll`()
BEGIN
SELECT * FROM tbl_ShiftTimining WHERE DataStatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_ShiftTiminingInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ShiftTiminingInsertUpdate`(
IN p_ShiftId smallint,
IN p_StartTimmng varchar(10),
IN p_EndTimming varchar(10),
IN p_DataStatus smallint,
IN p_CreatedDate DateTime,
IN p_CreatedBy bigint,
IN p_ModifiedDate DateTime,
IN p_ModifiedBy bigint
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
     IF NOT EXISTS (SELECT ShiftId FROM tbl_ShiftTimining WHERE ShiftId = p_ShiftId) THEN
      INSERT INTO tbl_ShiftTimining (ShiftId, StartTimmng, EndTimming, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_ShiftId, p_StartTimmng, p_EndTimming, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Shift timing added successfully;';
	ELSE
        UPDATE tbl_ShiftTimining
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            StartTimmng = p_StartTimmng,
            EndTimming = p_EndTimming
            
        WHERE ShiftId = p_ShiftId;
        
        SET AlertMessage = 'Shift timing updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemIntegratorInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemIntegratorInsertUpdate`(
    IN p_SystemIntegratorId SMALLINT,
    IN p_Name VARCHAR(100),
    IN p_Address VARCHAR(100),
    IN p_MobileNumber VARCHAR(15),
    IN p_EmailId VARCHAR(100),
    IN p_LoginId VARCHAR(255),
    IN p_Password VARCHAR(255),
    IN p_DataStatus SMALLINT,
    IN p_CreatedDate DATETIME,
    IN p_CreatedBy BIGINT,
    IN p_ModifiedDate DATETIME,
    IN p_ModifiedBy BIGINT
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = '';

    IF NOT EXISTS (SELECT SystemIntegratorId FROM tbl_SystemIntegratorConfiguration WHERE SystemIntegratorId = p_SystemIntegratorId) THEN
        INSERT INTO tbl_SystemIntegratorConfiguration(SystemIntegratorId, Name, Address, MobileNumber, EmailId, LoginId, Password, DataStatus, CreatedDate, CreatedBy)
        VALUES (p_SystemIntegratorId, p_Name, p_Address, p_MobileNumber, p_EmailId, p_LoginId, p_Password, p_DataStatus, p_CreatedDate, p_CreatedBy);
        SET AlertMessage = 'SI added successfully';
    ELSE
        UPDATE tbl_SystemIntegratorConfiguration
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            Name = p_Name,
            Address = p_Address,
            MobileNumber = p_MobileNumber,
            EmailId = p_EmailId,
            LoginId = p_LoginId,
            Password = p_Password
        WHERE SystemIntegratorId = p_SystemIntegratorId;

        SET AlertMessage = 'SI updated successfully';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemSettingGet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemSettingGet`()
BEGIN
SELECT * FROM tbl_SystemSetting;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemSettingInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemSettingInsertUpdate`(
IN p_DefaultPlazaId smallint,
IN p_AllotmentDays smallint,
IN p_IsAccessControl boolean,
IN p_CashPenalty boolean,
IN p_LoginAccess boolean,
IN p_ExemptAccess boolean,
IN p_FleetAccess boolean,
IN p_SubClassRequired boolean,
IN p_OpeningBalance decimal(18,2),
IN p_DataStatus smallint,
IN p_CreatedDate datetime,
IN p_CreatedBy bigint,
IN p_ModifiedDate datetime,
IN p_ModifiedBy bigint
)
BEGIN
 DECLARE AlertMessage VARCHAR(4000);
 DECLARE rowCount INT;
 SET AlertMessage = ';';
  SELECT COUNT(*) INTO rowCount FROM tbl_SystemSetting;
   IF rowCount = 0 THEN
			INSERT INTO tbl_SystemSetting(DefaultPlazaId,IsAccessControl,AllotmentDays,CashPenalty,LoginAccess,ExemptAccess,FleetAccess,SubClassRequired,OpeningBalance,ClosingBalance,DataStatus,CreatedDate,CreatedBy)
			VALUES(p_DefaultPlazaId,p_IsAccessControl,p_AllotmentDays,p_CashPenalty,p_LoginAccess,p_ExemptAccess,p_FleetAccess,p_SubClassRequired,p_OpeningBalance,0,p_DataStatus,p_CreatedDate,p_CreatedBy);
            SET AlertMessage = 'System setting added successfully;';
     ELSE        
            UPDATE tbl_SystemSetting SET DefaultPlazaId=p_DefaultPlazaId,IsAccessControl=p_IsAccessControl,AllotmentDays=p_AllotmentDays,
				CashPenalty=p_CashPenalty,LoginAccess=p_LoginAccess,ExemptAccess=p_ExemptAccess,FleetAccess=p_FleetAccess,OpeningBalance=p_OpeningBalance,
				DataStatus=p_DataStatus,ModifiedDate=p_ModifiedDate,ModifiedBy=p_ModifiedBy,SubClassRequired=p_SubClassRequired
          LIMIT 1;
          SET AlertMessage = 'System setting updated successfully;';
    END IF;    
            
  SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemVehicleClassGet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemVehicleClassGet`()
BEGIN
	SELECT * FROM tbl_SystemVehicleClass 
    WHERE DataStatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemVehicleClassInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemVehicleClassInsertUpdate`(
	IN p_SystemVehicleClassId smallint,
    IN p_FasTagVehicleClassId smallint,
	IN p_AvcVehicleClassId smallint,
	IN p_SystemVehicleClassName varchar(100),
	IN p_SystemVehicleClassDescription varchar(100),
    IN p_SystemSubClassIds varchar(4000),
	IN p_PermissibleWeight decimal(18,3),
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT SystemVehicleClassId FROM tbl_SystemVehicleClass WHERE SystemVehicleClassId = p_SystemVehicleClassId) THEN
       insert into tbl_SystemVehicleClass(SystemVehicleClassId,FasTagVehicleClassId,AvcVehicleClassId,SystemVehicleClassName,SystemVehicleClassDescription,SystemSubClassIds,PermissibleWeight,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_SystemVehicleClassId,p_FasTagVehicleClassId,p_AvcVehicleClassId, p_SystemVehicleClassName, p_SystemVehicleClassDescription, p_SystemSubClassIds,p_PermissibleWeight,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'System vehicle class added successfully;';
    ELSE
        UPDATE tbl_SystemVehicleClass
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            SystemVehicleClassName = p_SystemVehicleClassName,
            SystemVehicleClassDescription = p_SystemVehicleClassDescription,
            SystemSubClassIds=p_SystemSubClassIds,
            PermissibleWeight = p_PermissibleWeight,
            FasTagVehicleClassId=p_FasTagVehicleClassId,
            AvcVehicleClassId=p_AvcVehicleClassId
        WHERE SystemVehicleClassId = p_SystemVehicleClassId;
        
        SET AlertMessage = 'System vehicle class updated successfully;';
    END IF;

    SELECT AlertMessage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemVehicleSubClassGet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemVehicleSubClassGet`()
BEGIN
	SELECT 
S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.AvcVehicleClassId,
S.FasTagVehicleClassId FasTagSystemVehicleClassId,
S.PermissibleWeight,F.FasTagVehicleClassId AS SystemSubClassId,F.FasTagVehicleClassName AS SystemSubClassNames,
SC.DataStatus,SC.CreatedDate,SC.CreatedBy,SC.ModifiedDate,SC.ModifiedBy
FROM tbl_SystemVehicleSubClass SC 
INNER JOIN tbl_SystemVehicleClass S ON SC.SystemVehicleClassId=S.SystemVehicleClassId
INNER JOIN tbl_FasTagVehicleClass F ON SC.FasTagVehicleClassId=F.FasTagVehicleClassId
WHERE SC.DataStatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_SystemVehicleSubClassInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_SystemVehicleSubClassInsertUpdate`(
	IN p_SystemVehicleClassId smallint,
	IN p_FasTagVehicleClassId smallint,
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT SystemVehicleClassId FROM tbl_SystemVehicleSubClass WHERE FasTagVehicleClassId = p_FasTagVehicleClassId) THEN
       insert into tbl_SystemVehicleSubClass(SystemVehicleClassId,FasTagVehicleClassId,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_SystemVehicleClassId, p_FasTagVehicleClassId,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'System vehicle sub class added successfully;';
    ELSE
        UPDATE tbl_SystemVehicleSubClass
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            SystemVehicleClassId = p_SystemVehicleClassId
        WHERE FasTagVehicleClassId = p_FasTagVehicleClassId;
        
        SET AlertMessage = 'System vehicle sub class updated successfully;';
    END IF;

    SELECT AlertMessage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_TollFareConfigurationInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_TollFareConfigurationInsertUpdate`(
IN p_TollFareId bigint,
IN p_JourneyId bigint,
IN p_SystemVehicleClassId smallint,
IN p_SubVehicleClassId smallint,
IN p_TollFare decimal(18,2),
IN p_ReturnFare decimal(18,2),
IN p_FasTagPenalty decimal(18,2),
IN p_OverweightPenalty decimal(18,2)
)
BEGIN
 DECLARE AlertMessage VARCHAR(4000);
 DECLARE rowCount INT;
 SET AlertMessage = ';';
 INSERT INTO tbl_TollFareConfiguration(TollFareId,JourneyId,SystemVehicleClassId,SubVehicleClassId,TollFare,ReturnFare,FasTagPenalty,OverweightPenalty)
 VALUES(p_TollFareId,p_JourneyId,p_SystemVehicleClassId,p_SubVehicleClassId,p_TollFare,p_ReturnFare,p_FasTagPenalty,p_OverweightPenalty);
 SET AlertMessage = 'Toll fare configuration done successfully;';
      
            
  SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_TollFareGetByEffectedFrom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_TollFareGetByEffectedFrom`(
IN EffectedFrom DATE
)
BEGIN
	
    DECLARE AEffectiveDate DATE;
    DECLARE inTollFareId BIGINT;
    DECLARE IsSubClassRequired BIT;
    DECLARE AccessControl BIT;
    DECLARE IsDefaultPlazaId SMALLINT;
	
	SELECT SubClassRequired, DefaultPlazaId, IsAccessControl 
	FROM tbl_SystemSetting
	LIMIT 1
	INTO IsSubClassRequired, IsDefaultPlazaId, AccessControl;
    
	DROP TEMPORARY TABLE IF exists tempTollFareClass;
    
    CREATE TEMPORARY TABLE tempTollFareClass (
        SystemVehicleClassId SMALLINT,
        SystemVehicleClassName VARCHAR(255),
        SubVehicleClassId SMALLINT DEFAULT 0,
        SubVehicleClassName VARCHAR(255) DEFAULT '',
        TollFareId BIGINT DEFAULT 0,
        TollFare DECIMAL(18,2) DEFAULT 0,
        ReturnFare DECIMAL(18,2) DEFAULT 0,
        FasTagPenalty DECIMAL(18,2) DEFAULT 0,
        OverweightPenalty DECIMAL(18,2) DEFAULT 0,
        JourneyId BIGINT DEFAULT 0,
        JourneyName VARCHAR(255) DEFAULT 'Not Required'
    );
	SET SQL_SAFE_UPDATES = 0;
    SET IsSubClassRequired = IFNULL(IsSubClassRequired, 0);
	
    
    SELECT MAX(EffectedFrom)
    INTO AEffectiveDate
    FROM tbl_TollFareMaster
    WHERE EffectedFrom <= EffectedFrom AND DataStatus = 1;

    IF (AEffectiveDate IS NULL) THEN
        SELECT MIN(EffectedFrom)
        INTO AEffectiveDate
        FROM tbl_TollFareMaster
        WHERE EffectedFrom > EffectedFrom AND DataStatus = 1;
    END IF;

    IF (IsSubClassRequired = 1) THEN
        INSERT INTO tempTollFareClass (SystemVehicleClassId, SystemVehicleClassName, SubVehicleClassId, SubVehicleClassName)
        SELECT S.SystemVehicleClassId, S.SystemVehicleClassName, F.FasTagVehicleClassId, F.FasTagVehicleClassName
		FROM tbl_SystemVehicleSubClass SC
		INNER JOIN tbl_FasTagVehicleClass F ON SC.FasTagVehicleClassId = F.FasTagVehicleClassId
		INNER JOIN tbl_SystemVehicleClass S ON SC.SystemVehicleClassId = S.SystemVehicleClassId
		INNER JOIN tbl_DataStatusMaster DS ON SC.DataStatus = DS.DataStatusId
		WHERE SC.DataStatus = 1 AND F.DataStatus = 1;
    ELSE
        INSERT INTO tempTollFareClass (SystemVehicleClassId, SystemVehicleClassName, SubVehicleClassId, SubVehicleClassName)
        SELECT S.SystemVehicleClassId, S.SystemVehicleClassName, 0, 'Not Required'
        FROM tbl_SystemVehicleClass S
        INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus = DS.DataStatusId
        WHERE S.DataStatus = 1;
    END IF;

    SELECT TollFareId INTO inTollFareId  FROM tbl_TollFareMaster WHERE EffectedFrom = AEffectiveDate;

    SET inTollFareId  = IFNULL(inTollFareId , 0);
	
    UPDATE tempTollFareClass T
    INNER JOIN (
        SELECT FC.TollFareId, FC.JourneyId, FC.SystemVehicleClassId, FC.SubVehicleClassId, FC.TollFare, FC.ReturnFare, FC.FasTagPenalty, FC.OverweightPenalty, JM.JourneyName
        FROM tbl_TollFareConfiguration FC
        LEFT JOIN tbl_JourneyMaster JM ON FC.JourneyId = JM.JourneyId
        WHERE FC.TollFareId = inTollFareId 
    ) V ON T.SystemVehicleClassId = V.SystemVehicleClassId AND T.SubVehicleClassId = V.SubVehicleClassId
    SET T.TollFareId = V.TollFareId, T.JourneyId = V.JourneyId, T.TollFare = V.TollFare, T.ReturnFare = V.ReturnFare, T.FasTagPenalty = V.FasTagPenalty,
        T.OverweightPenalty = V.OverweightPenalty;

    IF (AccessControl = 0) THEN
        UPDATE tempTollFareClass SET JourneyName = (SELECT PlazaName FROM tbl_PlazaConfiguration WHERE PlazaId = IsDefaultPlazaId);
    END IF;
	
    SELECT * FROM tempTollFareClass;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_TollFareMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_TollFareMasterInsertUpdate`(
    IN p_TollFareId SMALLINT,
    IN p_EffectedFrom DATE,
    IN p_DataStatus SMALLINT,
    IN p_CreatedDate DATETIME,
    IN p_CreatedBy BIGINT,
    IN p_ModifiedDate DATETIME,
    IN p_ModifiedBy BIGINT
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT TollFareId FROM tbl_TollFareMaster WHERE TollFareId = p_TollFareId) THEN
        INSERT INTO tbl_TollFareMaster (TollFareId, EffectedFrom, DataStatus, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
        VALUES (p_TollFareId, p_EffectedFrom, p_DataStatus, p_CreatedDate, p_CreatedBy, p_ModifiedDate, p_ModifiedBy);
        SET AlertMessage = 'Toll fare added successfully;';
    ELSE
        IF p_EffectedFrom > CURRENT_DATE() THEN
            UPDATE tbl_TollFareMaster
            SET
                DataStatus = p_DataStatus,
                ModifiedDate = p_ModifiedDate,
                ModifiedBy = p_ModifiedBy,
                EffectedFrom = p_EffectedFrom
            WHERE TollFareId = p_TollFareId;

            DELETE FROM tbl_TollFareConfiguration WHERE TollFareId = p_TollFareId;
            SET AlertMessage = 'Toll fare updated successfully;';
        ELSE
            SET AlertMessage = 'Cannot update toll fare. EffectedFrom must be greater than the current date;';
        END IF;
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_TransactionTypeGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_TransactionTypeGetAll`()
BEGIN
	SELECT * FROM tbl_TransactionTypeMaster
    WHERE DataStatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_TransactionTypeMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_TransactionTypeMasterInsertUpdate`(
IN p_TransactionTypeId smallint,
IN p_TransactionTypeName varchar(100),
IN p_ReviewRequired boolean,
IN p_DataStatus smallint(6),
IN p_CreatedDate datetime,
IN p_CreatedBy bigint(20),
IN p_ModifiedDate datetime,
IN p_ModifiedBy bigint(20)
)
BEGIN
	 DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT TransactionTypeId FROM tbl_TransactionTypeMaster WHERE TransactionTypeId = p_TransactionTypeId) THEN
        INSERT INTO tbl_TransactionTypeMaster (TransactionTypeId, TransactionTypeName, ReviewRequired, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_TransactionTypeId, p_TransactionTypeName,p_ReviewRequired, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Transaction type added successfully;';
    ELSE
        UPDATE tbl_TransactionTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            TransactionTypeName = p_TransactionTypeName,
            ReviewRequired = p_ReviewRequired
        WHERE TransactionTypeId = p_TransactionTypeId;
        
        SET AlertMessage = 'Transaction type updated successfully;';
    END IF;

    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_UserMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_UserMasterInsertUpdate`(
    IN p_UserId bigint,
    IN p_LoginId varchar(40),
    IN p_LoginPassword varchar(200),
    IN p_FirstName varchar(40),
    IN p_LastName varchar(40),
    IN p_EmailId varchar(50),
    IN p_MobileNumber varchar(30),
    IN p_AccountExpiredDate Date,
    IN p_PlazaId smallint,
    IN p_UserTypeId smallint,
    IN p_RoleId int,
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT LoginId FROM tbl_UserMaster WHERE UserId = p_UserId) THEN
        INSERT INTO tbl_UserMaster (UserId, LoginId, PlazaId, LoginPassword, FirstName, LastName, EmailId, MobileNumber, AccountExpiredDate, RoleId, UserTypeId, DataStatus, CreatedDate, CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_UserId, p_LoginId, p_PlazaId, p_LoginPassword, p_FirstName, p_LastName, p_EmailId, p_MobileNumber, p_AccountExpiredDate, p_RoleId, p_UserTypeId, p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'User added successfully;';
    ELSE
        UPDATE tbl_UserMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            PlazaId = p_PlazaId,
            UserTypeId = p_UserTypeId,
            FirstName = p_FirstName,
            LastName = p_LastName,
            EmailId = p_EmailId,
            MobileNumber = p_MobileNumber,
            AccountExpiredDate = p_AccountExpiredDate,
            RoleId = p_RoleId,
            LoginPassword = p_LoginPassword,
            LoginId = p_LoginId
        WHERE UserId = p_UserId;
        
        SET AlertMessage = 'User updated successfully;';
    END IF;

    SELECT AlertMessage;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_UsersGetByLoginId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_UsersGetByLoginId`(
IN p_LoginId varchar (40)
)
BEGIN
	SELECT *
	FROM tbl_UserMaster 
	WHERE LoginId=p_LoginId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_WimTransactionAxleDetailsInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_WimTransactionAxleDetailsInsert`(
IN p_LaneId smallint,
IN p_TransactionId bigint,
IN p_AxleNumber smallint,
IN p_AxleWeight decimal(18,3),
IN p_Speed decimal(18,2),
IN p_AxleDistance decimal(18,2)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	INSERT INTO tbl_WimTransactionAxleDetails(LaneId,TransactionId,AxleNumber,AxleWeight,Speed,AxleDistance)
	VALUES(p_LaneId,p_TransactionId,p_AxleNumber,p_AxleWeight,p_Speed,p_AxleDistance);
	SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_WimTransactionAxleDetailsMarkedTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_WimTransactionAxleDetailsMarkedTransfer`(
IN p_Id bigint,
IN p_IsDataTransfer bit
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	UPDATE tbl_WimTransactionAxleDetails SET IsDataTransfer=p_IsDataTransfer
    WHERE Id=p_Id;
	SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_WimTransactionAxleDetailsPending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_WimTransactionAxleDetailsPending`()
BEGIN
	SELECT * FROM tbl_WimTransactionAxleDetails 
    WHERE IsDataTransfer=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_WimTransactionInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_WimTransactionInsert`(
IN p_LaneId smallint,
IN p_TransactionId bigint,
IN p_TotalWeight decimal(18,3),
IN p_AxleCount smallint,
IN p_TransactionDateTime DATETIME(6)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	INSERT INTO tbl_WimTransaction(LaneId,TransactionId,TotalWeight,AxleCount,TransactionDateTime)
	VALUES(p_LaneId,p_TransactionId,p_TotalWeight,p_AxleCount,p_TransactionDateTime);
	SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_WimTransactionMarkedTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_WimTransactionMarkedTransfer`(
IN p_LaneId smallint,
IN p_TransactionId bigint,
IN p_IsDataTransfer bit
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
    UPDATE tbl_WimTransaction SET IsDataTransfer=p_IsDataTransfer
    WHERE TransactionId=p_TransactionId AND LaneId=p_LaneId;
    SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_WimTransactionPending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_WimTransactionPending`()
BEGIN
	SELECT * FROM tbl_WimTransaction 
    WHERE IsDataTransfer=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-29 18:34:10
