const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
router.post('/manufacturerInsertUpdate', ManufacturerInsertUpdate);

router.get('/manufacturerGetAll', ManufacturerGetAll);
router.get('/manufacturerGetActive', ManufacturerGetActive);
router.get('/manufacturerGetById', ManufacturerGetById);
module.exports = router;

async function ManufacturerInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('ManufacturerId', sql.Int, req.body.ManufacturerId)
            .input('Name', sql.VarChar(100), req.body.Name)
            .input('Address', sql.VarChar(255), req.body.Address)
            .input('EmailId', sql.VarChar(100), req.body.EmailId)
            .input('MobileNumber', sql.VarChar(20), req.body.MobileNumber)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_ManufacturerInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ManufacturerInsertUpdate');
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
async function ManufacturerGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ManufacturerGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ManufacturerGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ManufacturerGetById(req, res, next) {
    try {
        const ManufacturerId = req.query.ManufacturerId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('ManufacturerId', sql.Int, ManufacturerId)
            .execute('USP_ManufacturerGetbyId');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'ManufacturerGetById');
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