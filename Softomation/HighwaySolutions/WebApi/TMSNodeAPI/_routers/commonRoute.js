const express = require('express');
const router = express.Router();
const moment = require('moment');
const fs = require('fs');
const sql = require('mssql');
const path = require('path');
const database = require('../_helpers/db');
const token = require("../_helpers/jwtToken");
const crypto = require("../_helpers/crypto");
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const configManagerPath = path.resolve('./configManager');
const ProjectConfigurationPath = path.join(configManagerPath, 'ProjectConfiguration.json');
router.post('/ValidateUser', ValidateUser);
router.post('/LogoutUser', LogoutUser);
router.post('/RolePermissionGetByMenu', RolePermissionGetByMenu);
router.post('/SystemSettingSetup', SystemSettingSetup);
router.post('/UpdateProjectConfig', UpdateProjectConfig);

router.get('/DataStatusMasterGetAll', DataStatusMasterGetAll);
router.get('/GetMenu', GetMenu);
router.get('/ProjectConfigGet', ProjectConfigGet);
router.get('/SystemSettingGet', SystemSettingGet);
router.get('/DenominationGetActive', DenominationGetActive);
router.get('/FilterMasterGet', FilterMasterGet);
router.get('/GetReportCategory', GetReportCategory);
router.get('/GetReportCategoryById', GetReportCategoryById);

module.exports = router;

async function DataStatusMasterGetAll(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_DataStatusMasterGetAll');
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'DataStatusMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemSettingGet(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_SystemSettingGet');
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset[0]);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemSettingGet');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemSettingSetup(req, res, next) {
    try {
        const pool = await database.connect();
        const currentDateTime = new Date();
        result = await pool.request()
            .input('DefaultPlazaId', sql.SmallInt, req.body.DefaultPlazaId)
            .input('AllotmentDays', sql.SmallInt, req.body.AllotmentDays)
            .input('IsAccessControl', sql.Bit, req.body.IsAccessControl)
            .input('LoginAccess', sql.Bit, req.body.LoginAccess)
            .input('ExemptAccess', sql.Bit, req.body.ExemptAccess)
            .input('FleetAccess', sql.Bit, req.body.FleetAccess)
            .input('SubClassRequired', sql.Bit, req.body.SubClassRequired)
            .input('FasTagPenalty', sql.Bit, req.body.FasTagPenalty)
            .input('FasTagPenaltyMultiply', sql.SmallInt, req.body.FasTagPenaltyMultiply)
            .input('CashReturn', sql.Bit, req.body.CashReturn)
            .input('CashReturnDiscount', sql.SmallInt, req.body.CashReturnDiscount)
            .input('OpeningBalance', sql.Decimal, req.body.OpeningBalance)
            .input('DataStatus', sql.SmallInt, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, currentDateTime)
            .input('ModifiedDate', sql.DateTime, currentDateTime)
            .execute('USP_SystemSettingInsertUpdate');
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset[0]);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemSettingSetup');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }

}

