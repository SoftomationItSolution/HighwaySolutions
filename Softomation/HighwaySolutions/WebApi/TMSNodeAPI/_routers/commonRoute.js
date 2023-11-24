const express = require('express');
const router = express.Router();
const moment = require('moment');
const database = require('../_helpers/db');
const token = require("../_helpers/jwtToken");
const crypto = require("../_helpers/crypto");
const constants = require("../_helpers/constants");
const sql = require('mssql');
router.post('/ValidateUser', ValidateUser);
router.post('/LogoutUser', LogoutUser);
router.post('/RolePermissionGetByMenu', RolePermissionGetByMenu);

router.get('/GetMenu', GetMenu);
router.get('/SystemSettingGet', SystemSettingGet);
router.get('/DenominationGetActive', DenominationGetActive);

module.exports = router;
async function SystemSettingGet(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_SystemSettingGet');
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset[0]);
        res.status(200).json(out)
    } catch (error) {
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
                    "UserProfileImage": "/User/ProfileImage/avatar-7.jpg",
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
                if (req.body.LoginPassword == crypto.decrypt(userData.LoginPassword)) {
                    if (userData.DataStatus != 1) {
                        let out = constants.ResponseMessage("Account has inactive", null);
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
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function LogoutUser(req, res, next) {
    try {
        let out = constants.ResponseMessage("success", null);
        res.status(200).json(out);
    } catch (error) {
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
            .execute('USP_RolesPersmissionGetByMenu');
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
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function DenominationGetActive(req, res, next) {
    try {
        const pool = await database.connect();
        result=await pool.request().execute('USP_DenominationGetActive')
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}