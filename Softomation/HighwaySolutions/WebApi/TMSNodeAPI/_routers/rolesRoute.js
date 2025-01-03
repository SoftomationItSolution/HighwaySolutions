const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');

router.post('/RoleConfigurationSetUp', RoleConfigurationSetUp);
router.post('/RolePermissionSetup', RolePermissionSetup);
router.get('/RoleConfigurationGetAll', RoleConfigurationGetAll);
router.get('/RoleConfigurationGetActive', RoleConfigurationGetActive);
router.get('/RoleConfigurationGetById', RoleConfigurationGetById);
router.get('/RolePermissionGetByRoleId', RolePermissionGetByRoleId);


module.exports = router;
async function RoleConfigurationSetUp(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        const result = await pool.request().input('RoleId', sql.Int, req.body.RoleId)
            .input('RoleName', sql.VarChar(200), req.body.RoleName)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_RoleInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'RoleConfigurationSetUp');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function RolePermissionSetup(req, res, next) {
    try {
        const SessionId = constants.RandonString(10)
        const array = req.body.RolePermission;
        const table = new sql.Table('temp_ImportPermission');
        table.create = true; // If the table doesn't exist, create it
        table.columns.add('MenuId', sql.SmallInt, { nullable: false });
        table.columns.add('DataView', sql.SmallInt, { nullable: false });
        table.columns.add('DataAdd', sql.SmallInt, { nullable: false });
        table.columns.add('DataUpdate', sql.SmallInt, { nullable: false });
        table.columns.add('SessionId', sql.VarChar(20), { nullable: false });
        for (let i = 0; i < array.length; i++) {
            table.rows.add(parseInt(array[i].MenuId), array[i].DataView, array[i].DataAdd, array[i].DataUpdate, SessionId);
        }
        const pool = await database.getPool();
        const resultU = await pool.request().bulk(table);
        const currentDateTime = new Date();
        const result = await pool.request().input('SessionId', sql.VarChar(200), SessionId)
            .input('RoleId', sql.Int, req.body.RoleId)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_RolePermissionInsertUpdate');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'RolePermissionSetup');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function RoleConfigurationGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        const result = await pool.request().execute('USP_RolesGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'RoleConfigurationGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function RoleConfigurationGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        const result = await pool.request().execute('USP_RolesGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'RoleConfigurationGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function RoleConfigurationGetById(req, res, next) {
    try {
        const RoleId = req.query.RoleId | 0;
        const pool = await database.getPool();
        const result = await pool.request().input('RoleId', sql.Int, RoleId).execute('USP_RolesGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("unauthorized", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'RoleConfigurationGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function RolePermissionGetByRoleId(req, res, next) {
    try {
        const RoleId = req.query.RoleId | 0;
        const pool = await database.getPool();
        const result = await pool.request().input('RoleId', sql.Int, RoleId).execute('USP_RolesPermissionGetByRoleId');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'RolePermissionGetByRoleId');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
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

function date_time_format(in_dateTime) {
    try {
        if (!moment(in_dateTime).isValid()) {
            throw new Error('Invalid date-time format');
        }
        return momentTz.tz(in_dateTime,'Asia/Kolkata').format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}