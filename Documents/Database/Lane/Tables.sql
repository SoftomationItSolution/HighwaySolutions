CREATE TABLE `tbl_EquipmentDetails` (
  `EquipmentId` bigint NOT NULL,
  `PlazaId` int NOT NULL,
  `LaneId` int NOT NULL,
  `EquipmentTypeId` int DEFAULT NULL,
  `EquipmentName` varchar(100) DEFAULT NULL,
  `ProtocolTypeId` int DEFAULT NULL,
  `IpAddress` varchar(20) DEFAULT NULL,
  `PortNumber` int DEFAULT NULL,
  `LoginId` varchar(50)  DEFAULT NULL,
  `LoginPassword` varchar(50) DEFAULT NULL,
  `ManufacturerId` int DEFAULT NULL,
  `MacAddress` varchar(100) DEFAULT NULL,
  `ModelNumber` varchar(100)  DEFAULT NULL,
  `SerialNumber` varchar(100) DEFAULT NULL,
  `ManufacturerDate` date DEFAULT NULL,
  `PurchageDate` date DEFAULT NULL,
  `WarrantyExpireDate` date DEFAULT NULL,
  `UrlAddress` varchar(255)  DEFAULT NULL,
  `OnLineStatus` tinyint DEFAULT NULL,
  `DataStatus` int DEFAULT 1,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT 0,
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT 0,
  PRIMARY KEY (`EquipmentId`)
);

CREATE TABLE `tbl_ManufacturerDetails` (
  `ManufacturerId` smallint NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `DataStatus` int DEFAULT 1,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT 0,
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT 0,
  PRIMARY KEY (`ManufacturerId`)
);

CREATE TABLE `tbl_EquipmentTypeMaster` (
  `EquipmentTypeId` smallint NOT NULL,
  `EquipmentTypeName` varchar(100)DEFAULT NULL,
  `EquipmentIconName` varchar(100)DEFAULT NULL,
  `EquipmentIcon` varchar(100)DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`EquipmentTypeId`)
); 

CREATE TABLE `tbl_TransactionTypeMaster` (
  `TransactionTypeId` smallint NOT NULL,
  `TransactionTypeName` varchar(100) DEFAULT NULL,
  `ReviewRequired` tinyint(1) DEFAULT '0',
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`TransactionTypeId`)
);

CREATE TABLE `tbl_PaymentTypeMaster` (
  `PaymentTypeId` smallint NOT NULL,
  `PaymentTypeName` varchar(100) DEFAULT NULL,
  `TransactionTypeId` smallint DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`PaymentTypeId`)
);

CREATE TABLE `tbl_ExemptTypeMaster` (
  `ExemptTypeId` smallint NOT NULL,
  `ExemptTypeName` varchar(100) DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`ExemptTypeId`)
);

CREATE TABLE `tbl_ShiftTimining` (
  `ShiftId` smallint NOT NULL,
  `StartTimmng` varchar(10) DEFAULT NULL,
  `EndTimming` varchar(10) DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`ShiftId`)
);

CREATE TABLE `tbl_DenominationMaster` (
  `DenominationId` smallint NOT NULL,
  `DenominationValue` smallint DEFAULT '0',
  `OrderBy` smallint DEFAULT '0',
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`DenominationId`)
);

CREATE TABLE `tbl_KeyboardDetails` (
  `EventId` smallint DEFAULT NULL,
  `EventName` varchar(50) DEFAULT NULL,
  `EventTypeId` smallint DEFAULT NULL,
  `KeyCode` smallint DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0'
);

CREATE TABLE `tbl_FastagVehicleClass` (
  `FasTagVehicleClassId` bigint NOT NULL,
  `FasTagVehicleClassName` varchar(100) DEFAULT NULL,
  `FasTagVehicleClassDescription` varchar(100) DEFAULT NULL,
  `PermissibleWeight` decimal(18,3) DEFAULT NULL,
  `AxcelCount` smallint DEFAULT '0',
  `VehicleHeight` decimal(16,3) DEFAULT '0.000',
  `VehicleLength` decimal(16,3) DEFAULT '0.000',
  `FasTagVehicleClassColor` varchar(50) DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`FasTagVehicleClassId`)
);

CREATE TABLE `tbl_SystemVehicleClass` (
  `SystemVehicleClassId` smallint DEFAULT NULL,
  `SystemVehicleClassName` varchar(100) DEFAULT NULL,
  `SystemVehicleClassDescription` varchar(100) DEFAULT NULL,
  `AvcVehicleClassId` smallint DEFAULT '0',
  `SystemSubClassIds` varchar(4000) DEFAULT NULL,
  `PermissibleWeight` decimal(18,3) DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0'
);

CREATE TABLE `tbl_SystemVehicleSubClass` (
  `SystemVehicleClassId` smallint DEFAULT NULL,
  `SystemVehicleSubClassId` smallint DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0'
);

CREATE TABLE `tbl_UserMaster` (
  `UserId` bigint NOT NULL,
  `PlazaId` int DEFAULT NULL,
  `LoginId` varchar(20) DEFAULT NULL,
  `LoginPassword` varchar(100) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `AccountExpiredDate` date DEFAULT NULL,
  `UserProfileImage` varchar(255) DEFAULT NULL,
  `UserTypeId` smallint DEFAULT NULL,
  `RoleId` int DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`UserId`)
);

CREATE TABLE `tbl_TollFareMaster` (
  `TollFareId` bigint NOT NULL,
  `EffectedFrom` date DEFAULT NULL,
  `DataStatus` smallint DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT '0',
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT '0',
  PRIMARY KEY (`TollFareId`)
);

CREATE TABLE `tbl_TollFareConfiguration` (
  `TollFareId` bigint DEFAULT NULL,
  `JourneyId` bigint DEFAULT NULL,
  `SystemVehicleClassId` smallint DEFAULT NULL,
  `SubVehicleClassId` smallint DEFAULT NULL,
  `TollFare` decimal(18,2) DEFAULT NULL,
  `ReturnFare` decimal(18,2) DEFAULT NULL,
  `FasTagPenalty` decimal(18,2) DEFAULT NULL,
  `OverweightPenalty` decimal(18,2) DEFAULT NULL,
  `MonthlyPass` decimal(18,2) DEFAULT NULL,
  `DistrictRegisteredFare` decimal(18,2) DEFAULT NULL
);
