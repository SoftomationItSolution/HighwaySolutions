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
-- Table structure for table `tbl_LaneTransaction`
--

DROP TABLE IF EXISTS `tbl_LaneTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneTransaction` (
  `MasterTransactionId` bigint(20) DEFAULT '0',
  `PlazaTransactionId` bigint(20) DEFAULT '0',
  `LaneTransactionId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SystemIntegratorId` smallint(6) DEFAULT NULL,
  `JourneyId` int(11) DEFAULT NULL,
  `PlazaId` smallint(6) DEFAULT NULL,
  `LaneId` smallint(6) DEFAULT NULL,
  `LaneStatusId` bit(1) DEFAULT NULL,
  `LaneModeId` bit(1) DEFAULT NULL,
  `LaneDirectionId` smallint(6) DEFAULT NULL,
  `ShiftId` smallint(6) DEFAULT NULL,
  `TransactionTypeId` smallint(6) DEFAULT NULL,
  `PaymentTypeId` smallint(6) DEFAULT '0',
  `ExemptTypeId` smallint(6) DEFAULT '0',
  `ExemptSubTypeId` smallint(6) DEFAULT '0',
  `VehicleClassId` smallint(6) DEFAULT NULL,
  `VehicleSubClassId` smallint(6) DEFAULT NULL,
  `VehicleAvcClassId` smallint(6) DEFAULT NULL,
  `PlateNumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RCTNumber` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TagEPC` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TagClassId` smallint(6) DEFAULT '0',
  `TagPlateNumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `TagReadDateTime` datetime(6) DEFAULT NULL,
  `TagReadCount` int(11) DEFAULT '0',
  `TagReadById` smallint(6) DEFAULT NULL,
  `PermissibleVehicleWeight` decimal(18,3) DEFAULT '0.000',
  `ActualVehicleWeight` decimal(18,3) DEFAULT '0.000',
  `IsOverWeightCharged` bit(1) DEFAULT b'0',
  `OverWeightAmount` decimal(18,2) DEFAULT '0.00',
  `TagPenaltyAmount` decimal(18,2) DEFAULT '0.00',
  `TransactionAmount` decimal(18,2) DEFAULT '0.00',
  `TransactionDateTime` datetime(6) DEFAULT NULL,
  `TransactionFrontImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionBackImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionAvcImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionVideo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExemptionProofImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `DestinationPlazaId` smallint(6) DEFAULT '0',
  `UserId` bigint(20) DEFAULT NULL,
  `LoginId` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `IsReturnJourney` bit(1) DEFAULT b'0',
  `IsExcessJourney` bit(1) DEFAULT b'0',
  `IsBarrierAutoClose` bit(1) DEFAULT b'0',
  `IsTowVehicle` bit(1) DEFAULT b'0',
  `IsFleetTranscation` bit(1) DEFAULT b'0',
  `FleetCount` smallint(6) DEFAULT '0',
  `TransactionStatus` bit(1) DEFAULT b'1',
  `TCRemark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsReviewedRequired` bit(1) DEFAULT b'1',
  `ReviewedStatus` bit(1) DEFAULT b'0',
  `ReviewedPlateNumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ReviewedClassCorrectionId` smallint(6) DEFAULT '0',
  `ReviewedSubClassId` smallint(6) DEFAULT '0',
  `ReviewedTransactionTypeId` smallint(6) DEFAULT '0',
  `ReviewedTransactionAmount` decimal(18,2) DEFAULT '0.00',
  `DifferenceAmount` decimal(18,2) DEFAULT '0.00',
  `ReviewedById` bigint(20) DEFAULT '0',
  `ReviewedDateTime` datetime(6) DEFAULT NULL,
  `ReviewedRemark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ReceivedDateTime` datetime(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ReceivedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  `IsMediaTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`LaneTransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 18:53:54
