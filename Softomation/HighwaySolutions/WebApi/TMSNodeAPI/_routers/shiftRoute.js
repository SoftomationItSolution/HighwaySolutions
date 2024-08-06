const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');

router.get('/ShiftTiminingAll', ShiftTiminingGetAll);
router.get('/ShiftTiminingGetActive', ShiftTiminingGetActive);
router.get('/ShiftTiminingGetById', ShiftTiminingGetById);
router.get('/ShiftTiminingGetByDateTime', ShiftTiminingGetByDateTime);
router.get('/ShiftStatusGetAll', ShiftStatusGetAll);
router.get('/ShiftStatusGetOpen', ShiftStatusGetOpen);
router.get('/ShiftStatusGetClose', ShiftStatusGetClose);

module.exports = router;

async function ShiftTiminingGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ShiftTiminingGetAll');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ShiftTiminingGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetActive(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ShiftTiminingGetActive');
        
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ShiftTiminingGetActive');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetById(req, res, next) {
    try {
        const ShiftId = req.query.ShiftId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('ShiftId', sql.Int, ShiftId)
            .execute('USP_ShiftTiminingGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'ShiftTiminingGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetByDateTime(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('ShiftDateTime', sql.VarChar(50), req.query.ShiftDateTime)
            .execute('USP_ShiftGetByDateTime');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let out = constants.ResponseMessage("success", result.recordset[0]);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'ShiftTiminingGetByDateTime');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftStatusGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ShiftStatusGetAll');
        
        var dataresult = [];
        let dataarray = result.recordset;
        for (let index = 0; index < dataarray.length; index++) {
            dataresult.push(ShiftStatusGetdata(dataarray[index]));
        }
        let out = constants.ResponseMessage("success", dataresult);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ShiftStatusGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftStatusGetOpen(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ShiftStatusGetOpen');
        

        var dataresult = [];
        let dataarray = result.recordset;
        for (let index = 0; index < dataarray.length; index++) {
            dataresult.push(ShiftStatusGetdata(dataarray[index]));
        }
        let out = constants.ResponseMessage("success", dataresult);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ShiftStatusGetOpen');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftStatusGetClose(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ShiftStatusGetClose');
        
        var dataresult = [];
        let dataarray = result.recordset;
        for (let index = 0; index < dataarray.length; index++) {
            dataresult.push(ShiftStatusGetdata(dataarray[index]));
        }
        let out = constants.ResponseMessage("success", dataresult);
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'ShiftStatusGetClose');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

function ShiftStatusGetdata(dataarray) {
    try {
        const data = {
            ShiftStatusId: dataarray.ShiftStatusId,
            PlazaId: dataarray.PlazaId,
            PlazaName: dataarray.PlazaName,
            ShiftId: dataarray.ShiftId,
            ShiftNumber: "Shift-" + dataarray.ShiftId,
            StartTimmng: dataarray.StartTimmng,
            EndTimming: dataarray.EndTimming,
            ShiftDate: dataarray.ShiftDate,
            ShiftDateStamp: moment(dataarray.ShiftDate).format('DD-MMM-YYYY HH:mm:ss'),
            ShiftStatus: dataarray.ShiftStatus,
            LaneTransactionCount: dataarray.LaneTransactionCount,
            FloatDeclare: dataarray.FloatDeclare,
            MidDeclare: dataarray.MidDeclare,
            EndDeclare: dataarray.EndDeclare,
            SystemDeclare: dataarray.SystemDeclare,
            DifferenceAmount: dataarray.DifferenceAmount,
            DataStatus: dataarray.DataStatus,
            CreatedDate: dataarray.CreatedDate,
            CreatedBy: dataarray.CreatedBy,
            ModifiedDate: dataarray.ModifiedDate,
            ModifiedBy: dataarray.ModifiedBy
        }
        return data;
    } catch (error) {
        throw error;
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