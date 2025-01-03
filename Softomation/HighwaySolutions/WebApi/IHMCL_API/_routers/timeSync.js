const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const path = require('path');
const database = require('../_helpers/dbSingleton');
const logger = require('../_helpers/logger');
const sql = require('mssql');
const xml2js = require('xml2js');
const { icd_path } = require("../_helpers/constants");
router.post('/response-sync-time', responseTime);



async function responseTime(req, res) {
    try {
        const xmlData = req.body;
        const isSignatureValid = constants.validateXmlSignature(xmlData);
        if (isSignatureValid) {
            xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
                if (err) {
                    return res.status(400).send('Invalid XML data');
                }
                const head = result['etc:RespSyncTime'].Head;
                const messageId = head.$.msgId;
                const resp = result['etc:RespSyncTime'].Resp;
                const respCode = resp.$.respCode;
                const timestamp = resp.$.ts;
                const responseResult = constants.responseResultSMapping[resp.$.result];
                if (timestamp == 1) {
                    const serverTime = resp.Time.$.serverTime;
                }
                else {
                    const serverTime = null;
                }
                try {
                    const dateFolder = date_format_folder(timestamp);
                    const saveDir = path.join(icd_path, dateFolder);
                    const filename = `sync_time_${msgId}.xml`;
                    constants.saveReceivedDataAsFile(xmlData, saveDir, filename);
                } catch (err) {
                    errorlogMessage(err, 'sync-time_savefile');
                }

                try {
                    const pool = await database.getPool();

                    result = await pool.request().input('MessageId', sql.VarChar(35), messageId)
                        .input('ResponseDateTime', sql.DateTime, timestamp)
                        .input('ResponseCode', sql.SmallInt, parseInt(respCode))
                        .input('ResponseResult', sql.SmallInt, responseResult)
                        .input('BankServerDateTime', sql.DateTime, serverTime)
                        .execute('USP_ICDRequestSyncTimeUpdateResponse');
                    //let out = constants.ResponseMessageList(result.recordset, null);
                } catch (error) {
                    errorlogMessage(error, 'responsePay_saveinDB');
                }
                res.status(202).send();
            });
        }
        else {
            res.status(417).send();
        }
    } catch (error) {
        errorlogMessage(error, 'response-sync-time');
        res.status(417).send('Expectation Failed');
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

module.exports = router;