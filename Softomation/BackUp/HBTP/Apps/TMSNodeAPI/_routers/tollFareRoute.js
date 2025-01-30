const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/TollFareSetUp', TollFareSetUp);

router.get('/TollFareGetByEffectedFrom', TollFareGetByEffectedFrom);


module.exports = router;

async function TollFareSetUp(req, res, next) {
    try {
        const currentDateTime = new Date();
        const pool = await database.getPool();
        result = await pool.request().input('EffectedFrom', sql.VarChar(20), req.body.EffectedFrom)
        .input('DataStatus', sql.Int, req.body.DataStatus)
        .input('CreatedBy', sql.Int, req.body.CreatedBy)
        .input('ModifiedBy', sql.Int, req.body.CreatedBy)
        .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
        .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
        .input('TollFare', sql.NVarChar(sql.MAX), JSON.stringify(req.body.TollFareConfigurations))
        .execute('USP_TollFareSetup');
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out) 
    } catch (error) {
        errorlogMessage(error, 'TollFareSetUp');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function TollFareGetByEffectedFrom(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('EffectedFrom', sql.VarChar(20), req.query.EffectedFrom)
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
            //result.recordsets[0].TollFareConfigurations=result.recordsets[1];
            let out = constants.ResponseMessage("success", ResponseData);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'TollFareGetByEffectedFrom');
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
         let d={ "update": "fare","data": JSON.parse(out.Message[0].AlertData)}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'TollFareSetUp_pubData');
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