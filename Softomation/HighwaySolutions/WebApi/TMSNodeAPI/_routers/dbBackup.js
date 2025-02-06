const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
router.post('/FileUploadDetailInsertUpdate', FileUploadDetailInsertUpdate);
router.get('/FileUploadDetailGetAll', FileUploadDetailGetAll);
router.get('/FileUploadDetailGetById', FileUploadDetailGetById);
router.post('/DBBackUpDetailInsertUpdate', DBBackUpDetailInsertUpdate);
router.get('/DBBackUpDetailGetAll', DBBackUpDetailGetAll);
router.get('/DBBackUpDetailGetById', DBBackUpDetailGetById);

module.exports = router;


async function FileUploadDetailInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('FileUploadDetailId', sql.SmallInt, req.body.FileUploadDetailId)
            .input('UploaderTypeId', sql.SmallInt, req.body.UploaderTypeId)
            .input('LocalPath', sql.VarChar(255), req.body.LocalPath)
            .input('RemotePath', sql.VarChar(255), req.body.RemotePath)
            .input('ServerUrl', sql.VarChar(255), req.body.ServerUrl)
            .input('ServerPort', sql.Int, req.body.ServerPort)
            .input('Username', sql.VarChar(255), req.body.Username)
            .input('Password', sql.VarChar(255), req.body.Password)
            .input('ScheduleHours', sql.SmallInt, req.body.ScheduleHours)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTimeOffset, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTimeOffset, date_time_format(currentDateTime))
            .execute('USP_FileUploadDetailInsertUpdate');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'FileUploadDetailInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FileUploadDetailGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_FileUploadDetailGetAll');
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'FileUploadDetailGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FileUploadDetailGetById(req, res, next) {
    try {
        const FileUploadDetailId = req.query.FileUploadDetailId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('FileUploadDetailId', sql.SmallInt, FileUploadDetailId)
            .execute('USP_FileUploadDetailGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'FileUploadDetailGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function DBBackUpDetailInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('DBBackUpDetailId', sql.SmallInt, req.body.DBBackUpDetailId)
            .input('HostName', sql.VarChar(255), req.body.HostName)
            .input('HostPort', sql.Int, req.body.HostPort)
            .input('LoginId', sql.VarChar(100), req.body.LoginId)
            .input('LoginPassword', sql.VarChar(100), req.body.LoginPassword)
            .input('DataBaseName', sql.VarChar(50), req.body.DataBaseName)
            .input('DataBaseTypeId', sql.SmallInt, req.body.DataBaseTypeId)
            .input('BackUpPreFix', sql.VarChar(50), req.body.BackUpPreFix)
            .input('DataStatus', sql.SmallInt, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_DBBackUpDetailInsertUpdate');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'DBBackUpDetailInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function DBBackUpDetailGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_DBBackUpDetailGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'DBBackUpDetailGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function DBBackUpDetailGetById(req, res, next) {
    try {
        const DBBackUpDetailId = req.query.DBBackUpDetailId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('DBBackUpDetailId', sql.SmallInt, DBBackUpDetailId)
            .execute('USP_DBBackUpDetailGetById');
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'DBBackUpDetailGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
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