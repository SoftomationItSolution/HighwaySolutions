const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');

router.get('/FasTagRequestCode', FasTagRequestCode);
router.get('/FasTagGetByStatus', FasTagGetByStatus);
router.get('/FasTagProcessedGetLatest', FasTagProcessedGetLatest);


module.exports = router;

async function FasTagRequestCode(req, res, next) {
    try {
        const pool = await database.getPool();
        const result = await pool.request().execute('USP_ICDCodeListGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'FasTagRequestCode');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}



async function FasTagGetByStatus(req, res, next) {
    try {
        const RequestStatusId = req.query.RequestStatusId | 0;
        const pool = await database.getPool();
        const result = await pool.request().input('RequestStatusId', sql.SmallInt, RequestStatusId).execute('USP_FasTagGetByStatus');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'FasTagGetByStatus');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FasTagProcessedGetLatest(req, res, next) {
    try {
        const pool = await database.getPool();
        const result = await pool.request().execute('USP_FasTagProcessedGetLatest');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'FasTagProcessedGetLatest');
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