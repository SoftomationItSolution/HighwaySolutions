const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const sql = require('mssql');
const xml2js = require('xml2js');
router.post('/response-get-exception-list', exceptionList);
router.post('/response-query-exception-list', queryExceptionList);

async function exceptionList(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                return res.status(400).send('Invalid XML data');
            }
            const head = result['etc:RespGetExceptionList'].Head;
            const messageId = head.$.msgId;
            const txn = result['etc:RespGetExceptionList'].Txn;
            const resp = txn.Resp;
            const timestamp = resp.$.ts;
            constants.save_response_file(xmlData,timestamp, "FetchException", messageId, "exceptionList")

            const respCode = resp.$.respCode
            const responseResult = constants.responseResultSMapping[resp.$.result];
            res.status(202).send();
        });

    } catch (error) {
        constants.errorlogMessage(error, 'exceptionList');
        res.status(417).send('Expectation Failed');
    }
}

async function queryExceptionList(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                return res.status(400).send('Invalid XML data');
            }
            const head = result['etc:RespQueryExceptionList'].Head;
            const messageId = head.$.msgId;
            const txn = result['etc:RespQueryExceptionList'].Txn;
            const resp = txn.Resp;
            const respCode = resp.$.respCode
            const timestamp = resp.$.ts;
            constants.save_response_file(xmlData,timestamp, "Query", messageId, "QueryExceptionList")
            const responseResult = constants.responseResultSMapping[resp.$.result];
            const exceptions = Array.isArray(resp.Exception) ? resp.Exception : [resp.Exception];
            exceptions.forEach(async (exception) => {
                try {
                    if (exception != undefined) {
                        const desc = exception.$.desc;
                        const errCode = exception.$.errCode;
                        const excCode = exception.$.excCode;
                        const tag_result = constants.responseResultSMapping[exception.$.result];
                        const tags = Array.isArray(exception.Tag) ? exception.Tag : [exception.Tag];
                        const PostxmlData = {
                            Tags: {
                                Tag: tags.reduce((acc, tag) => {
                                    if (tag != undefined) {
                                        acc.push({
                                            TagStatus: tag.$.op === 'ADD' ? 1 : 0,
                                            TagId: tag.$.tagId,
                                            UpdatedTime: tag.$.updatedTime
                                        });
                                    }
                                    return acc;
                                }, [])
                            }
                        };
                        const builder = new xml2js.Builder({ headless: true });
                        const xmlString = builder.buildObject(PostxmlData);
                        try {
                            const pool = await database.getPool();
                            dataresult = await pool.request().input('XmlData', sql.Xml, xmlString)
                                .input('Type', sql.VarChar(35), excCode)
                                .input('MessageId', sql.VarChar(35), messageId)
                                .input('ResponseDateTime', sql.DateTimeOffset, timestamp)
                                .input('RespCode', sql.SmallInt, parseInt(respCode))
                                .input('ResponseResult', sql.SmallInt, responseResult)
                                .input('ErrCode', sql.SmallInt, parseInt(errCode))
                                .input('ExcCode', sql.SmallInt, parseInt(excCode))
                                .input('Result', sql.SmallInt, tag_result)
                                .execute('USP_ICDTagStatusProcess');
                            console.log(dataresult.recordset[0].AlertMessage);
                        } catch (error) {
                            constants.errorlogMessage(error, 'queryExceptionList:SaveDB');
                        }
                    }
                } catch (error) {
                    constants.errorlogMessage(error, 'queryExceptionList:ResponseProcess');
                }
            });
            res.status(202).send();
        });

    } catch (error) {
        constants.errorlogMessage(error, 'queryExceptionList');
        res.status(417).send('Expectation Failed');
    }
}
module.exports = router;