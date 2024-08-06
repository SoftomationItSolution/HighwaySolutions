const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/LaneInsertUpdate', LaneInsertUpdate);
router.get('/LaneGetAll', LaneGetAll);
router.get('/LaneGetActive', LaneGetActive);
router.get('/LaneGetById', LaneGetById);
router.get('/LaneGetByPlazaId', LaneGetByPlazaId);
router.get('/LaneGetByIpAddress', LaneGetByIpAddress);
router.get('/LaneModeMasterGetAll', LaneModeMasterGetAll);
router.get('/LanePointMasterGetAll', LanePointMasterGetAll);
router.get('/LanePositionMasterGetAll', LanePositionMasterGetAll);
router.get('/LaneStatusMasterGetAll', LaneStatusMasterGetAll);
module.exports = router;

async function LaneInsertUpdate(req, res, next) {
    try {
        const pool = await database.getPool();
        const currentDateTime = new Date();
        result = await pool.request().input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('PlazaId', sql.SmallInt, req.body.PlazaId)
            .input('LaneName', sql.VarChar(10), req.body.LaneName)
            .input('LaneNumber', sql.SmallInt, req.body.LaneNumber)
            .input('LaneTypeId', sql.SmallInt, req.body.LaneTypeId)
            .input('LanePositionId', sql.SmallInt, req.body.LanePositionId)
            .input('LanePointId', sql.SmallInt, req.body.LanePointId)
            .input('LaneDirectionId', sql.SmallInt, req.body.LaneDirectionId)
            .input('LaneStatusId', sql.SmallInt, req.body.LaneStatusId)
            .input('LaneModeId', sql.SmallInt, req.body.LaneModeId)
            .input('LaneSystemIpAddress', sql.VarChar(20), req.body.LaneSystemIpAddress)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, currentDateTime)
            .input('ModifiedDate', sql.DateTime, currentDateTime)
            .execute('USP_LaneInsertUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneModeMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneModeMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneModeMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LanePointMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LanePointMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LanePointMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LanePositionMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LanePositionMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LanePositionMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneStatusMasterGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneStatusMasterGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneStatusMasterGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetById(req, res, next) {
    try {
        const LaneId = req.query.LaneId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('LaneId', sql.Int, LaneId)
            .execute('USP_LaneGetbyId');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'LaneGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetByPlazaId(req, res, next) {
    try {
        const PlazaId = req.query.PlazaId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('PlazaId', sql.Int, PlazaId)
            .execute('USP_LaneGetbyPlazaId');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'LaneGetByPlazaId');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetByIpAddress(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('LaneSystemIpAddress', sql.Int, req.query.IpAddress)
            .execute('USP_LaneGetbyIpAddress');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'LaneGetByIpAddress');
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
         let d={ "update": "lane","data": JSON.parse(out.Message[0].AlertData)}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'LaneInsertUpdate_pubData');
    }
 }