const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const sql = require('mssql');
const xml2js = require('xml2js');


router.post('/response-tollPlaza-heartbeat', heartBeat);

async function heartBeat(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                constants.errorlogMessage(error, 'HeartBeat:InvaildXML');
                return res.status(400).send('Invalid XML data');
            }
            const head = result['etc:TollplazaHbeatResp'].Head;
            const messageId = head.$.msgId;

            const txn = result['etc:TollplazaHbeatResp'].Txn;
            const resp = txn.Resp;
            const errCode = resp.$.errCode
            const timestamp = resp.$.ts;
            const responseResult = constants.responseResultSMapping[resp.$.result];
            constants.save_response_file_msgId(xmlData,timestamp, "HeartBeat", messageId, "HeartBeat")
            try {
                const pool = await database.getPool();
                dataresult = await pool.request().input('MessageId', sql.VarChar(35), messageId)
                    .input('ResponseDateTime', sql.DateTimeOffset, timestamp)
                    .input('ErrorCode', sql.SmallInt, parseInt(errCode))
                    .input('ResponseResult', sql.SmallInt, responseResult)
                    .execute('USP_ICDRequestHeartBeatUpdateResponse');
            } catch (error) {
                constants.errorlogMessage(error, 'HeartBeat:SaveDB');
            }
            res.status(202).send();
        });

    } catch (error) {
        constants.errorlogMessage(error, 'HeartBeat:ResponseProcess');
        res.status(417).send('Expectation Failed');
    }
}



module.exports = router;