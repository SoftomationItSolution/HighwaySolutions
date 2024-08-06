const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/ExemptTypeUpdate', ExemptTypeUpdate);

router.get('/ExemptTypeGetAll', ExemptTypeGetAll);
router.get('/ExemptTypeGetActive', ExemptTypeGetActive);

module.exports = router;

async function ExemptTypeUpdate(req, res, next) {
    try {
        const SessionId = constants.RandonString(10)
        const array = req.body;
        const table = new sql.Table('temp_ExemptTypeMaster');
        table.create = true;
        table.columns.add('ExemptTypeId', sql.SmallInt, { nullable: false });
        table.columns.add('DataStatus', sql.SmallInt, { nullable: false });
        table.columns.add('SessionId', sql.VarChar(20), { nullable: false });
        for (let i = 0; i < array.length; i++) {
            table.rows.add(
                parseInt(array[i].ExemptTypeId),
                parseInt(array[i].DataStatus),
                SessionId);
        }
        const pool = await database.getPool();
        const resultU = await pool.request().bulk(table);
        result = await pool.request().input('SessionId', sql.VarChar(20), SessionId)
            .input('CreatedBy', sql.Int, array[0].CreatedBy)
            .input('ModifiedBy', sql.Int, array[0].CreatedBy)
            .input('CreatedDate', sql.DateTime, array[0].CreatedDate)
            .input('ModifiedDate', sql.DateTime, array[0].ModifiedDate)
            .execute('USP_ExemptTypeUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ExemptTypeUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ExemptTypeGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ExemptTypeMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ExemptTypeGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ExemptTypeGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ExemptTypeMasterGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ExemptTypeGetActive');
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
         let d={ "update": "exemptType","data": null}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'ExemptTypeUpdate');
    }
 }