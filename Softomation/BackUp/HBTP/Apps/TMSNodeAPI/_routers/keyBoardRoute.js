const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/KeyboardDetailUpdate', KeyboardDetailUpdate);
router.get('/KeyboardDetailGetAll', KeyboardDetailGetAll);
router.get('/KeyboardDetailGetActive', KeyboardDetailGetActive);

module.exports = router;

async function KeyboardDetailUpdate(req, res, next) {
    try {
        const jsonList = req.body; // JSON list from the request body
        const jsonString = JSON.stringify(jsonList); // Convert JSON to string
        
        // Create a pool connection to the database
        const pool = await database.getPool();

        // Execute the stored procedure with parameters
        const result = await pool.request()
            .input('ModifiedBy', sql.Int, jsonList[0].ModifiedBy) // Example: First item "ModifiedBy"
            .input('JsonList', sql.NVarChar(sql.MAX), jsonString)  // JSON string as NVARCHAR(MAX)
            .execute('USP_KeyboardDetailsUpdate'); // Stored procedure

        // Prepare the response
        let out = constants.ResponseMessageList(result.recordset, null);

        // Publish the data and respond
        pubData(out);
        res.status(200).json(out);

    } catch (error) {
        // Log the error
        errorlogMessage(error, 'KeyboardDetailUpdate');
        
        // Send error response
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}


async function KeyboardDetailGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_KeyboardDetailsGet');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'KeyboardDetailGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function KeyboardDetailGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_KeyboardDetailMasterGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'KeyboardDetailGetActive');
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
         let d={ "update": "KeyboardDetail","data": null}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'KeyboardDetailUpdate');
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
