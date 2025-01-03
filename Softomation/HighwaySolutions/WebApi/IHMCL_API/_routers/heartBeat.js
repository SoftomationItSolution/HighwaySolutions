const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const path = require('path');
const database = require('../_helpers/dbSingleton');
const logger = require('../_helpers/logger');
const sql = require('mssql');
const xml2js = require('xml2js');
const { root_path } = require("../_helpers/constants");

router.post('/response-tollPlaza-heartbeat', heartBeat);



async function heartBeat(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                return res.status(400).send('Invalid XML data');
            }
            const head = result['etc:TollplazaHbeatResp'].Head;
            const messageId = head.$.msgId;

            const txn = result['etc:TollplazaHbeatResp'].Txn;
            const resp = txn.Resp;
            const errCode = resp.$.errCode
            const timestamp = resp.$.ts;
            const responseResult = constants.responseResultSMapping[resp.$.result];
            try {
                const dateFolder = constants.date_format_folder(timestamp);
                const saveDir = path.join(root_path, "Response", dateFolder);
                const filename = `heart_beat_${messageId}.xml`;
                constants.saveReceivedDataAsFile(xmlData, saveDir, filename);
            } catch (err) {
                errorlogMessage(err, 'heart_beat_savefile');
            }
            try {
                const pool = await database.getPool();
                result = await pool.request().input('MessageId', sql.VarChar(35), messageId)
                    .input('ResponseDateTime', sql.DateTimeOffset, timestamp)
                    .input('ErrorCode', sql.SmallInt, parseInt(errCode))
                    .input('ResponseResult', sql.SmallInt, responseResult)
                    .execute('USP_ICDRequestHeartBeatUpdateResponse');
            } catch (error) {
                errorlogMessage(error, 'heartBeat_saveinDB');
            }
            res.status(202).send();
        });

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