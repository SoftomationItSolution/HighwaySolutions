const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');

router.get('/DashboardGetData', DashboardGetData);

module.exports = router;

async function DashboardGetData(req, res, next) {
    try {
        const pool = await database.getPool();
        const result = await pool.request().execute('USP_DashboardGetData');
        
        let out = constants.ResponseMessage("success", result.recordsets);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'DashboardGetData');
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