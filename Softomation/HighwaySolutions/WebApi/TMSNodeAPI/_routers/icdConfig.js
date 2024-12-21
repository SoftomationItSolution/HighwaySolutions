const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const path = require('path');
const fs = require('fs');
const sql = require('mssql');
const {
    root_path,
    icd_path
} = require("../_helpers/constants");
const e = require('express');
const icd_Directory = path.join(root_path, icd_path);
router.get('/IcdPlazaGetAll', IcdPlazaGetAll);
router.post('/UpdateIcdConfig', UpdateIcdConfig);
module.exports = router;

async function IcdPlazaGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDPlazaGetAll');
        fs.readFile(icd_Directory, 'utf8', (err, data) => {
            if (err) {
                errorlogMessage(err, 'ICD Read File');
                let out = constants.ResponseMessage(err.message, null);
                res.status(500).json(out)
            }
            try {
                const jsonData = JSON.parse(data);
                data = {
                    "PlazaList": result.recordset,
                    "UATList": jsonData.UatApiDetails,
                    "ProdList": jsonData.ProdApiDetails,
                }
                let out = constants.ResponseMessage("success", data);
                res.status(200).json(out)
            } catch (err) {
                errorlogMessage(err, 'ICD parsing File');
                let out = constants.ResponseMessage(err.message, null);
                res.status(500).json(out)
            }
        });

    } catch (error) {
        errorlogMessage(error, 'IcdPlazaGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UpdateIcdConfig(req, res, next) {
    try {
        const reciveData = req.body;
        const pool = await database.getPool();
        const currentDateTime = new Date();
        const plaza = reciveData.PlazaDetail;
        result = await pool.request().input('PlazaId', sql.Int, plaza.PlazaId)
            .input('PlazaType', sql.VarChar(50), plaza.PlazaType)
            .input('PlazaSubType', sql.VarChar(50), plaza.PlazaSubType)
            .input('PlazaZoneId', sql.VarChar(50), plaza.PlazaZoneId)
            .input('PlazaAgencyCode', sql.VarChar(100), "")//plaza.PlazaAgencyCode
            .input('PlazaAcquirerId', sql.Int, 0)//plaza.PlazaAcquirerId
            .input('OrganizationId', sql.VarChar(4), plaza.OrganizationId)
            .input('IsProducation', sql.Bit, plaza.IsProducation)
            .input('CertificateName', sql.VarChar(250), plaza.CertificateName)
            .input('CertificatePassword', sql.VarChar(250), plaza.CertificatePassword)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('CreatedBy', sql.Int, plaza.CreatedBy)
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedBy', sql.Int, plaza.CreatedBy)
            .execute('USP_ICDPlazaInsertUpdate');
        const plazaresult = result.recordset[0].AlertMessage;
        if (plazaresult == "success") {
            fs.readFile(icd_Directory, 'utf8', (err, data) => {
                if (err) {
                    errorlogMessage(err, 'IcdConfiguration Read File');
                    let out = constants.ResponseMessage(err.message, null);
                    res.status(500).json(out)
                }
                try {
                    const jsonData = JSON.parse(data);
                    const updatedData = {
                        UatApiDetails: reciveData.UATDetail,
                        ProdApiDetails: reciveData.ProdDetail,
                    }
                    Object.assign(jsonData, updatedData);
                    fs.writeFile(icd_Directory, JSON.stringify(jsonData, null, 2), 'utf8', (err) => {
                        if (err) {
                            errorlogMessage(err, 'IcdConfiguration write File');
                            let out = constants.ResponseMessage(err.message, null);
                            res.status(500).json(out)
                        }
                        let out = constants.ResponseMessage("success", null);
                        res.status(200).json(out);
                    });
                } catch (err) {
                    errorlogMessage(err, 'IcdConfiguration parsing File');
                    let out = constants.ResponseMessage(err.message, null);
                    res.status(500).json(out)
                }
            });
        }
        else{
             let out = constants.ResponseMessageList(result.recordset, null);
             res.status(200).json(out)
        }
    } catch (error) {
        errorlogMessage(error, 'UpdateIcdConfig');
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
function date_time_format(in_dateTime) {
    try {
        if (!moment(in_dateTime).isValid()) {
            throw new Error('Invalid date-time format');
        }
        return momentTz.tz(in_dateTime, 'Asia/Kolkata').format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}