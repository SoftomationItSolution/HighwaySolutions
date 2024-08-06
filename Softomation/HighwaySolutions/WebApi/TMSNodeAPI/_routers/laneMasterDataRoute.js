const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const crypto = require("../_helpers/crypto");
const fs = require('fs');
const moment = require('moment');
const path = require('path');
const configManagerPath = path.resolve('./configManager');
const {
    root_path,
    pc_path
  } = require("../_helpers/constants");
  const pc_Directory = path.join(root_path, pc_path);

router.get('/ShiftTimingDetails', ShiftTiminingGetAll);
router.get('/SystemSettingGet', SystemSettingGet);
router.get('/UserDetails', LaneUserGetDetails);
router.get('/TransactionTypeDetails', TransactionTypeGetActive);
router.get('/ExemptTypeDetails', ExemptTypeGetActive);
router.get('/PaymentMethodTypeDetails', PaymentMethodTypeGetActive);
router.get('/FasTagVehicleClassDetails', FasTagVehicleClassGetActive);
router.get('/SystemVehicleClassDetails', SystemVehicleClassGetActive);
router.get('/SystemVehicleSubClassDetails', SystemVehicleSubClassDetails);
router.get('/DenominationDetails', DenominationGetActive);
router.get('/EquipmentTypeDetails', EquipmentTypeGetActive);
router.get('/ProtocolTypeMasterGetAll', ProtocolTypeMasterGetAll);
router.get('/TollFareGetByEffectedFrom', TollFareGetByEffectedFrom);
router.get('/LaneDetails', LaneGetByIpAddress);
router.get('/PlazaDetails', PlazaGetById);
router.get('/EquipmentDetails', EquipmentDetailsGetByLane);
router.get('/DataStatusMasterGetAll', DataStatusMasterGetAll);
router.get('/LaneModeMasterGetAll', LaneModeMasterGetAll);
router.get('/LanePointMasterGetAll', LanePointMasterGetAll);
router.get('/LanePositionMasterGetAll', LanePositionMasterGetAll);
router.get('/LaneStatusMasterGetAll', LaneStatusMasterGetAll);
router.get('/LaneTypeMasterGetAll', LaneTypeMasterGetAll);
router.get('/LaneDirectionMasterGetAll', LaneDirectionMasterGetAll);
router.get('/SystemIntegratorGetAll', SystemIntegratorGetAll);
router.get('/ManufacturerGetAll', ManufacturerGetAll);
router.get('/ProjectConfigGet', ProjectConfigGet);
module.exports = router;

async function ProjectConfigGet(req, res, next) {
    try {
        fs.readFile(pc_Directory, 'utf8', (err, data) => {
            if (err) {
                errorlogMessage(err, 'ProjectConfiguration Read File');
                let out = constants.ResponseMessage(err.message, null);
                res.status(500).json(out)
            }
            try {
                const jsonData = JSON.parse(data);
                let out = constants.ResponseMessage("success", jsonData);
                res.status(200).json(out)
            } catch (err) {
                errorlogMessage(err, 'ProjectConfiguration parsing File');
                let out = constants.ResponseMessage(err.message, null);
                res.status(500).json(out)
            }
        });
    } catch (error) {
        errorlogMessage(error, 'ProjectConfigGet');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }

}

async function DataStatusMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_DataStatusMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'DataStatusMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemIntegratorGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_SystemIntegratorGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemIntegratorGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ManufacturerGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ManufacturerGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ManufacturerGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneTypeMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneTypeMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTypeMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneDirectionMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneDirectionMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'USP_LaneDirectionMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneModeMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneModeMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneModeMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LanePointMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LanePointMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LanePointMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LanePositionMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LanePositionMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LanePositionMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneStatusMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneStatusMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneStatusMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function TollFareGetByEffectedFrom(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('EffectedFrom', sql.Date, req.query.EffectedFrom)
            .execute('USP_TollFareGetByEffectedFrom');
        
        if (result.recordset == [] || result.recordset.length==0) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let mainTable = result.recordset[0];
            let ResponseData = {
                TollFareId: mainTable.TollFareId,
                EffectedFrom: mainTable.EffectedFrom,
                CreatedDate: mainTable.CreatedDate,
                CreatedBy: mainTable.CreatedBy,
                ModifiedDate: mainTable.ModifiedDate,
                ModifiedBy: mainTable.ModifiedBy,
                DataStatus: mainTable.DataStatus,
                DataStatus: mainTable.DataStatus,
                TollFareConfigurations: result.recordsets[1]
            }
            let out = constants.ResponseMessage("success", ResponseData);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'TollFareGetByEffectedFrom');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemSettingGet(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_SystemSettingGet');
        
        let out = constants.ResponseMessage("success", result.recordset[0]);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemSettingGet');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }

}

