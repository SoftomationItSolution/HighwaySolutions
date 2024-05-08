
DELIMITER ;;

CREATE PROCEDURE `USP_AvcTransactionInsert`(
IN p_LaneId smallint,
IN p_TransactionCount bigint,
IN p_AvcClassId smallint,
IN p_AxleCount smallint,
IN p_IsReverseDirection bit,
IN p_WheelBase bigint,
IN p_ImageName varchar(255),
IN p_TransactionDateTime DATETIME(6)
)
BEGIN
	DECLARE AlertMessage VARCHAR(4000);
	SET AlertMessage = ';';
	INSERT INTO tbl_AvcTransaction(LaneId,TransactionCount,AvcClassId,AxleCount,IsReverseDirection,WheelBase,ImageName,TransactionDateTime)
	VALUES(p_LaneId,p_TransactionCount,p_AvcClassId,p_AxleCount,p_IsReverseDirection,p_WheelBase,p_ImageName,p_TransactionDateTime);
	SET AlertMessage = 'successfully';
	SELECT AlertMessage;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_AvcTransactionMarkedTransfer`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_AvcTransactionPending`()
BEGIN
	SELECT * FROM tbl_AvcTransaction 
    WHERE IsDataTransfer=0 OR IsMediaTransfer=0;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_DataStatusInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_DenominationMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_EquipmentDetailsGetByLaneId`(
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


DELIMITER ;;
CREATE  PROCEDURE `USP_EquipmentDetailsInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_EquipmentTypeMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_ExemptTypeGetAll`()
BEGIN
	SELECT * FROM tbl_ExemptTypeMaster
    WHERE DataStatus=1;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_ExemptTypeMasterInsertUpdate`(
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
DELIMITER ;;
CREATE  PROCEDURE `USP_FasTagVehicleClassInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneDirectionInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneGetbyIpAddress`(IN inLaneSystemIpAddress VARCHAR(50))
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneModeInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LanePointInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LanePositionInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneStatusInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneTransactionGetLatest`()
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
	LEFT JOIN tbl_FastagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FastagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FastagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
ORDER BY L.TransactionDateTime DESC
LIMIT 10;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneTransactionInsert`(
IN p_LaneTransactionId BIGINT,
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneTransactionMarkedTransfer`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneTransactionPending`()
BEGIN
	SELECT * FROM tbl_LaneTransaction 
    WHERE IsDataTransfer=0
    ORDER BY CreatedDate DESC;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_LaneTypeInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_ManufacturerInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_PaymentTypeGetAll`()
BEGIN
	SELECT * FROM tbl_PaymentTypeMaster
    WHERE DataStatus=1;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_PaymentTypeMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_PlazaGetbyId`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_PlazaInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_ProtocolTypeMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_ShiftTiminingGetAll`()
BEGIN
SELECT * FROM tbl_ShiftTimining WHERE DataStatus=1;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_ShiftTiminingInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemIntegratorInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemSettingGet`()
BEGIN
SELECT * FROM tbl_SystemSetting;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemSettingInsertUpdate`(
IN p_DefaultPlazaId smallint,
IN p_AllotmentDays smallint,
IN p_IsAccessControl boolean,
IN p_LoginAccess boolean,
IN p_ExemptAccess boolean,
IN p_FleetAccess boolean,
IN p_SubClassRequired boolean,
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
            ExemptAccess,FleetAccess,SubClassRequired,
            FasTagPenalty,FasTagPenaltyMultiply,CashReturn,CashReturnDiscount,
            OpeningBalance,ClosingBalance,DataStatus,CreatedDate,CreatedBy)
			VALUES(p_DefaultPlazaId,p_IsAccessControl,p_AllotmentDays,p_LoginAccess,
            p_ExemptAccess,p_FleetAccess,p_SubClassRequired,
            p_FasTagPenalty,p_FasTagPenaltyMultiply,p_CashReturn,p_CashReturnDiscount,
            p_OpeningBalance,0,p_DataStatus,p_CreatedDate,p_CreatedBy);
            SET AlertMessage = 'System setting added successfully;';
            
                      
     ELSE        
            UPDATE tbl_SystemSetting SET DefaultPlazaId=p_DefaultPlazaId,IsAccessControl=p_IsAccessControl,
            AllotmentDays=p_AllotmentDays,LoginAccess=p_LoginAccess,ExemptAccess=p_ExemptAccess,FleetAccess=p_FleetAccess,
            FasTagPenalty=p_FasTagPenalty,FasTagPenaltyMultiply=p_FasTagPenaltyMultiply,
            CashReturn=p_CashReturn,CashReturnDiscount=p_CashReturnDiscount,
            OpeningBalance=p_OpeningBalance,DataStatus=p_DataStatus,ModifiedDate=p_ModifiedDate,ModifiedBy=p_ModifiedBy,SubClassRequired=p_SubClassRequired
          LIMIT 1;
          SET AlertMessage = 'System setting updated successfully;';
    END IF;    
            
  SELECT AlertMessage;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemVehicleClassGet`()
BEGIN
	SELECT * FROM tbl_SystemVehicleClass 
    WHERE DataStatus=1;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemVehicleClassInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemVehicleSubClassGet`()
BEGIN
		SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,
        S.AvcVehicleClassId,S.PermissibleWeight,SC.SystemVehicleSubClassId,F.FasTagVehicleClassName AS SystemVehicleSubClassName,
        SC.DataStatus,SC.CreatedDate,SC.CreatedBy,SC.ModifiedDate,SC.ModifiedBy
	FROM  tbl_SystemVehicleSubClass SC 
	INNER JOIN tbl_SystemVehicleClass S ON SC.SystemVehicleClassId=S.SystemVehicleClassId
	INNER JOIN tbl_FastagVehicleClass F ON SC.SystemVehicleSubClassId =F.FasTagVehicleClassId
	WHERE SC.DataStatus=1;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_SystemVehicleSubClassInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_TollFareConfigurationInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_TollFareGetByEffectedFrom`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_TollFareMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_TransactionTypeGetAll`()
BEGIN
	SELECT * FROM tbl_TransactionTypeMaster
    WHERE DataStatus=1;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_TransactionTypeMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_UserMasterInsertUpdate`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_UsersGetByLoginId`(
IN p_LoginId varchar (40)
)
BEGIN
	SELECT *
	FROM tbl_UserMaster 
	WHERE LoginId=p_LoginId;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_WimTransactionAxleDetailsInsert`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_WimTransactionAxleDetailsMarkedTransfer`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_WimTransactionAxleDetailsPending`()
BEGIN
	SELECT * FROM tbl_WimTransactionAxleDetails 
    WHERE IsDataTransfer=0;
END ;;

DELIMITER ;;
CREATE  PROCEDURE `USP_WimTransactionInsert`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_WimTransactionMarkedTransfer`(
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

DELIMITER ;;
CREATE  PROCEDURE `USP_WimTransactionPending`()
BEGIN
	SELECT * FROM tbl_WimTransaction 
    WHERE IsDataTransfer=0;
END ;;

