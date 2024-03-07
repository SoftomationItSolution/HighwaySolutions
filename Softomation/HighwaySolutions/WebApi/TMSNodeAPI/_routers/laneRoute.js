const express = require('express');
const router = express.Router();
const database = require('../_helpers/db');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');

router.post('/LaneInsertUpdate', LaneInsertUpdate);

router.get('/LaneGetAll', LaneGetAll);
router.get('/LaneGetActive', LaneGetActive);
router.get('/LaneGetById', LaneGetById);
router.get('/LaneGetByPlazaId', LaneGetByPlazaId);
router.get('/LaneGetByIpAddress', LaneGetByIpAddress);
module.exports = router;

async function LaneInsertUpdate(req, res, next) {
    try {
        const pool = await database.connect();
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
        await database.disconnect();
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneInsertUpdate');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneGetAll(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_LaneGetAll');
        await database.disconnect();
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
        const pool = await database.connect();
        result = await pool.request().execute('USP_LaneGetActive');
        await database.disconnect();
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
        const pool = await database.connect();
        result = await pool.request().input('LaneId', sql.Int, LaneId)
            .execute('USP_LaneGetbyId');
        await database.disconnect();
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
        const pool = await database.connect();
        result = await pool.request().input('PlazaId', sql.Int, PlazaId)
            .execute('USP_LaneGetbyPlazaId');
        await database.disconnect();
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
        const pool = await database.connect();
        result = await pool.request().input('LaneSystemIpAddress', sql.Int, req.query.IpAddress)
            .execute('USP_LaneGetbyIpAddress');
        await database.disconnect();
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