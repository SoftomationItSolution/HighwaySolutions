CREATE DATABASE  IF NOT EXISTS `tms_lane_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `tms_lane_v2`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 192.168.11.22    Database: tms_lane_v2
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `DataStatus` int(11) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
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
  `LaneId` int(11) NOT NULL,
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
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`LaneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_LaneTransaction`
--

DROP TABLE IF EXISTS `tbl_LaneTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LaneTransaction` (
  `TxnCounter` bigint(20) NOT NULL AUTO_INCREMENT,
  `LaneTransactionId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JourneyId` int(11) DEFAULT NULL,
  `PlazaId` smallint(6) DEFAULT NULL,
  `LaneId` smallint(6) DEFAULT NULL,
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
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDataTransfer` bit(1) DEFAULT b'0',
  `IsMediaTransfer` bit(1) DEFAULT b'0',
  PRIMARY KEY (`TxnCounter`,`LaneTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `DataStatus` int(11) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
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
  `PlazaId` int(11) NOT NULL,
  `SystemIntegratorId` int(11) DEFAULT NULL,
  `PlazaName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlazaServerIpAddress` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataStatus` int(11) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '1',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '1',
  PRIMARY KEY (`PlazaId`)
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
  `MonthlyPass` decimal(18,2) DEFAULT NULL,
  `DistrictRegisteredFare` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_TollFareMaster`
--

DROP TABLE IF EXISTS `tbl_TollFareMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TollFareMaster` (
  `TollFareId` bigint(20) NOT NULL,
  `EffectedFrom` date DEFAULT NULL,
  `DataStatus` smallint(6) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint(20) DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint(20) DEFAULT '0',
  PRIMARY KEY (`TollFareId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'tms_lane_v2'
--
/*!50003 DROP PROCEDURE IF EXISTS `USP_AvcTransactionInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_DenominationMasterInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_DenominationMasterInsertUpdate`(IN plazaJson JSON)
BEGIN
	 DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE DenominationId INT;
    DECLARE DenominationValue INT;
    DECLARE OrderBy INT;
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_DenominationMaster;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET DenominationId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DenominationId')));
        SET DenominationValue = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DenominationValue')));
        SET OrderBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].OrderBy')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the values into the table
        INSERT INTO tbl_DenominationMaster (DenominationId, DenominationValue, OrderBy, DataStatus, CreatedBy, ModifiedBy)
        VALUES (DenominationId, DenominationValue, OrderBy, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return records with DataStatus = 1
    SELECT * FROM tbl_DenominationMaster WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_EquipmentDetailsInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE EquipmentId VARCHAR(255);
    DECLARE PlazaId VARCHAR(255);
    DECLARE LaneId VARCHAR(255);
    DECLARE EquipmentTypeId VARCHAR(255);
    DECLARE EquipmentName VARCHAR(255);
    DECLARE ProtocolTypeId VARCHAR(255);
    DECLARE IpAddress VARCHAR(255);
    DECLARE PortNumber VARCHAR(255);
    DECLARE LoginId VARCHAR(255);
    DECLARE LoginPassword VARCHAR(255);
    DECLARE ManufacturerId VARCHAR(255);
    DECLARE MacAddress VARCHAR(255);
    DECLARE ModelNumber VARCHAR(255);
    DECLARE SerialNumber VARCHAR(255);
    DECLARE UrlAddress VARCHAR(255);
    DECLARE OnLineStatus VARCHAR(255);
    DECLARE DataStatus VARCHAR(255);
    DECLARE CreatedBy VARCHAR(255);
    DECLARE ModifiedBy VARCHAR(255);

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_EquipmentDetails;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET EquipmentId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentId')));
        SET PlazaId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].PlazaId')));
        SET LaneId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].LaneId')));
        SET EquipmentTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentTypeId')));
        SET EquipmentName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentName')));
        SET ProtocolTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ProtocolTypeId')));
        SET IpAddress = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].IpAddress')));
        SET PortNumber = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].PortNumber')));
        SET LoginId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].LoginId')));
        SET LoginPassword = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].LoginPassword')));
        SET ManufacturerId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ManufacturerId')));
        SET MacAddress = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].MacAddress')));
        SET ModelNumber = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModelNumber')));
        SET SerialNumber = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SerialNumber')));
        SET UrlAddress = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].UrlAddress')));
        SET OnLineStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].OnLineStatus')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the values into the table
        INSERT INTO tbl_EquipmentDetails (EquipmentId, PlazaId, LaneId, EquipmentTypeId, EquipmentName, ProtocolTypeId, IpAddress, PortNumber,
        LoginId, LoginPassword, ManufacturerId, MacAddress, ModelNumber, SerialNumber, UrlAddress, OnLineStatus,
        DataStatus, CreatedBy, ModifiedBy)
        VALUES (EquipmentId, PlazaId, LaneId, EquipmentTypeId, EquipmentName, ProtocolTypeId, IpAddress, PortNumber,
        LoginId, LoginPassword, ManufacturerId, MacAddress, ModelNumber, SerialNumber, UrlAddress, OnLineStatus,
        DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_EquipmentDetails
    SELECT * FROM tbl_EquipmentDetails;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_EquipmentTypeMasterInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE EquipmentTypeId INT;
    DECLARE EquipmentTypeName VARCHAR(100);
    DECLARE EquipmentIconName VARCHAR(100);
    DECLARE EquipmentIcon VARCHAR(100);
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_EquipmentTypeMaster;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET EquipmentTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentTypeId')));
        SET EquipmentTypeName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentTypeName')));
        SET EquipmentIconName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentIconName')));
        SET EquipmentIcon = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EquipmentIcon')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the values into the table
        INSERT INTO tbl_EquipmentTypeMaster (EquipmentTypeId, EquipmentTypeName, EquipmentIconName, EquipmentIcon, DataStatus, CreatedBy, ModifiedBy)
        VALUES (EquipmentTypeId, EquipmentTypeName, EquipmentIconName, EquipmentIcon, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_EquipmentTypeMaster where DataStatus = 1
    SELECT * FROM tbl_EquipmentTypeMaster WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ExemptTypeMasterInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE ExemptTypeId INT;
    DECLARE ExemptTypeName VARCHAR(100);
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_ExemptTypeMaster;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET ExemptTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ExemptTypeId')));
        SET ExemptTypeName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ExemptTypeName')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the values into the table
        INSERT INTO tbl_ExemptTypeMaster (ExemptTypeId, ExemptTypeName, DataStatus, CreatedBy, ModifiedBy)
        VALUES (ExemptTypeId, ExemptTypeName, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_ExemptTypeMaster where DataStatus = 1
    SELECT * FROM tbl_ExemptTypeMaster WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_FasTagVehicleClassInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE FasTagVehicleClassId INT;
    DECLARE FasTagVehicleClassName VARCHAR(100);
    DECLARE FasTagVehicleClassDescription VARCHAR(100);
    DECLARE PermissibleWeight DECIMAL(18,3);
    DECLARE AxcelCount INT;
    DECLARE VehicleHeight DECIMAL(16,3);
    DECLARE VehicleLength DECIMAL(16,3);
    DECLARE FasTagVehicleClassColor VARCHAR(50);
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_FastagVehicleClass;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET FasTagVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].FasTagVehicleClassId')));
        SET FasTagVehicleClassName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].FasTagVehicleClassName')));
        SET FasTagVehicleClassDescription = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].FasTagVehicleClassDescription')));
        SET PermissibleWeight = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].PermissibleWeight')));
        SET AxcelCount = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].AxcelCount')));
        SET VehicleHeight = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].VehicleHeight')));
        SET VehicleLength = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].VehicleLength')));
        SET FasTagVehicleClassColor = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].FasTagVehicleClassColor')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the values into the table
        INSERT INTO tbl_FastagVehicleClass (FasTagVehicleClassId, FasTagVehicleClassName, FasTagVehicleClassDescription, 
            PermissibleWeight, AxcelCount, VehicleHeight, VehicleLength, FasTagVehicleClassColor, DataStatus, CreatedBy, ModifiedBy)
        VALUES (FasTagVehicleClassId, FasTagVehicleClassName, FasTagVehicleClassDescription, PermissibleWeight, 
            AxcelCount, VehicleHeight, VehicleLength, FasTagVehicleClassColor, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_FastagVehicleClass where DataStatus = 1
    SELECT * FROM tbl_FastagVehicleClass WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetLaneDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_GetLaneDetails`(IN p_system_ip varchar(50),
IN EffectedFrom DATE)
BEGIN
	DECLARE AEffectiveDate DATE;
    DECLARE inTollFareId BIGINT;
    DECLARE IsTollFareonSubClass BIT;
    DECLARE AccessControl BIT;
    DECLARE IsDefaultPlazaId SMALLINT;


	SELECT ED.EquipmentId,ED.PlazaId,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,0 AS OnLineStatus,0 AS ConnectionStatus,0 AS PositionStatus,
    ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	WHERE LC.LaneSystemIpAddress=p_system_ip AND ED.DataStatus=1  AND ED.ProtocolTypeId <> 7;
    
    SELECT ED.EquipmentId,ED.PlazaId,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,0 AS OnLineStatus,0 AS ConnectionStatus,0 AS PositionStatus,
    ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,ED.UrlAddress
	FROM tbl_EquipmentDetails ED 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	WHERE LC.LaneSystemIpAddress=p_system_ip AND ED.DataStatus=1  AND ED.ProtocolTypeId = 7;
    
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
		WHERE SC.DataStatus = 1 AND F.DataStatus = 1;
    ELSE
        INSERT INTO tempTollFareClass (SystemVehicleClassId, SystemVehicleClassName, SubVehicleClassId, SubVehicleClassName)
        SELECT S.SystemVehicleClassId, S.SystemVehicleClassName, 0, 'Not Required'
        FROM tbl_SystemVehicleClass S
       
        WHERE S.DataStatus = 1;
    END IF;

    SELECT TollFareId INTO inTollFareId  FROM tbl_TollFareMaster 
    WHERE EffectedFrom = AEffectiveDate order by EffectedFrom DESC 
    LIMIT 1;

    SET inTollFareId  = IFNULL(inTollFareId , 0);
	
    UPDATE tempTollFareClass T
    INNER JOIN (
        SELECT FC.TollFareId, FC.JourneyId, FC.SystemVehicleClassId, FC.SubVehicleClassId, FC.TollFare, FC.ReturnFare, FC.FasTagPenalty, FC.OverweightPenalty,FC.MonthlyPass ,'NR' ASJourneyName
        FROM tbl_TollFareConfiguration FC
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
    
     SELECT * FROM tbl_LaneConfiguration WHERE LaneSystemIpAddress=p_system_ip;
     
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_KeyboardDetailsInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_KeyboardDetailsInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE EventId INT;
    DECLARE EventName VARCHAR(50);
    DECLARE EventTypeId INT;
    DECLARE KeyCode INT;
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_KeyboardDetails;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET EventId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EventId')));
        SET EventName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EventName')));
        SET EventTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EventTypeId')));
        SET KeyCode = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].KeyCode')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the values into the table
        INSERT INTO tbl_KeyboardDetails (EventId, EventName, EventTypeId, KeyCode, DataStatus, CreatedBy, ModifiedBy)
        VALUES (EventId, EventName, EventTypeId, KeyCode, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_KeyboardDetails where DataStatus = 1
    SELECT * FROM tbl_KeyboardDetails WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_LaneInsertUpdate`(IN plazaJson JSON)
BEGIN
   TRUNCATE TABLE tbl_LaneConfiguration;
    INSERT INTO tbl_LaneConfiguration(LaneId,PlazaId,LaneNumber,LaneName,LaneTypeId,LanePositionId,LanePointId,LaneDirectionId,
    LaneStatusId,LaneModeId,LaneSystemIpAddress,DataStatus,CreatedBy,ModifiedBy)
    
    SELECT 
		JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneId')) AS LaneId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.PlazaId')) AS PlazaId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneNumber')) AS LaneNumber,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneName')) AS LaneName,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneTypeId')) AS LaneTypeId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LanePositionId')) AS LanePositionId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LanePointId')) AS LanePointId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneDirectionId')) AS LaneDirectionId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneStatusId')) AS LaneStatusId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneModeId')) AS LaneModeId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LaneSystemIpAddress')) AS LaneSystemIpAddress,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.DataStatus')) AS DataStatus,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.CreatedBy')) AS CreatedBy,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.ModifiedBy')) AS ModifiedBy;
    
    
    SELECT * FROM tbl_LaneConfiguration;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
SELECT L.LaneTransactionId,L.ShiftId,TTM.TransactionTypeName,PTM.PaymentTypeName,ETM.ExemptTypeName,
	L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,L.VehicleSubClassId,
    SSV.FasTagVehicleClassName AS VehicleSubClassName,L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS 
    VehicleAvcClassName,L.PlateNumber,L.RCTNumber,L.TagEPC,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,
	L.TagPlateNumber,L.TagReadDateTime,L.TagReadCount,L.TagReadById,L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.IsOverWeightCharged,
	L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,L.TransactionFrontImage,L.TransactionBackImage,
	L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.UserId,L.LoginId,L.IsReturnJourney,L.IsExcessJourney,
	L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount
	FROM tbl_LaneTransaction L
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
IN p_JourneyId INT,
IN p_PlazaId SMALLINT,
IN p_LaneId SMALLINT,
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
	INSERT INTO tbl_LaneTransaction (LaneTransactionId,JourneyId,PlazaId,LaneId,ShiftId,TransactionTypeId,PaymentTypeId,ExemptTypeId,ExemptSubTypeId,VehicleClassId,
VehicleSubClassId,VehicleAvcClassId,PlateNumber,RCTNumber,TagEPC,TagClassId,TagPlateNumber,TagReadDateTime,TagReadCount,TagReadById,PermissibleVehicleWeight,
ActualVehicleWeight,IsOverWeightCharged,OverWeightAmount,TagPenaltyAmount,TransactionAmount,TransactionDateTime,TransactionFrontImage,TransactionBackImage,
TransactionAvcImage,TransactionVideo,ExemptionProofImage,UserId,LoginId,IsReturnJourney,IsExcessJourney,IsBarrierAutoClose,IsTowVehicle,
IsFleetTranscation,FleetCount,TCRemark,CreatedDate)
VALUES (p_LaneTransactionId,p_JourneyId,p_PlazaId,p_LaneId,p_ShiftId,p_TransactionTypeId,p_PaymentTypeId,p_ExemptTypeId,p_ExemptSubTypeId,p_VehicleClassId,
p_VehicleSubClassId,p_VehicleAvcClassId,p_PlateNumber,p_RCTNumber,p_TagEPC,p_TagClassId,p_TagPlateNumber,p_TagReadDateTime,p_TagReadCount,p_TagReadById,p_PermissibleVehicleWeight,
p_ActualVehicleWeight,p_IsOverWeightCharged,p_OverWeightAmount,p_TagPenaltyAmount,p_TransactionAmount,p_TransactionDateTime,p_TransactionFrontImage,p_TransactionBackImage,
p_TransactionAvcImage,p_TransactionVideo,p_ExemptionProofImage,p_UserId,p_LoginId,p_IsReturnJourney,p_IsExcessJourney,p_IsBarrierAutoClose,p_IsTowVehicle,
p_IsFleetTranscation,p_FleetCount,p_TCRemark,CURRENT_TIMESTAMP);	
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_LaneTransactionUpdateIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `USP_ManufacturerInsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ManufacturerInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE ManufacturerId INT;
    DECLARE Name VARCHAR(100);
    DECLARE Address VARCHAR(100);
    DECLARE MobileNumber VARCHAR(15);
    DECLARE EmailId VARCHAR(100);
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_ManufacturerDetails;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET ManufacturerId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ManufacturerId')));
        SET Name = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].Name')));
        SET Address = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].Address')));
        SET MobileNumber = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].MobileNumber')));
        SET EmailId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EmailId')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the extracted values into the tbl_ManufacturerDetails table
        INSERT INTO tbl_ManufacturerDetails (ManufacturerId, Name, Address, MobileNumber, EmailId, DataStatus, CreatedBy, ModifiedBy)
        VALUES (ManufacturerId, Name, Address, MobileNumber, EmailId, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_ManufacturerDetails where DataStatus is 1
    SELECT * FROM tbl_ManufacturerDetails WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_PaymentTypeMasterInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE PaymentTypeId INT;
    DECLARE PaymentTypeName VARCHAR(100);
    DECLARE TransactionTypeId INT;
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Truncate the table to remove existing records
    TRUNCATE TABLE tbl_PaymentTypeMaster;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET PaymentTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].PaymentTypeId')));
        SET PaymentTypeName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].PaymentTypeName')));
        SET TransactionTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].TransactionTypeId')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the extracted values into the tbl_PaymentTypeMaster table
        INSERT INTO tbl_PaymentTypeMaster (PaymentTypeId, PaymentTypeName, TransactionTypeId, DataStatus, CreatedBy, ModifiedBy)
        VALUES (PaymentTypeId, PaymentTypeName, TransactionTypeId, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Select and return all records from tbl_PaymentTypeMaster where DataStatus is 1
    SELECT * FROM tbl_PaymentTypeMaster WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_PlazaInsertUpdate`(IN plazaJson JSON)
BEGIN
    TRUNCATE TABLE tbl_PlazaConfiguration;

    -- Insert data into the table
    INSERT INTO tbl_PlazaConfiguration(
        PlazaId,
        SystemIntegratorId,
        PlazaName,
        PlazaServerIpAddress,
        DataStatus,
        CreatedBy,
        ModifiedBy
    )
    SELECT 
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.PlazaId')) AS PlazaId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.SystemIntegratorId')) AS SystemIntegratorId,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.PlazaName')) AS PlazaName,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.PlazaServerIpAddress')) AS PlazaServerIpAddress,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.DataStatus')) AS DataStatus,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.CreatedBy')) AS CreatedBy,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.ModifiedBy')) AS ModifiedBy;

    -- Retrieve the inserted data for confirmation
    SELECT * FROM tbl_PlazaConfiguration;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_ShiftTiminingInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE ShiftId INT;
    DECLARE StartTimmng VARCHAR(100);
    DECLARE EndTimming VARCHAR(100);
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Clear the table before inserting new data
    TRUNCATE TABLE tbl_ShiftTimining;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET ShiftId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ShiftId')));
        SET StartTimmng = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].StartTimmng')));
        SET EndTimming = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].EndTimming')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the extracted values into the tbl_ShiftTimining table
        INSERT INTO tbl_ShiftTimining(
            ShiftId,
            StartTimmng,
            EndTimming,
            DataStatus,
            CreatedBy,
            ModifiedBy
        )
        VALUES (ShiftId, StartTimmng, EndTimming, DataStatus, CreatedBy, ModifiedBy);

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Retrieve and return all records from tbl_ShiftTimining
    SELECT * FROM tbl_ShiftTimining WHERE DataStatus = 1;
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
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemSettingInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);

    -- Truncate the existing table
    TRUNCATE TABLE tbl_SystemSetting;

    -- Insert data into tbl_SystemSetting
    INSERT INTO tbl_SystemSetting(
        DefaultPlazaId,
        IsAccessControl,
        AllotmentDays,
        LoginAccess,
        ExemptAccess,
        FleetAccess,
        TollFareonSubClass,
        AutoFasTagProcess,
        FasTagPenalty,
        FasTagPenaltyMultiply,
        CashReturn,
        CashReturnDiscount,
        OpeningBalance,
        ClosingBalance,
        DataStatus,
        CreatedBy,
		ModifiedBy
    )
    SELECT 
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.DefaultPlazaId')) AS DefaultPlazaId,
        CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.IsAccessControl')) = 'true' THEN 1
            ELSE 0
        END AS IsAccessControl,
        
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.AllotmentDays')) AS AllotmentDays,
         CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.LoginAccess')) = 'true' THEN 1
            ELSE 0
        END AS LoginAccess,
         CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.ExemptAccess')) = 'true' THEN 1
            ELSE 0
        END AS ExemptAccess,
        CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.FleetAccess')) = 'true' THEN 1
            ELSE 0
        END AS FleetAccess,
        CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.TollFareonSubClass')) = 'true' THEN 1
            ELSE 0
        END AS TollFareonSubClass,
        
         CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.AutoFasTagProcess')) = 'true' THEN 1
            ELSE 0
        END AS AutoFasTagProcess,
        CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.FasTagPenalty')) = 'true' THEN 1
            ELSE 0
        END AS FasTagPenalty,
        
        
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.FasTagPenaltyMultiply')) AS FasTagPenaltyMultiply,
        
         CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.CashReturn')) = 'true' THEN 1
            ELSE 0
        END AS CashReturn,
        
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.CashReturnDiscount')) AS CashReturnDiscount,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.OpeningBalance')) AS OpeningBalance,
         CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.ClosingBalance')) = 'null' THEN NULL
            ELSE JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.ClosingBalance'))
        END AS ClosingBalance,
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.DataStatus')) AS DataStatus,
		
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.CreatedBy')) AS CreatedBy,
      
        JSON_UNQUOTE(JSON_EXTRACT(plazaJson, '$.ModifiedBy')) AS ModifiedBy;
    
    -- Set success message
    SELECT * FROM tbl_SystemSetting;
    
   
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemVehicleClassInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE SystemVehicleClassId INT;
    DECLARE SystemVehicleClassName VARCHAR(100);
    DECLARE SystemVehicleClassDescription VARCHAR(100);
    DECLARE AvcVehicleClassId INT;
    DECLARE SystemSubClassIds VARCHAR(4000);
    DECLARE PermissibleWeight DECIMAL(18, 3);
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Clear the table before inserting new data
    TRUNCATE TABLE tbl_SystemVehicleClass;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET SystemVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SystemVehicleClassId')));
        SET SystemVehicleClassName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SystemVehicleClassName')));
        SET SystemVehicleClassDescription = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SystemVehicleClassDescription')));
        SET AvcVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].AvcVehicleClassId')));
        SET SystemSubClassIds = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SystemSubClassIds')));
        SET PermissibleWeight = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].PermissibleWeight')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the extracted values into the tbl_SystemVehicleClass table
        INSERT INTO tbl_SystemVehicleClass(
            SystemVehicleClassId,
            SystemVehicleClassName,
            SystemVehicleClassDescription,
            AvcVehicleClassId,
            SystemSubClassIds,
            PermissibleWeight,
            DataStatus,
            CreatedBy,
            ModifiedBy
        )
        VALUES (
            SystemVehicleClassId,
            SystemVehicleClassName,
            SystemVehicleClassDescription,
            AvcVehicleClassId,
            SystemSubClassIds,
            PermissibleWeight,
            DataStatus,
            CreatedBy,
            ModifiedBy
        );

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Retrieve and return all records from tbl_SystemVehicleClass where DataStatus = 1
    SELECT * FROM tbl_SystemVehicleClass WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_SystemVehicleSubClassInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT;
    DECLARE SystemVehicleClassId INT;
    DECLARE SystemVehicleSubClassId INT;
    DECLARE DataStatus INT;
    DECLARE CreatedBy INT;
    DECLARE ModifiedBy INT;

    -- Get the length of the JSON array
    SET len = JSON_LENGTH(plazaJson);

    -- Clear the table before inserting new data
    TRUNCATE TABLE tbl_SystemVehicleSubClass;

    -- Loop through the JSON array and insert each entry
    WHILE i < len DO
        -- Extract each value from the JSON object at index i
        SET SystemVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SystemVehicleClassId')));
        SET SystemVehicleSubClassId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].SystemVehicleSubClassId')));
        SET DataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET CreatedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET ModifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));

        -- Insert the extracted values into the tbl_SystemVehicleSubClass table
        INSERT INTO tbl_SystemVehicleSubClass(
            SystemVehicleClassId,
            SystemVehicleSubClassId,
            DataStatus,
            CreatedBy,
            ModifiedBy
        )
        VALUES (
            SystemVehicleClassId,
            SystemVehicleSubClassId,
            DataStatus,
            CreatedBy,
            ModifiedBy
        );

        -- Increment the index
        SET i = i + 1;
    END WHILE;

    -- Retrieve and return all records from tbl_SystemVehicleSubClass where DataStatus = 1
    SELECT * FROM tbl_SystemVehicleSubClass WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TollFareMasterInsertUpdate`(IN tollFareJson JSON)
BEGIN
    DECLARE AlertMessage VARCHAR(4000);
    DECLARE effectedFromDate DATETIME;
    DECLARE currentTollFareId INT;
    DECLARE journeyId VARCHAR(50);
    DECLARE systemVehicleClassId VARCHAR(50);
    DECLARE subVehicleClassId VARCHAR(50);
    DECLARE tollFare VARCHAR(50);
    DECLARE returnFare VARCHAR(50);
    DECLARE fasTagPenalty VARCHAR(50);
    DECLARE overweightPenalty VARCHAR(50);
    DECLARE monthlyPass VARCHAR(50);
    DECLARE districtRegisteredFare VARCHAR(50);
    SET AlertMessage = ';';
    
    -- Extract the EffectedFrom date and TollFareId from JSON
    SELECT 
        STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.EffectedFrom')), '%Y-%m-%dT%H:%i:%s.%fZ') 
        INTO effectedFromDate;

    SELECT JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.TollFareId')) INTO currentTollFareId;

    -- Check if EffectedFrom date is in the past
    IF effectedFromDate < NOW() THEN
        -- Check if the TollFareId exists in tbl_TollFareMaster
        IF NOT EXISTS (SELECT 1 FROM tbl_TollFareMaster WHERE TollFareId = currentTollFareId) THEN
            -- Insert into tbl_TollFareMaster
            INSERT INTO tbl_TollFareMaster (TollFareId, EffectedFrom, DataStatus)
            VALUES (
                currentTollFareId,
                effectedFromDate,
                JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.DataStatus'))
            );

            -- Iterate over the TollFareConfigurations array and insert into tbl_TollFareConfiguration
            SET @i = 0;
            WHILE JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, ']'))) IS NOT NULL DO
                SET journeyId = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].JourneyId')));
                SET systemVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].SystemVehicleClassId')));
                SET subVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].SubVehicleClassId')));
                SET tollFare = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].TollFare')));
                SET returnFare = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].ReturnFare')));
                SET fasTagPenalty = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].FasTagPenalty')));
                SET overweightPenalty = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].OverweightPenalty')));
                SET monthlyPass = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].MonthlyPass')));
                SET districtRegisteredFare = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].DistrictRegisteredFare')));

                INSERT INTO tbl_TollFareConfiguration (
                    TollFareId, JourneyId, SystemVehicleClassId, SubVehicleClassId,
                    TollFare, ReturnFare, FasTagPenalty, OverweightPenalty, MonthlyPass, DistrictRegisteredFare
                ) VALUES (
                    currentTollFareId, journeyId, systemVehicleClassId, subVehicleClassId,
                    tollFare, returnFare, fasTagPenalty, overweightPenalty, monthlyPass, districtRegisteredFare
                );

                SET @i = @i + 1;
            END WHILE;

            SET AlertMessage = 'Toll fare updated successfully;';
        ELSE
            SET AlertMessage = 'Cannot update toll fare. EffectedFrom must be greater than the current date;';
        END IF;
    ELSE
        -- If EffectedFrom is in the future, delete and insert as new
        DELETE FROM tbl_TollFareConfiguration WHERE TollFareId = currentTollFareId;
        DELETE FROM tbl_TollFareMaster WHERE TollFareId = currentTollFareId;

        -- Insert into tbl_TollFareMaster
        INSERT INTO tbl_TollFareMaster (TollFareId, EffectedFrom, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, DataStatus)
        VALUES (
            currentTollFareId,
            effectedFromDate,
            STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.CreatedDate')), '%Y-%m-%dT%H:%i:%s.%fZ'),
            JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.CreatedBy')),
            STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.ModifiedDate')), '%Y-%m-%dT%H:%i:%s.%fZ'),
            JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.ModifiedBy')),
            JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, '$.DataStatus'))
        );

        -- Insert into tbl_TollFareConfiguration
        SET @i = 0;
        WHILE JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, ']'))) IS NOT NULL DO
            SET journeyId = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].JourneyId')));
            SET systemVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].SystemVehicleClassId')));
            SET subVehicleClassId = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].SubVehicleClassId')));
            SET tollFare = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].TollFare')));
            SET returnFare = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].ReturnFare')));
            SET fasTagPenalty = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].FasTagPenalty')));
            SET overweightPenalty = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].OverweightPenalty')));
            SET monthlyPass = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].MonthlyPass')));
            SET districtRegisteredFare = JSON_UNQUOTE(JSON_EXTRACT(tollFareJson, CONCAT('$.TollFareConfigurations[', @i, '].DistrictRegisteredFare')));

            INSERT INTO tbl_TollFareConfiguration (
                TollFareId, JourneyId, SystemVehicleClassId, SubVehicleClassId,
                TollFare, ReturnFare, FasTagPenalty, OverweightPenalty, MonthlyPass, DistrictRegisteredFare
            ) VALUES (
                currentTollFareId, journeyId, systemVehicleClassId, subVehicleClassId,
                tollFare, returnFare, fasTagPenalty, overweightPenalty, monthlyPass, districtRegisteredFare
            );

            SET @i = @i + 1;
        END WHILE;

        SET AlertMessage = 'Future date Toll fare updated successfully;';
    END IF;

    -- Return the alert message
    SELECT AlertMessage;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_TransactionTypeMasterInsertUpdate`(IN plazaJson JSON)
BEGIN
    DECLARE jsonLength INT;
    DECLARE i INT DEFAULT 0;
    DECLARE transactionTypeId INT;
    DECLARE transactionTypeName VARCHAR(100);
    DECLARE reviewRequired TINYINT;
    DECLARE dataStatus INT;
    DECLARE createdBy INT;
    DECLARE modifiedBy INT;

    -- Truncate the table to start fresh
    TRUNCATE TABLE tbl_TransactionTypeMaster;

    -- Get the number of elements in the JSON array
    SET jsonLength = JSON_LENGTH(plazaJson);

    -- Loop through each element in the JSON array
    WHILE i < jsonLength DO
        -- Extract individual fields from the JSON array element
        SET transactionTypeId = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].TransactionTypeId')));
        SET transactionTypeName = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].TransactionTypeName')));
         SET reviewRequired = IF(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ReviewRequired')) = 'true', 1, 0);
        SET dataStatus = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].DataStatus')));
        SET createdBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].CreatedBy')));
        SET modifiedBy = JSON_UNQUOTE(JSON_EXTRACT(plazaJson, CONCAT('$[', i, '].ModifiedBy')));
		
        -- Insert the extracted values into the table
        INSERT INTO tbl_TransactionTypeMaster (
            TransactionTypeId, TransactionTypeName, ReviewRequired, DataStatus, CreatedBy, ModifiedBy
        ) VALUES (
            transactionTypeId, transactionTypeName, reviewRequired, dataStatus, createdBy, modifiedBy
        );

        -- Increment the counter
        SET i = i + 1;
    END WHILE;

    -- Return the results where DataStatus = 1
    SELECT * FROM tbl_TransactionTypeMaster WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`softo_db`@`%` PROCEDURE `USP_UserMasterInsertUpdate`(IN plazaJson JSON)
BEGIN
    -- Declare variables
    DECLARE i INT DEFAULT 0;
    DECLARE total_rows INT;
    DECLARE user_data JSON;

    -- Initialize variables
    SET total_rows = JSON_LENGTH(plazaJson);

    -- Clear the table
    TRUNCATE TABLE tbl_UserMaster;

    -- Loop through the JSON array
    WHILE i < total_rows DO
        -- Extract the current JSON object
        SET user_data = JSON_EXTRACT(plazaJson, CONCAT('$[', i, ']'));

        -- Insert data into the table
        INSERT INTO tbl_UserMaster (
            UserId, LoginId, PlazaId, LoginPassword, FirstName, LastName, EmailId, MobileNumber, 
            AccountExpiredDate, RoleId, UserTypeId, DataStatus, CreatedBy, ModifiedBy
        )
        VALUES (
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.UserId')) + 0,
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.LoginId')),
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.PlazaId')) + 0,
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.LoginPassword')),
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.FirstName')),
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.LastName')),
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.EmailId')),
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.MobileNumber')),
            STR_TO_DATE(JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.AccountExpiredDate')), '%d-%b-%Y'),
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.RoleId')) + 0,
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.UserTypeId')) + 0,
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.DataStatus')) + 0,
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.CreatedBy')) + 0,
            JSON_UNQUOTE(JSON_EXTRACT(user_data, '$.ModifiedBy')) + 0
        );

        -- Increment the counter
        SET i = i + 1;
    END WHILE;

    -- Return active records
    SELECT * FROM tbl_UserMaster WHERE DataStatus = 1;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

-- Dump completed on 2025-01-07 20:39:52
