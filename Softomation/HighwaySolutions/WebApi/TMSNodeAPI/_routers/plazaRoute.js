const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/PlazaInsertUpdate', PlazaInsertUpdate);

router.get('/PlazaGetAll', PlazaGetAll);
router.get('/PlazaGetActive', PlazaGetActive);
router.get('/PlazaGetById', PlazaGetById);
module.exports = router;

async function PlazaInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('PlazaId', sql.Int, req.body.PlazaId)
            .input('SystemIntegratorId', sql.Int, req.body.SystemIntegratorId)
            .input('PlazaName', sql.VarChar(100), req.body.PlazaName)
            .input('PlazaServerIpAddress', sql.VarChar(20), req.body.PlazaServerIpAddress)
            .input('ChainageNumber', sql.Decimal, req.body.ChainageNumber)
            .input('Latitude', sql.Decimal(8,6), req.body.Latitude)
            .input('Longitude', sql.Decimal(9,6), req.body.Longitude)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .execute('USP_PlazaInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'PlazaInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function PlazaGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_PlazaGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'PlazaGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}
async function PlazaGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_PlazaGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'PlazaGetActive');
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
         let d={ "update": "plaza","data": JSON.parse(out.Message[0].AlertData)}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'PlazaInsertUpdate_pubData');
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