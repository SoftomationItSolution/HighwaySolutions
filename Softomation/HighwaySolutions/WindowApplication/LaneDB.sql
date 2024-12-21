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
-- Table structure for table `tbl_AvcTransaction`
--

DROP TABLE IF EXISTS `tbl_AvcTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_AvcTransaction` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `LaneId` smallint(6) DEFAULT NULL,
  `TransactionCount` bigint(20) DEFAULT NULL,
  `AvcSensorClassId` smallint(6) DEFAULT NULL,
  `AvcClassId` smallint(6) DEFAULT NULL,
  `AxleCount` smallint(6) DEFAULT NULL,
  `IsReverseDirection` bit(1) DEFAULT b'0',
  `WheelBase` bigint(20) DEFAULT NULL,
  `ImageName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionDateTime` datetime(6) DEFAULT NULL,
  `LaneTransactionId` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  `IsMediaTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_DataStatusMaster`
--

DROP TABLE IF EXISTS `tbl_DataStatusMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DataStatusMaster` (
  `DataStatusId` smallint(6) NOT NULL,
  `DataStatusName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`DataStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_DenominationMaster`
--

DROP TABLE IF EXISTS `tbl_DenominationMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DenominationMaster` (
  `DenominationId` smallint(6) NOT NULL,
  `DenominationValue` smallint(6) DEFAULT '0',
  `OrderBy` smallint(6) DEFAULT '0',
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`DenominationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_EquipmentDetails`
--

DROP TABLE IF EXISTS `tbl_EquipmentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_EquipmentDetails` (
  `EquipmentId` bigint(20) NOT NULL,
  `PlazaId` int(11) NOT NULL,
  `LaneId` int(11) NOT NULL,
  `EquipmentTypeId` int(11) DEFAULT NULL,
  `EquipmentName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProtocolTypeId` int(11) DEFAULT NULL,
  `IpAddress` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PortNumber` int(11) DEFAULT NULL,
  `LoginId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginPassword` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufacturerId` int(11) DEFAULT NULL,
  `MacAddress` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModelNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SerialNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufacturerDate` date DEFAULT NULL,
  `PurchageDate` date DEFAULT NULL,
  `WarrantyExpireDate` date DEFAULT NULL,
  `UrlAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnLineStatus` tinyint(4) DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_EquipmentTypeMaster`
--

DROP TABLE IF EXISTS `tbl_EquipmentTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_EquipmentTypeMaster` (
  `EquipmentTypeId` smallint(6) NOT NULL,
  `EquipmentTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EquipmentIconName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EquipmentIcon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`EquipmentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ExemptTypeMaster`
--

DROP TABLE IF EXISTS `tbl_ExemptTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ExemptTypeMaster` (
  `ExemptTypeId` smallint(6) NOT NULL,
  `ExemptTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ExemptTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_FastagVehicleClass`
--

DROP TABLE IF EXISTS `tbl_FastagVehicleClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_FastagVehicleClass` (
  `FasTagVehicleClassId` bigint(20) NOT NULL,
  `FasTagVehicleClassName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FasTagVehicleClassDescription` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermissibleWeight` decimal(18,3) DEFAULT NULL,
  `AxcelCount` smallint(6) DEFAULT '0',
  `VehicleHeight` decimal(16,3) DEFAULT '0.000',
  `VehicleLength` decimal(16,3) DEFAULT '0.000',
  `FasTagVehicleClassColor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`FasTagVehicleClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_JourneyMaster`
--

DROP TABLE IF EXISTS `tbl_JourneyMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_JourneyMaster` (
  `JourneyId` bigint(20) DEFAULT NULL,
  `JourneyName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SourcePlazaId` bigint(20) DEFAULT NULL,
  `DestinationPlazaId` bigint(20) DEFAULT NULL,
  `JourneyDirectionId` int(11) DEFAULT NULL,
  `JourneyDistance` decimal(10,3) DEFAULT NULL,
  `MaxTravelTime` bigint(20) DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_KeyboardDetails`
--

DROP TABLE IF EXISTS `tbl_KeyboardDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_KeyboardDetails` (
  `EventId` smallint(6) DEFAULT NULL,
  `EventName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EventTypeId` smallint(6) DEFAULT NULL,
  `KeyCode` smallint(6) DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LaneConfiguration`
--

DROP TABLE IF EXISTS `tbl_LaneConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneConfiguration` (
  `LaneId` int(11) NOT NULL AUTO_INCREMENT,
  `PlazaId` int(11) DEFAULT NULL,
  `LaneNumber` int(11) DEFAULT NULL,
  `LaneName` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LaneTypeId` int(11) DEFAULT NULL,
  `LanePositionId` int(11) DEFAULT NULL,
  `LanePointId` int(11) DEFAULT NULL,
  `LaneDirectionId` int(11) DEFAULT NULL,
  `LaneStatusId` int(11) DEFAULT NULL,
  `LaneModeId` int(11) DEFAULT NULL,
  `LaneSystemIpAddress` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`LaneId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LaneDirectionMaster`
--

DROP TABLE IF EXISTS `tbl_LaneDirectionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneDirectionMaster` (
  `LaneDirectionId` smallint(6) NOT NULL,
  `LaneDirectionName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LaneDirectionCode` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LaneDirectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LaneModeMaster`
--

DROP TABLE IF EXISTS `tbl_LaneModeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneModeMaster` (
  `LaneModeId` smallint(6) NOT NULL,
  `LaneModeName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LaneModeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LanePointMaster`
--

DROP TABLE IF EXISTS `tbl_LanePointMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LanePointMaster` (
  `LanePointId` smallint(6) NOT NULL,
  `LanePointName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LanePointId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LanePositionMaster`
--

DROP TABLE IF EXISTS `tbl_LanePositionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LanePositionMaster` (
  `LanePositionId` smallint(6) NOT NULL,
  `LanePositionName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LanePositionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LaneStatusMaster`
--

DROP TABLE IF EXISTS `tbl_LaneStatusMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneStatusMaster` (
  `LaneStatusId` smallint(6) NOT NULL,
  `LaneStatusName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LaneStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

--
-- Table structure for table `tbl_LaneTypeMaster`
--

DROP TABLE IF EXISTS `tbl_LaneTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneTypeMaster` (
  `LaneTypeId` smallint(6) NOT NULL,
  `LaneTypeName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LaneTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ManufactureDetails`
--

DROP TABLE IF EXISTS `tbl_ManufactureDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ManufactureDetails` (
  `ManufactureId` int(11) NOT NULL AUTO_INCREMENT,
  `ManufactureName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufactureAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufactureEmailId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ManufactureMobileNumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ManufactureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ManufacturerDetails`
--

DROP TABLE IF EXISTS `tbl_ManufacturerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ManufacturerDetails` (
  `ManufacturerId` smallint(6) NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_PaymentTypeMaster`
--

DROP TABLE IF EXISTS `tbl_PaymentTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PaymentTypeMaster` (
  `PaymentTypeId` smallint(6) NOT NULL,
  `PaymentTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TransactionTypeId` smallint(6) DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`PaymentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

--
-- Table structure for table `tbl_ProtocolTypeMaster`
--

DROP TABLE IF EXISTS `tbl_ProtocolTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ProtocolTypeMaster` (
  `ProtocolTypeId` smallint(6) NOT NULL,
  `ProtocolTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ProtocolTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ShiftStatusLaneDetails`
--

DROP TABLE IF EXISTS `tbl_ShiftStatusLaneDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ShiftStatusLaneDetails` (
  `ShiftStatusId` bigint(20) DEFAULT NULL,
  `LaneId` int(11) DEFAULT NULL,
  `LaneTransactionCount` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ShiftTimining`
--

DROP TABLE IF EXISTS `tbl_ShiftTimining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ShiftTimining` (
  `ShiftId` smallint(6) NOT NULL,
  `StartTimmng` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EndTimming` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ShiftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_SystemIntegratorConfiguration`
--

DROP TABLE IF EXISTS `tbl_SystemIntegratorConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_SystemIntegratorConfiguration` (
  `SystemIntegratorId` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SystemIntegratorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_SystemSetting`
--

DROP TABLE IF EXISTS `tbl_SystemSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_SystemSetting` (
  `DefaultPlazaId` smallint(6) DEFAULT NULL,
  `AllotmentDays` smallint(6) DEFAULT '0',
  `IsAccessControl` bit(1) DEFAULT NULL,
  `LoginAccess` bit(1) DEFAULT b'0',
  `ExemptAccess` bit(1) DEFAULT b'0',
  `FleetAccess` bit(1) DEFAULT b'0',
  `TollFareonSubClass` bit(1) DEFAULT b'0',
  `AutoFasTagProcess` bit(1) DEFAULT b'0',
  `FasTagPenalty` bit(1) DEFAULT b'0',
  `FasTagPenaltyMultiply` smallint(6) DEFAULT '0',
  `CashReturn` bit(1) DEFAULT b'0',
  `CashReturnDiscount` smallint(6) DEFAULT '0',
  `OpeningBalance` decimal(18,2) DEFAULT '0.00',
  `ClosingBalance` decimal(18,2) DEFAULT '0.00',
  `DataStatus` smallint(6) DEFAULT '0',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_SystemVehicleClass`
--

DROP TABLE IF EXISTS `tbl_SystemVehicleClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_SystemVehicleClass` (
  `SystemVehicleClassId` smallint(6) DEFAULT NULL,
  `SystemVehicleClassName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SystemVehicleClassDescription` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AvcVehicleClassId` smallint(6) DEFAULT '0',
  `SystemSubClassIds` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermissibleWeight` decimal(18,3) DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_SystemVehicleSubClass`
--

DROP TABLE IF EXISTS `tbl_SystemVehicleSubClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_SystemVehicleSubClass` (
  `SystemVehicleClassId` smallint(6) DEFAULT NULL,
  `SystemVehicleSubClassId` smallint(6) DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_TollFareConfiguration`
--

DROP TABLE IF EXISTS `tbl_TollFareConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TollFareConfiguration` (
  `TollFareId` bigint(20) DEFAULT NULL,
  `JourneyId` bigint(20) DEFAULT NULL,
  `SystemVehicleClassId` smallint(6) DEFAULT NULL,
  `SubVehicleClassId` smallint(6) DEFAULT NULL,
  `TollFare` decimal(18,2) DEFAULT NULL,
  `ReturnFare` decimal(18,2) DEFAULT NULL,
  `FasTagPenalty` decimal(18,2) DEFAULT NULL,
  `OverweightPenalty` decimal(18,2) DEFAULT NULL,
  `MonthlyPass` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_TollFareMaster`
--

DROP TABLE IF EXISTS `tbl_TollFareMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TollFareMaster` (
  `TollFareId` bigint(20) NOT NULL AUTO_INCREMENT,
  `EffectedFrom` date DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`TollFareId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_TransactionTypeMaster`
--

DROP TABLE IF EXISTS `tbl_TransactionTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TransactionTypeMaster` (
  `TransactionTypeId` smallint(6) NOT NULL,
  `TransactionTypeName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReviewRequired` tinyint(1) DEFAULT '0',
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`TransactionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_UserMaster`
--

DROP TABLE IF EXISTS `tbl_UserMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_UserMaster` (
  `UserId` bigint(20) NOT NULL,
  `PlazaId` int(11) DEFAULT NULL,
  `LoginId` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginPassword` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AccountExpiredDate` date DEFAULT NULL,
  `UserProfileImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserTypeId` smallint(6) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_WimTransaction`
--

DROP TABLE IF EXISTS `tbl_WimTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_WimTransaction` (
  `LaneId` smallint(6) DEFAULT NULL,
  `TransactionId` bigint(20) DEFAULT NULL,
  `TotalWeight` decimal(18,3) DEFAULT NULL,
  `AxleCount` smallint(6) DEFAULT NULL,
  `IsReverseDirection` bit(1) DEFAULT NULL,
  `TransactionDateTime` datetime(6) DEFAULT NULL,
  `IsDataTransfer` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_WimTransactionAxleDetails`
--

DROP TABLE IF EXISTS `tbl_WimTransactionAxleDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_WimTransactionAxleDetails` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `LaneId` smallint(6) DEFAULT NULL,
  `TransactionId` bigint(20) DEFAULT NULL,
  `AxleNumber` smallint(6) DEFAULT NULL,
  `AxleWeight` decimal(18,3) DEFAULT NULL,
  `Speed` decimal(18,2) DEFAULT NULL,
  `AxleDistance` decimal(18,2) DEFAULT NULL,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'tmsv1_lane'
--

--
-- Dumping routines for database 'tmsv1_lane'
--
/*!50003 DROP FUNCTION IF EXISTS `fnc_CommaSeparated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` FUNCTION `fnc_CommaSeparated`(inputString VARCHAR(8000)) RETURNS varchar(8000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_AvcTransactionInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_AvcTransactionInsert`(
IN p_LaneId smallint,
IN p_TransactionCount bigint,
IN p_AvcSensorClassId smallint,
IN p_AvcClassId smallint,
IN p_AxleCount smallint,
IN p_IsReverseDirection bit,
IN p_WheelBase bigint,
IN p_ImageName varchar(255),
IN p_TransactionDateTime DATETIME(6),
IN p_LaneTransactionId varchar(45)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	INSERT INTO tbl_AvcTransaction(LaneId,TransactionCount,AvcSensorClassId,AvcClassId,AxleCount,IsReverseDirection,WheelBase,ImageName,TransactionDateTime,LaneTransactionId)
	VALUES(p_LaneId,p_TransactionCount,p_AvcSensorClassId,p_AvcClassId,p_AxleCount,p_IsReverseDirection,p_WheelBase,p_ImageName,p_TransactionDateTime,p_LaneTransactionId);
	
    IF p_LaneTransactionId != '' THEN
        UPDATE tbl_LaneTransaction
        SET VehicleAvcClassId = p_AvcClassId
        WHERE LaneTransactionId = p_LaneTransactionId;
    END IF;
    
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_AvcTransactionMarkedTransfer`(
IN p_Id bigint,
IN p_IsDataTransfer bit,
IN p_IsMediaTransfer bit
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
    UPDATE tbl_AvcTransaction SET IsDataTransfer=p_IsDataTransfer,
    IsMediaTransfer=p_IsMediaTransfer
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_AvcTransactionPending`()
BEGIN
	SELECT * FROM tbl_AvcTransaction 
    WHERE IsDataTransfer=0 OR IsMediaTransfer=0;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_DataStatusInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_DenominationMasterInsertUpdate`(
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_DioEquipmentDetailsGetByLaneId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_DioEquipmentDetailsGetByLaneId`(
IN p_LaneId smallint)
BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,0 AS OnLineStatus,0 AS ConnectionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId  
	WHERE ED.LaneId=p_LaneId AND ED.DataStatus=1 AND ED.ProtocolTypeId = 7;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_EquipmentDetailsGetByLaneId`(
IN p_LaneId smallint)
BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,0 AS OnLineStatus,0 AS ConnectionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId  
	WHERE ED.LaneId=p_LaneId AND ED.DataStatus=1 AND ED.ProtocolTypeId <> 7;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_EquipmentDetailsInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_EquipmentTypeMasterInsertUpdate`(
	IN p_EquipmentTypeId smallint,
    IN p_EquipmentTypeName varchar(100),
	IN p_EquipmentIconName varchar(100),
    IN p_EquipmentIcon varchar(100),
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
        insert into tbl_EquipmentTypeMaster(EquipmentTypeId,EquipmentTypeName,EquipmentIconName,EquipmentIcon,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		VALUES (p_EquipmentTypeId, p_EquipmentTypeName,p_EquipmentIconName,p_EquipmentIcon,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'Equipment type added successfully;';
    ELSE
        UPDATE tbl_EquipmentTypeMaster
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
           EquipmentTypeName=p_EquipmentTypeName,
           EquipmentIconName=p_EquipmentIconName,
           EquipmentIcon=p_EquipmentIcon
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ExemptTypeGetAll`()
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ExemptTypeMasterInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_FasTagVehicleClassInsertUpdate`(
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

    IF NOT EXISTS (SELECT FasTagVehicleClassId FROM tbl_FastagVehicleClass WHERE FasTagVehicleClassId = p_FasTagVehicleClassId) THEN
       insert into tbl_FastagVehicleClass(FasTagVehicleClassId,FasTagVehicleClassName,FasTagVehicleClassDescription,
       PermissibleWeight,AxcelCount,VehicleHeight,VehicleLength,FasTagVehicleClassColor,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_FasTagVehicleClassId, p_FasTagVehicleClassName, p_FasTagVehicleClassDescription, 
        p_PermissibleWeight,p_AxcelCount,p_VehicleHeight,p_VehicleLength,p_FasTagVehicleClassColor,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'FasTag vehicle class added successfully;';
    ELSE
        UPDATE tbl_FastagVehicleClass
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetDenominationMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_GetDenominationMaster`()
BEGIN
	SELECT DenominationId,DenominationValue, 0 AS DenominationCount 
	FROM tbl_DenominationMaster WHERE DataStatus=1 
	ORDER BY OrderBy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetLaneTransactionCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_GetLaneTransactionCount`(
IN p_ShiftId smallint,
IN p_TransactionDate DATE
)
BEGIN
	SELECT COUNT(1) AS LaneTransactionCount
FROM tbl_LaneTransaction 
WHERE ShiftId = p_ShiftId 
AND DATE(TransactionDateTime) = p_TransactionDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_KeyboardDetailsUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_KeyboardDetailsUpdate`(IN jsonData LONGTEXT)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    DECLARE in_index INT DEFAULT 0;
    DECLARE jsonObject JSON;

    -- Initialize AlertMessage
    SET AlertMessage = '';

    -- Clear existing records (use caution with TRUNCATE)
    TRUNCATE TABLE tbl_KeyboardDetails;

    -- Loop through JSON array
    WHILE JSON_EXTRACT(jsonData, CONCAT('$[', in_index, ']')) IS NOT NULL DO
        SET jsonObject = JSON_EXTRACT(jsonData, CONCAT('$[', in_index, ']'));

        INSERT INTO tbl_KeyboardDetails (EventId, EventName, EventTypeId, KeyCode, DataStatus)
        VALUES (
            JSON_UNQUOTE(JSON_EXTRACT(jsonObject, '$.EventId')),
            JSON_UNQUOTE(JSON_EXTRACT(jsonObject, '$.EventName')),
            JSON_UNQUOTE(JSON_EXTRACT(jsonObject, '$.EventTypeId')),
            JSON_UNQUOTE(JSON_EXTRACT(jsonObject, '$.KeyCode')),
            JSON_UNQUOTE(JSON_EXTRACT(jsonObject, '$.DataStatus'))
        );

        SET in_index = in_index + 1;
    END WHILE;

    -- Set success message
    SET AlertMessage = 'Keyboard details updated successfully.';

    -- Return success message
    SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneDetailsGetByLaneId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneDetailsGetByLaneId`(IN p_LaneId smallint,
IN EffectedFrom DATE)
BEGIN
	DECLARE AEffectiveDate DATE;
    DECLARE inTollFareId BIGINT;
    DECLARE IsTollFareonSubClass BIT;
    DECLARE AccessControl BIT;
    DECLARE IsDefaultPlazaId SMALLINT;


	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,0 AS OnLineStatus,0 AS ConnectionStatus,0 AS PositionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId 
    WHERE ED.LaneId=p_LaneId AND ED.DataStatus=1  AND ED.ProtocolTypeId <> 7;
    
    SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,0 AS OnLineStatus,0 AS ConnectionStatus,0 AS PositionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId 
    WHERE ED.LaneId=p_LaneId AND ED.DataStatus=1  AND ED.ProtocolTypeId = 7;
    
    SELECT * FROM tbl_TransactionTypeMaster
    WHERE DataStatus=1;
    
    SELECT * FROM tbl_PaymentTypeMaster
    WHERE DataStatus=1;
    
    SELECT * FROM tbl_ExemptTypeMaster
    WHERE DataStatus=1;
    
    SELECT * FROM tbl_SystemVehicleClass 
    WHERE DataStatus=1;
    
    SELECT SC.SystemVehicleClassId,SystemVehicleSubClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,
	S.AvcVehicleClassId,S.PermissibleWeight,F.FasTagVehicleClassName AS SystemVehicleSubClassName,
	SC.DataStatus,SC.CreatedDate,SC.CreatedBy,SC.ModifiedDate,SC.ModifiedBy 
	FROM tbl_SystemVehicleSubClass SC
	INNER JOIN tbl_FastagVehicleClass F ON SC.SystemVehicleSubClassId =F.FasTagVehicleClassId
	INNER JOIN tbl_SystemVehicleClass S ON SC.SystemVehicleClassId =S.SystemVehicleClassId
	WHERE SC.DataStatus=1 ORDER BY S.SystemVehicleClassId,SystemVehicleSubClassId;
    
    SELECT * FROM tbl_ShiftTimining WHERE DataStatus=1;
    
	SELECT TollFareonSubClass, DefaultPlazaId, IsAccessControl 
	FROM tbl_SystemSetting
	LIMIT 1
	INTO IsTollFareonSubClass, IsDefaultPlazaId, AccessControl;
    
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
        MonthlyPass DECIMAL(18,2) DEFAULT 0,
        JourneyId BIGINT DEFAULT 0,
        JourneyName VARCHAR(255) DEFAULT 'Not Required'
    );
	SET SQL_SAFE_UPDATES = 0;
    SET IsTollFareonSubClass = IFNULL(IsTollFareonSubClass, 0);
	
    
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

    IF (IsTollFareonSubClass = 1) THEN
        INSERT INTO tempTollFareClass (SystemVehicleClassId, SystemVehicleClassName, SubVehicleClassId, SubVehicleClassName)
        SELECT S.SystemVehicleClassId, S.SystemVehicleClassName, SC.SystemVehicleSubClassId, F.FasTagVehicleClassName
		FROM tbl_SystemVehicleSubClass SC
		INNER JOIN tbl_FastagVehicleClass F ON SC.SystemVehicleSubClassId = F.FasTagVehicleClassId
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

    SELECT TollFareId INTO inTollFareId  FROM tbl_TollFareMaster 
    WHERE EffectedFrom = AEffectiveDate order by EffectedFrom DESC 
    LIMIT 1;

    SET inTollFareId  = IFNULL(inTollFareId , 0);
	
    UPDATE tempTollFareClass T
    INNER JOIN (
        SELECT FC.TollFareId, FC.JourneyId, FC.SystemVehicleClassId, FC.SubVehicleClassId, FC.TollFare, FC.ReturnFare, FC.FasTagPenalty, FC.OverweightPenalty,FC.MonthlyPass ,JM.JourneyName
        FROM tbl_TollFareConfiguration FC
        LEFT JOIN tbl_JourneyMaster JM ON FC.JourneyId = JM.JourneyId
        WHERE FC.TollFareId = inTollFareId 
    ) V ON T.SystemVehicleClassId = V.SystemVehicleClassId AND T.SubVehicleClassId = V.SubVehicleClassId
    SET T.TollFareId = V.TollFareId, T.JourneyId = V.JourneyId, T.TollFare = V.TollFare, T.ReturnFare = V.ReturnFare, T.FasTagPenalty = V.FasTagPenalty,
        T.OverweightPenalty = V.OverweightPenalty, T.MonthlyPass=V.MonthlyPass;

    IF (AccessControl = 0) THEN
        UPDATE tempTollFareClass SET JourneyName = (SELECT PlazaName FROM tbl_PlazaConfiguration WHERE PlazaId = IsDefaultPlazaId);
    END IF;
	
    SELECT * FROM tempTollFareClass;
    
    SELECT * FROM tbl_SystemSetting;
    
    SELECT * FROM tbl_PlazaConfiguration WHERE PlazaId=IsDefaultPlazaId;
    
     SELECT * FROM tbl_LaneConfiguration WHERE LaneId=p_LaneId;
     
	SELECT EventId,EventName,EventTypeId,KeyCode 
	FROM tbl_KeyboardDetails
	WHERE KeyCode NOT IN (8,9,32,40,38) AND KeyCode IS NOT NULL
	 ORDER BY EventTypeId,EventId;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneDirectionInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneGetbyIpAddress`(IN inLaneSystemIpAddress VARCHAR(50))
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneInsertUpdate`(
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneMediaMarkedTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneMediaMarkedTransfer`(
IN p_LaneTransactionId VARCHAR(30)
)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
    UPDATE tbl_LaneTransaction SET IsMediaTransfer=1
    WHERE LaneTransactionId=p_LaneTransactionId;

      SET AlertMessage = 'successfully';
      SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneMediaPending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneMediaPending`()
BEGIN
	SELECT * FROM tbl_LaneTransaction 
    WHERE IsMediaTransfer=0
    ORDER BY CreatedDate DESC;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneModeInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LanePointInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LanePositionInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneStatusInsertUpdate`(
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionAvcUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionAvcUpdate`(
IN p_LaneTransactionId VARCHAR(30),
IN p_VehicleAvcClassId SMALLINT,
IN p_TransactionAvcImage VARCHAR(255)

)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
    update tbl_LaneTransaction SET VehicleAvcClassId=p_VehicleAvcClassId,TransactionAvcImage=p_TransactionAvcImage
    where LaneTransactionId=p_LaneTransactionId;
	SELECT * FROM tbl_LaneTransaction where LaneTransactionId=p_LaneTransactionId;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionGetLatest`()
BEGIN
SELECT L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name as SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,L.LaneModeId,L.LaneDirectionId,L.ShiftId,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,
	L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,L.PlateNumber,L.RCTNumber,L.TagEPC,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,
	L.TagPlateNumber,L.TagReadDateTime,L.TagReadCount,L.TagReadById,L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.IsOverWeightCharged,
	L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,L.TransactionFrontImage,L.TransactionBackImage,
	L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,L.IsReturnJourney,L.IsExcessJourney,
	L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount
	FROM tbl_LaneTransaction L
	LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
	LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
	LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
	LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
	LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
	LEFT JOIN tbl_FastagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FastagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FastagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionInsert`(
IN p_LaneTransactionId VARCHAR(30),
IN p_SystemIntegratorId SMALLINT,
IN p_JourneyId INT,
IN p_PlazaId SMALLINT,
IN p_LaneId SMALLINT,
IN p_LaneStatusId BIT,
IN p_LaneModeId BIT,
IN p_LaneDirectionId SMALLINT,
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
IN p_TagReadById SMALLINT,
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
IN p_FleetCount SMALLINT,
IN p_TCRemark VARCHAR(255)
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
        TagReadById,
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
        TCRemark,
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
        p_TagReadById,
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
        p_TCRemark,
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionMarkedTransfer`(
IN p_LaneTransactionId VARCHAR(30)
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionPending`()
BEGIN
	SELECT * FROM tbl_LaneTransaction 
    WHERE IsDataTransfer=0
    ORDER BY CreatedDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionUpdateAVC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionUpdateAVC`(
IN p_LaneTransactionId VARCHAR(30),	
IN p_VehicleAvcClassId smallint,
IN p_TransactionAvcImage varchar(255)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
	UPDATE tbl_LaneTransaction SET VehicleAvcClassId=p_VehicleAvcClassId,
    TransactionAvcImage=p_TransactionAvcImage,IsDataTransfer=0
    WHERE LaneTransactionId=p_LaneTransactionId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionUpdateIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionUpdateIC`(
IN p_LaneTransactionId VARCHAR(30),
IN p_TransactionBackImage varchar(255),
IN p_TransactionVideo varchar(255)
)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
    UPDATE tbl_LaneTransaction SET TransactionBackImage=p_TransactionBackImage,
    TransactionVideo=p_TransactionVideo,
    IsDataTransfer=0,IsMediaTransfer=0
    WHERE LaneTransactionId=p_LaneTransactionId;

	  SET AlertMessage = 'successfully';
	  SELECT AlertMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionUpdateLpic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTransactionUpdateLpic`(
IN p_LaneTransactionId VARCHAR(30),
IN p_TransactionFrontImage varchar(255)
)
BEGIN
DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';
    UPDATE tbl_LaneTransaction SET TransactionFrontImage=p_TransactionFrontImage,
    IsDataTransfer=0,IsMediaTransfer=0
    WHERE LaneTransactionId=p_LaneTransactionId;

	  SET AlertMessage = 'successfully';
	  SELECT AlertMessage;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneTypeInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ManufacturerInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_PaymentTypeGetAll`()
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_PaymentTypeMasterInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_PlazaGetbyId`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_PlazaInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ProtocolTypeMasterInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ShiftTiminingGetAll`()
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ShiftTiminingInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemIntegratorInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemSettingGet`()
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemSettingInsertUpdate`(
IN p_DefaultPlazaId smallint,
IN p_AllotmentDays smallint,
IN p_IsAccessControl boolean,
IN p_LoginAccess boolean,
IN p_ExemptAccess boolean,
IN p_FleetAccess boolean,
IN p_TollFareonSubClass boolean,
IN p_AutoFasTagProcess boolean,
IN p_FasTagPenalty boolean,
IN p_FasTagPenaltyMultiply smallint,
IN p_CashReturn boolean,
IN p_CashReturnDiscount smallint,
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
			INSERT INTO tbl_SystemSetting(DefaultPlazaId,IsAccessControl,AllotmentDays,LoginAccess,
            ExemptAccess,FleetAccess,TollFareonSubClass,AutoFasTagProcess,
            FasTagPenalty,FasTagPenaltyMultiply,CashReturn,CashReturnDiscount,
            OpeningBalance,ClosingBalance,DataStatus,CreatedDate,CreatedBy)
			VALUES(p_DefaultPlazaId,p_IsAccessControl,p_AllotmentDays,p_LoginAccess,
            p_ExemptAccess,p_FleetAccess,p_TollFareonSubClass,p_AutoFasTagProcess,
            p_FasTagPenalty,p_FasTagPenaltyMultiply,p_CashReturn,p_CashReturnDiscount,
            p_OpeningBalance,0,p_DataStatus,p_CreatedDate,p_CreatedBy);
            SET AlertMessage = 'System setting added successfully;';
            
                      
     ELSE        
            UPDATE tbl_SystemSetting SET DefaultPlazaId=p_DefaultPlazaId,IsAccessControl=p_IsAccessControl,
            AllotmentDays=p_AllotmentDays,LoginAccess=p_LoginAccess,ExemptAccess=p_ExemptAccess,FleetAccess=p_FleetAccess,
            FasTagPenalty=p_FasTagPenalty,FasTagPenaltyMultiply=p_FasTagPenaltyMultiply,
            CashReturn=p_CashReturn,CashReturnDiscount=p_CashReturnDiscount,AutoFasTagProcess=p_AutoFasTagProcess,
            OpeningBalance=p_OpeningBalance,DataStatus=p_DataStatus,ModifiedDate=p_ModifiedDate,ModifiedBy=p_ModifiedBy,TollFareonSubClass=p_TollFareonSubClass
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemVehicleClassGet`()
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemVehicleClassInsertUpdate`(
	IN p_SystemVehicleClassId smallint,
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
       insert into tbl_SystemVehicleClass(SystemVehicleClassId,AvcVehicleClassId,SystemVehicleClassName,SystemVehicleClassDescription,SystemSubClassIds,PermissibleWeight,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_SystemVehicleClassId,p_AvcVehicleClassId, p_SystemVehicleClassName, p_SystemVehicleClassDescription, p_SystemSubClassIds,p_PermissibleWeight,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemVehicleSubClassGet`()
BEGIN
	SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,
        S.AvcVehicleClassId,S.PermissibleWeight,SC.SystemVehicleSubClassId,F.FasTagVehicleClassName AS SystemVehicleSubClassName,
        SC.DataStatus,SC.CreatedDate,SC.CreatedBy,SC.ModifiedDate,SC.ModifiedBy
	FROM  tbl_SystemVehicleSubClass SC 
	INNER JOIN tbl_SystemVehicleClass S ON SC.SystemVehicleClassId=S.SystemVehicleClassId
	INNER JOIN tbl_FastagVehicleClass F ON SC.SystemVehicleSubClassId =F.FasTagVehicleClassId
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemVehicleSubClassInsertUpdate`(
	IN p_SystemVehicleClassId smallint,
	IN p_SystemVehicleSubClassId  smallint,
    IN p_DataStatus smallint,
    IN p_CreatedDate DateTime,
    IN p_CreatedBy bigint,
    IN p_ModifiedDate DateTime,
    IN p_ModifiedBy bigint
)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    SET AlertMessage = ';';

    IF NOT EXISTS (SELECT SystemVehicleClassId FROM tbl_SystemVehicleSubClass WHERE SystemVehicleSubClassId  = p_SystemVehicleSubClassId ) THEN
       insert into tbl_SystemVehicleSubClass(SystemVehicleClassId,SystemVehicleSubClassId ,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
        VALUES (p_SystemVehicleClassId, p_SystemVehicleSubClassId ,p_DataStatus, p_CreatedDate, p_CreatedBy,p_ModifiedDate,p_ModifiedBy);
        SET AlertMessage = 'System vehicle sub class added successfully;';
    ELSE
        UPDATE tbl_SystemVehicleSubClass
        SET
            DataStatus = p_DataStatus,
            ModifiedDate = p_ModifiedDate,
            ModifiedBy = p_ModifiedBy,
            SystemVehicleClassId = p_SystemVehicleClassId
        WHERE SystemVehicleSubClassId  = p_SystemVehicleSubClassId ;
        
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TollFareConfigurationInsertUpdate`(
IN p_TollFareId bigint,
IN p_JourneyId bigint,
IN p_SystemVehicleClassId smallint,
IN p_SubVehicleClassId smallint,
IN p_TollFare decimal(18,2),
IN p_ReturnFare decimal(18,2),
IN p_FasTagPenalty decimal(18,2),
IN p_OverweightPenalty decimal(18,2),
IN p_MonthlyPass decimal(18,2)
)
BEGIN
 DECLARE AlertMessage VARCHAR(4000);
 DECLARE rowCount INT;
 SET AlertMessage = ';';
 INSERT INTO tbl_TollFareConfiguration(TollFareId,JourneyId,SystemVehicleClassId,SubVehicleClassId,TollFare,ReturnFare,FasTagPenalty,OverweightPenalty,MonthlyPass)
 VALUES(p_TollFareId,p_JourneyId,p_SystemVehicleClassId,p_SubVehicleClassId,p_TollFare,p_ReturnFare,p_FasTagPenalty,p_OverweightPenalty,p_MonthlyPass);
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TollFareGetByEffectedFrom`(
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
        SELECT S.SystemVehicleClassId, S.SystemVehicleClassName, SC.SystemVehicleSubClassId, F.FasTagVehicleClassName
		FROM tbl_SystemVehicleSubClass SC
		INNER JOIN tbl_FastagVehicleClass F ON SC.SystemVehicleSubClassId = F.FasTagVehicleClassId
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

    SELECT TollFareId INTO inTollFareId  FROM tbl_TollFareMaster 
    WHERE EffectedFrom = AEffectiveDate order by EffectedFrom DESC 
    LIMIT 1;

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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TollFareMasterInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TransactionTypeGetAll`()
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TransactionTypeMasterInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_UserMasterInsertUpdate`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_UsersGetByLoginId`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_WimTransactionAxleDetailsInsert`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_WimTransactionAxleDetailsMarkedTransfer`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_WimTransactionAxleDetailsPending`()
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_WimTransactionInsert`(
IN p_LaneId smallint,
IN p_TransactionId bigint,
IN p_TotalWeight decimal(18,3),
IN p_AxleCount smallint,
IN p_IsReverseDirection bit,
IN p_TransactionDateTime DATETIME(6)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	INSERT INTO tbl_WimTransaction(LaneId,TransactionId,TotalWeight,AxleCount,IsReverseDirection,TransactionDateTime)
	VALUES(p_LaneId,p_TransactionId,p_TotalWeight,p_AxleCount,p_IsReverseDirection,p_TransactionDateTime);
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_WimTransactionMarkedTransfer`(
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_WimTransactionPending`()
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

-- Dump completed on 2024-12-10 18:44:38
