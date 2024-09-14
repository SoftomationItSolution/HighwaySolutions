const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/FasTagVehicleClassInsertUpdate', FasTagVehicleClassInsertUpdate);
router.post('/SystemVehicleClassInsertUpdate', SystemVehicleClassInsertUpdate);

router.get('/FasTagVehicleClassGetAll', FasTagVehicleClassGetAll);
router.get('/FasTagVehicleClassGetActive', FasTagVehicleClassGetActive);
router.get('/FasTagVehicleClassGetById', FasTagVehicleClassGetById);

router.get('/SystemVehicleClassGetAll', SystemVehicleClassGetAll);
router.get('/SystemVehicleClassGetActive', SystemVehicleClassGetActive);
router.get('/SystemVehicleClassGetById', SystemVehicleClassGetById);
module.exports = router;

async function FasTagVehicleClassInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('FasTagVehicleClassId', sql.Int, req.body.FasTagVehicleClassId)
            .input('FasTagVehicleClassName', sql.VarChar(100), req.body.FasTagVehicleClassName)
            .input('FasTagVehicleClassDescription', sql.VarChar(100), req.body.FasTagVehicleClassDescription)
            .input('PermissibleWeight', sql.Decimal, req.body.PermissibleWeight)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_FasTagVehicleClassInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'FasTagVehicleClassInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemVehicleClassInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('SystemVehicleClassId', sql.Int, req.body.SystemVehicleClassId)
            .input('AvcVehicleClassId', sql.Int, req.body.AvcVehicleClassId)
            .input('SystemVehicleClassName', sql.VarChar(100), req.body.SystemVehicleClassName)
            .input('SystemVehicleClassDescription', sql.VarChar(100), req.body.SystemVehicleClassDescription)
            .input('PermissibleWeight', sql.Decimal, req.body.PermissibleWeight)
            .input('SystemSubClassIds', sql.VarChar(4000), req.body.SystemSubClassIds)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_SystemVehicleClassInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemVehicleClassInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FasTagVehicleClassGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_FasTagVehicleClassGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'FasTagVehicleClassGetAll');
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

async function FasTagVehicleClassGetById(req, res, next) {
    try {
        const FasTagVehicleClassId = req.query.FasTagVehicleClassId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('FasTagVehicleClassId', sql.Int, FasTagVehicleClassId)
            .execute('USP_FasTagVehicleClassGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'FasTagVehicleClassGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function SystemVehicleClassGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_SystemVehicleClassGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'SystemVehicleClassGetAll');
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

async function SystemVehicleClassGetById(req, res, next) {
    try {
        const SystemVehicleClassId = req.query.SystemVehicleClassId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('SystemVehicleClassId', sql.Int, SystemVehicleClassId)
            .execute('USP_SystemVehicleClassGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'SystemVehicleClassGetById');
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

function pubData(out){
    try {
     if(out.Message[0].AlertMessage=='success'){
         let d={ "update": "class","data": JSON.parse(out.Message[0].AlertData)}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'SystemVehicleClassInsertUpdate_pubData');
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