const express = require('express');
const router = express.Router();
const database = require('../_helpers/db');
const constants = require("../_helpers/constants");
const sql = require('mssql');

router.get('/ShiftTiminingAll', ShiftTiminingGetAll);
router.get('/ShiftTiminingGetActive', ShiftTiminingGetActive);
router.get('/ShiftTiminingGetById', ShiftTiminingGetById);
router.get('/ShiftTiminingGetByDateTime', ShiftTiminingGetByDateTime);

module.exports = router;

async function ShiftTiminingGetAll(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_ShiftTiminingGetAll');
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetActive(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().execute('USP_ShiftTiminingGetActive');
        await database.disconnect();
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out);
    } catch (error) {
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetById(req, res, next) {
    try {
        const ShiftId = req.query.ShiftId | 0;
        const pool = await database.connect();
        result = await pool.request().input('ShiftId', sql.Int, ShiftId)
            .execute('USP_ShiftTiminingGetById');
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
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ShiftTiminingGetByDateTime(req, res, next) {
    try {
        const pool = await database.connect();
        result = await pool.request().input('ShiftDateTime', sql.VarChar(50), req.query.ShiftDateTime)
            .execute('USP_ShiftGetByDateTime');
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
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}