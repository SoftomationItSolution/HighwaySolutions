const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/EquipmentDetailsInsertUpdate', EquipmentDetailsInsertUpdate);

router.get('/EquipmentDetailsGetAll', EquipmentDetailsGetAll);
router.get('/EquipmentDetailsGetActive', EquipmentDetailsGetActive);
router.get('/EquipmentDetailsGetById', EquipmentDetailsGetById);
router.get('/EquipmentTypeGetActive', EquipmentTypeGetActive);
router.get('/EquipmentDetailsByLaneId', EquipmentDetailsGetByLane);
module.exports = router;

async function EquipmentDetailsInsertUpdate(req, res, next) {
    try {
        const currentDateTime = new Date();
        const pool = await database.getPool();
        result = await pool.request().input('EquipmentId', sql.BigInt, req.body.EquipmentId)
            .input('PlazaId', sql.Int, req.body.PlazaId)
            .input('LaneId', sql.Int, req.body.LaneId)
            .input('EquipmentTypeId', sql.Int, req.body.EquipmentTypeId)
            .input('ProtocolTypeId', sql.Int, req.body.ProtocolTypeId)
            .input('EquipmentName', sql.VarChar(200), req.body.EquipmentName)
            .input('IpAddress', sql.VarChar(20), req.body.IpAddress)
            .input('PortNumber', sql.Int, req.body.PortNumber)
            .input('LoginId', sql.VarChar(50), req.body.LoginId)
            .input('LoginPassword', sql.VarChar(50), req.body.LoginPassword)
            .input('MacAddress', sql.VarChar(100), req.body.MacAddress)
            .input('SerialNumber', sql.VarChar(100), req.body.SerialNumber)
            .input('ModelNumber', sql.VarChar(100), req.body.ModelNumber)
            .input('ManufacturerId', sql.SmallInt, req.body.ManufacturerId)
            .input('ManufacturerDate', sql.VarChar(20), req.body.ManufacturerDate)
            .input('PurchageDate', sql.VarChar(20), req.body.PurchageDate)
            .input('WarrantyExpireDate', sql.VarChar(20), req.body.WarrantyExpireDate)
            .input('UrlAddress', sql.VarChar(255), req.body.UrlAddress)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.ModifiedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_EquipmentDetailsInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'EquipmentDetailsInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function EquipmentDetailsGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_EquipmentDetailsGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'EquipmentDetailsGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function EquipmentDetailsGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_EquipmentDetailsGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'EquipmentDetailsGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function EquipmentDetailsGetById(req, res, next) {
    try {
        const EquipmentId = req.query.EquipmentId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('EquipmentId', sql.Int, EquipmentId)
            .execute('USP_EquipmentDetailsGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'EquipmentDetailsGetById');
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
         let d={ "update": "equipment","data": JSON.parse(out.Message[0].AlertData)}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'EquipmentDetailsInsertUpdate_pubData');
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