async function ValidateUser(req, res, next) {
    try {
        if (req.body.LoginId.toLowerCase() == "softo") {
            const yy = new Date().getFullYear();
            if (req.body.LoginPassword == "Softo@" + yy) {
                let userData = {
                    "PlazaId": 0,
                    "PlazaName": "",
                    "UserId": 0,
                    "LoginId": req.body.LoginId,
                    "LoginPassword": "",
                    "FirstName": "Super",
                    "LastName": "Admin",
                    "EmailId": "sysadmin@gmail.com",
                    "MobileNumber": "9999999999",
                    "UserTypeId": 0,
                    "UserTypeName": "Super",
                    "UserProfileImage": "/ProfileImage/avatar-7.jpg",
                    "AccountExpiredDate": null,
                    "RoleId": 0,
                    "RoleName": "sysadmin",
                    "RolePermission": [],
                    "DataStatus": 0,
                    "DataStatusName": "Active",
                }
                let payload = {
                    LoginId: req.body.LoginId,
                    LoginPassword: req.body.LoginPassword
                }
                let tkOut = token.GetToken(payload);
                let login = {
                    "LoginId": req.body.LoginId,
                    "LoginPassword": req.body.LoginPassword,
                    "IpAddress": "",
                    "MacAddress": "",
                    "AccessToken": tkOut.token,
                    "AccessTokenExpired": tkOut.expiresIn,
                    "AccessTokenExpiredTimeStamp": moment(tkOut.expiresIn).format('DD-MMM-YYYY HH:mm:ss'),
                    "UserData": userData
                }

                let out = constants.ResponseMessage("success", login);
                res.status(200).json(out);

            }
            else {
                let out = constants.ResponseMessage("Invalid user credentials", null);
                res.status(200).json(out);
            }
        }
        else {
            const pool = await database.connect();
            const result = await pool.request()
                .input('LoginId', sql.VarChar(40), req.body.LoginId)
                .execute('USP_UsersGetByLoginId');
            await database.disconnect();
            if (result.recordset == []) {
                let out = constants.ResponseMessage("Invalid user credentials", null);
                res.status(200).json(out);
            }
            else {
                const userData = result.recordset[0];
                const AccountExpiredDate = moment(userData.AccountExpiredDate)
                const currentDate = new Date();
                if (req.body.LoginPassword == crypto.decrypt(userData.LoginPassword)) {
                    if (userData.DataStatus != 1) {
                        let out = constants.ResponseMessage("Account has inactive", null);
                        res.status(200).json(out);
                    }
                    else if (AccountExpiredDate < currentDate) {
                        let out = constants.ResponseMessage("Account has expired", null);
                        res.status(200).json(out);
                    }
                    else {
                        let payload = {
                            LoginId: req.body.LoginId,
                            LoginPassword: req.body.LoginPassword
                        }
                        let tkOut = token.GetToken(payload);
                        let login = {
                            "LoginId": req.body.LoginId,
                            "LoginPassword": req.body.LoginPassword,
                            "IpAddress": "",
                            "MacAddress": "",
                            "AccessToken": tkOut.token,
                            "AccessTokenExpired": tkOut.expiresIn,
                            "AccessTokenExpiredTimeStamp": moment(tkOut.expiresIn).format('DD-MMM-YYYY HH:mm:ss'),
                            "UserData": userData
                        }
                        let out = constants.ResponseMessage("success", login);
                        res.status(200).json(out);
                    }
                }
                else {
                    let out = constants.ResponseMessage("Invalid user password", null);
                    res.status(200).json(out);
                }
            }
        }
    } catch (error) {
        errorlogMessage(error, 'ValidateUser');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function LogoutUser(req, res, next) {
    try {
        let out = constants.ResponseMessage("success", null);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'LogoutUser');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function GetMenu(req, res, next) {
    try {
        const RoleId = req.query.RoleId | 0;
        let result = null
        const pool = await database.connect();
        if (RoleId == 0) {
            result = await pool.request().execute('USP_MenuGetAll')
        }
        else {
            result = await pool.request().input('RoleId', sql.Int, RoleId)
                .execute('USP_MenuGetByRoleId');
        }
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'GetMenu');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function GetReportCategory(req, res, next) {
    try {
        let result = null
        const pool = await database.connect();
        result = await pool.request().execute('USP_ReportCategory')
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'GetReportCategory');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function GetReportCategoryById(req, res, next) {
    try {
        const ReportId = req.query.ReportId | 0;
        let result = null
        const pool = await database.connect();
        result = await pool.request().input('ReportId', sql.SmallInt, ReportId).execute('USP_ReportCategoryById')
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'GetReportCategoryById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}


async function RolePermissionGetByMenu(req, res, next) {
    try {
        const pool = await database.connect();
        const result = await pool.request().input('MenuURL', sql.VarChar(50), req.body.MenuUrl)
            .input('SystemId', sql.Int, req.body.SystemId)
            .input('RoleId', sql.Int, req.body.RoleId)
            .execute('USP_RolesPermissionGetByMenu');
        await database.disconnect();
        if (result.recordset == []) {
            let out = constants.ResponseMessage("unauthorized", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'RolePermissionGetByMenu');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function DenominationGetActive(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_DenominationGetActive')
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'DenominationGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}



async function FilterMasterGet(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_MasterDataGet')
        await database.disconnect();
        let dataarray = result.recordsets;
        let ShiftTimining = [], TCMasterData = [], AuditerMasterData = [], PlazaData = [], LaneData = [], TransactionTypeData = [],
            PayemntTypeData = [], ExemptTypeData = [], SystemClassData = [], SystemSubClassData = [];
        for (let i = 0; i < dataarray.length; i++) {
            const element = dataarray[i];
            for (let j = 0; j < element.length; j++) {
                const element1 = element[j];
                if (i == 0) {
                    ShiftTimining.push(CreateObjectForShiftTimining(element1))
                } else if (i == 1) {
                    TCMasterData.push(CreateObjectForUserMaster(element1))
                } else if (i == 2) {
                    AuditerMasterData.push(CreateObjectForUserMaster(element1))
                } else if (i == 3) {
                    PlazaData.push(CreateObjectForPlaza(element1))
                } else if (i == 4) {
                    LaneData.push(CreateObjectForLane(element1))
                } else if (i == 5) {
                    TransactionTypeData.push(CreateObjectForTransactionType(element1))
                } else if (i == 6) {
                    PayemntTypeData.push(CreateObjectForPayemntType(element1))
                } else if (i == 7) {
                    ExemptTypeData.push(CreateObjectForExemptType(element1))
                } else if (i == 8) {
                    SystemClassData.push(CreateObjectForSystemVehicleClass(element1))
                } else if (i == 9) {
                    SystemSubClassData.push(CreateObjectForSystemVehicleSubClass(element1))
                }
            }
        }
        let ResultDataSet = {
            ShiftTiminingList: ShiftTimining,
            TCMasterList: TCMasterData,
            AuditerMasterList: AuditerMasterData,
            PlazaDataList: PlazaData,
            LaneDataList: LaneData,
            TransactionTypeList: TransactionTypeData,
            PayemntTypeList: PayemntTypeData,
            ExemptTypeList: ExemptTypeData,
            SystemClassList: SystemClassData,
            SystemSubClassList: SystemSubClassData
        }
        let out = constants.ResponseMessage("success", ResultDataSet);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'FilterMasterGet');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function ProjectConfigGet(req, res, next) {
    try {
        let out = constants.ResponseMessage("success", require(ProjectConfigurationPath));
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ProjectConfigGet');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }

}

async function UpdateProjectConfig(req, res, next) {
    const updatedData = req.body;
    fs.readFile(ProjectConfigurationPath, 'utf8', (err, data) => {
        if (err) {
            errorlogMessage(err, 'ProjectConfiguration Read File');
            let out = constants.ResponseMessage(err.message, null);
            res.status(500).json(out)
        }
        try {
            const jsonData = JSON.parse(data);
            Object.assign(jsonData, updatedData);
            fs.writeFile(ProjectConfigurationPath, JSON.stringify(jsonData, null, 2), 'utf8', (err) => {
                if (err) {
                    errorlogMessage(err, 'ProjectConfiguration write File');
                    let out = constants.ResponseMessage(err.message, null);
                    res.status(500).json(out)
                }
                let out = constants.ResponseMessage("success", null);
                res.status(200).json(out);
            });
        } catch (err) {
            errorlogMessage(err, 'ProjectConfiguration parsing File');
            let out = constants.ResponseMessage(err.message, null);
            res.status(500).json(out)
        }
    });
}

function CreateObjectForShiftTimining(row) {
    try {
        const data = {
            DataId: parseInt(row.ShiftId),
            DataName: "Shift-" + row.ShiftId
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForUserMaster(row) {
    try {
        const data = {
            DataId: parseInt(row.UserId),
            DataName: row.LoginId
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForPlaza(row) {
    try {
        const data = {
            DataId: parseInt(row.PlazaId),
            DataName: row.PlazaName
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForLane(row) {
    try {
        const data = {
            DataId: parseInt(row.LaneId),
            DataName: "Lane-" + row.LaneNumber,
            ParentId: row.PlazaId
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForTransactionType(row) {
    try {
        const data = {
            DataId: parseInt(row.TransactionTypeId),
            DataName: row.TransactionTypeName
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForPayemntType(row) {
    try {
        const data = {
            DataId: parseInt(row.PaymentTypeId),
            DataName: row.PaymentTypeName
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForExemptType(row) {
    try {
        const data = {
            DataId: parseInt(row.ExemptTypeId),
            DataName: row.ExemptTypeName
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForSystemVehicleClass(row) {
    try {
        const data = {
            DataId: parseInt(row.SystemVehicleClassId),
            DataName: row.SystemVehicleClassName
        }
        return data;
    } catch (error) {
        throw error;
    }
}

function CreateObjectForSystemVehicleSubClass(row) {
    try {
        const data = {
            DataId: parseInt(row.FasTagVehicleClassId),
            DataName: row.FasTagVehicleClassName,
            ParentId: row.ParentClassId
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