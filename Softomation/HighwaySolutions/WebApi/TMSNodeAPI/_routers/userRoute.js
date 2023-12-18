const express = require('express');
const router = express.Router();
const database = require('../_helpers/db');
const crypto = require("../_helpers/crypto");
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const path = require('path');
const sql = require('mssql');
const moment = require('moment');

router.post('/UserValidatePassword', UserValidatePassword);
router.post('/UserUpdatePassword', UserUpdatePassword);
router.post('/UserConfigurationSetUp', UserConfigurationSetUp);
router.post('/UserProfileChange', UserProfileChange);


router.get('/UserConfigurationGetAll', UserConfigurationGetAll);
router.get('/UserConfigurationGetById', UserConfigurationGetById);
router.get('/UserConfigurationGetByUserType', UserConfigurationGetByUserType);
router.get('/UserConfigurationGetBySystemUserType', UserConfigurationGetBySystemUserType);
module.exports = router;

async function UserValidatePassword(req, res, next) {
    try {
        const UserId = req.body.UserId | 0;
        result = await UserGetbyId(UserId);
        if (result == null) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            if (result.recordset != []) {
                const userData = result.recordset[0];
                if (req.body.LoginPassword == crypto.decrypt(userData.LoginPassword)) {
                    let out = constants.ResponseMessage("success", userData);
                    res.status(200).json(out)
                }
                else {
                    let out = constants.ResponseMessage("Invalid user password", null);
                    res.status(200).json(out)
                }
            }
            else {
                let out = constants.ResponseMessage("User Details not found", null);
                res.status(200).json(out)
            }
        }
    } catch (error) {
        errorlogMessage(error, 'UserValidatePassword');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function UserUpdatePassword(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().input('UserId', sql.Int, req.body.UserId)
            .input('LoginPassword', sql.VarChar(200), crypto.encrypt(req.body.LoginPassword))
            .input('CDateTime', sql.DateTime, new Date())
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .execute('USP_UserUpdatePassword');
        await database.disconnect();
        let out = constants.ResponseMessage("User Details not found", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'UserUpdatePassword');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UserConfigurationSetUp(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().input('UserId', sql.Int, req.body.UserId)
            .input('LoginId', sql.VarChar(40), req.body.LoginId)
            .input('LoginPassword', sql.VarChar(200), crypto.encrypt(req.body.LoginPassword))
            .input('FirstName', sql.VarChar(40), req.body.FirstName)
            .input('LastName', sql.VarChar(40), req.body.LastName)
            .input('EmailId', sql.VarChar(50), req.body.EmailId)
            .input('MobileNumber', sql.VarChar(30), req.body.MobileNumber)
            .input('AccountExpiredDate', sql.VarChar(20), req.body.AccountExpiredDate)
            .input('PlazaId', sql.Int, req.body.PlazaId)
            .input('UserTypeId', sql.Int, req.body.UserTypeId)
            .input('RoleId', sql.Int, req.body.RoleId)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, req.body.CreatedDate)
            .input('ModifiedDate', sql.DateTime, req.body.ModifiedDate)
            .execute('USP_UserInsertUpdate');
        await database.disconnect();
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'UserConfigurationSetUp');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UserConfigurationGetAll(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_UserGetAll');
        await database.disconnect();
        let dataarray = result.recordset;
        userMasterData = []
        for (let i = 0; i < dataarray.length; i++) {
            const element = dataarray[i];
            const out = CreateObjectForUserMaster(element);
            if (out != null)
                userMasterData.push(out)
        }
        let out = constants.ResponseMessage("success", userMasterData);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'UserConfigurationGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }

}

async function UserConfigurationGetById(req, res, next) {
    try {
        const userId = req.query.UserId | 0;
        result = await UserGetbyId(userId);
        if (result == null) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            if (result.recordset == []) {
                let out = constants.ResponseMessage("No data found", null);
                res.status(200).json(out);
            }
            else {
                const element = result.recordset[0];
                userMasterData = (CreateObjectForUserMaster(element))
                let out = constants.ResponseMessage("success", userMasterData);
                res.status(200).json(out);
            }
        }
    } catch (error) {
        errorlogMessage(error, 'UserConfigurationGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UserConfigurationGetByUserType(req, res, next) {
    try {
        const UserTypeId = req.query.UserTypeId | 0;
        const pool = await database.connect();
        result = await pool.request().input('UserTypeId', sql.Int, UserTypeId)
            .execute('USP_UserGetByUserTypeId');
        await database.disconnect();
        let dataarray = result.recordset;
        userMasterData = []
        for (let i = 0; i < dataarray.length; i++) {
            const element = dataarray[i];
            const out = CreateObjectForUserMaster(element);
            if (out != null)
                userMasterData.push(out)
        }
        let out = constants.ResponseMessage("success", userMasterData);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'UserConfigurationGetByUserType');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UserConfigurationGetBySystemUserType(req, res, next) {
    try {
        const UserTypeId = req.query.UserTypeId | 0;
        const SystemId = req.query.SystemId | 0;
        const pool = await database.connect();
        result = await pool.request().input('UserTypeId', sql.Int, UserTypeId)
            .input('SystemId', sql.Int, SystemId)
            .execute('USP_UserGetBySystemUserTypeId');
        await database.disconnect();
        let dataarray = result.recordset;
        userMasterData = []
        for (let i = 0; i < dataarray.length; i++) {
            const element = dataarray[i];
            const out = CreateObjectForUserMaster(element);
            if (out != null)
                userMasterData.push(out)
        }
        let out = constants.ResponseMessage("success", userMasterData);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'UserConfigurationGetBySystemUserType');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UserProfileChange(req, res, next) {
    try {
        const dir = './EventMedia/User/ProfileImage';
        const currentPath = path.resolve('./EventMedia');
        let FilePath = "\\User\\ProfileImage\\";
        FilePath = constants.SaveImage(req.body.UserProfileImage, currentPath + FilePath, constants.randomUUID(), ".png", dir);
        if (FilePath != "") {
            FilePath = FilePath.replace(currentPath, "");
            FilePath = FilePath.replaceAll("\\", "/");
            const pool = await database.connect();
            result = await pool.request().input('UserId', sql.Int, req.body.UserId)
                .input('UserProfileImage', sql.VarChar(200), FilePath)
                .execute('USP_UserProfileChange');
            await database.disconnect();
            let out = constants.ResponseMessage(result.recordset, null);
            res.status(200).json(out)
        }
        else {
            let out = constants.ResponseMessage("Error to save image", null);
            res.status(200).json(out)
        }
    } catch (error) {
        errorlogMessage(error, 'UserProfileChange');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UserGetbyId(userId) {
    try {
        const pool = await database.connect();
        result = await pool.request().input('UserId', sql.Int, userId)
            .execute('USP_UserGetbyId');
        await database.disconnect();
        return result;
    } catch (error) {
        errorlogMessage(error, 'UserGetbyId');
        return null;

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
    }
    catch (error) {
        errorlogMessage(error, 'CreateObjectForUserMaster');
        return null;
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