async function DenominationGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_DenominationGetActive')
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'DenominationGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function LaneUserGetDetails(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_UserforLaneGetAll');
        
        let dataarray = result.recordset;
        userMasterData = []
        for (let i = 0; i < dataarray.length; i++) {
            const element = dataarray[i];
            userMasterData.push(CreateObjectForUserMaster(element))
        }
        let out = constants.ResponseMessage("success", userMasterData);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneUserGetDetails');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function TransactionTypeGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_TransactionTypeGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'TransactionTypeGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ExemptTypeGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ExemptTypeMasterGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ExemptTypeGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function PaymentMethodTypeGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_PaymentTypeGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'PaymentMethodTypeGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemVehicleClassGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_SystemVehicleClassGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemVehicleClassGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemVehicleSubClassDetails(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_SystemVehicleSubClassGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemVehicleSubClassDetails');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FasTagVehicleClassGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_FasTagVehicleClassGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'FasTagVehicleClassGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetByIpAddress(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('LaneSystemIpAddress', sql.VarChar(50), req.query.IpAddress)
            .execute('USP_LaneGetbyIpAddress');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'LaneGetByIpAddress');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function PlazaGetById(req, res, next) {
    try {
        const PlazaId = req.query.PlazaId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('PlazaId', sql.Int, PlazaId)
            .execute('USP_PlazaGetbyId');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'PlazaGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function EquipmentTypeGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_EquipmentTypeMasterGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'EquipmentTypeGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ProtocolTypeMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ProtocolTypeMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ProtocolTypeMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function EquipmentDetailsGetByLane(req, res, next) {
    try {
        const LaneId = req.query.LaneId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('LaneId', sql.Int, LaneId)
            .execute('USP_EquipmentDetailsGetByLaneId');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'EquipmentDetailsGetByLane');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ShiftTiminingGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ShiftTiminingGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}


function CreateObjectForUserMaster(row) {
    try {
        const data = {
            UserId: parseInt(row.UserId),
            LoginId: row.LoginId,
            LoginPassword: row.LoginPassword,
            LoginPasswordPlan: crypto.decrypt(row.LoginPassword),
            FirstName: row.FirstName,
            LastName: row.LastName,
            EmailId: row.EmailId,
            MobileNumber: row.MobileNumber,
            AccountExpiredDate: moment(row.AccountExpiredDate).format('DD-MMM-YYYY'),
            RoleId: parseInt(row.RoleId),
            RoleName: row.RoleName,
            DataStatus: parseInt(row.DataStatus),
            CreatedDate: moment(row.CreatedDate).format('DD-MMM-YYYY HH:mm:ss'),
            CreatedBy: parseInt(row.CreatedBy),
            ModifiedDate: moment(row.ModifiedDate).format('DD-MMM-YYYY HH:mm:ss'),
            ModifiedBy: parseInt(row.ModifiedBy),
            PlazaId: parseInt(row.PlazaId),
            PlazaName: row.PlazaName,
            UserProfileImage: row.UserProfileImage,
            UserTypeId: parseInt(row.UserTypeId),
            UserTypeName: row.UserTypeName,
            DataStatusName: row.DataStatusName
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function errorlogMessage(error, method) {
    try {
        logger.error(`Caught an error in :${method} : ${error.message}`);
        logger.error(error.stack);
    }
    catch (error) {
        logger.error(`Caught an error in :${method}`);
    }
}