const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const path = require('path');
const database = require('../_helpers/dbSingleton');
const logger = require('../_helpers/logger');
const sql = require('mssql');
const xml2js = require('xml2js');
const { root_path } = require("../_helpers/constants");

// XML Parser configuration
const xmlParser = new xml2js.Parser({
    explicitArray: false,  // Prevent creating arrays for single elements
    trim: true,            // Trim whitespace
    explicitRoot: false,   // Don't keep root element
    mergeAttrs: true       // Merge attributes into parent object
});

router.post('/response-get-exception-list', exceptionList);
router.post('/response-query-exception-list', queryExceptionList);

function parseExceptionResponse(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }

            // Extract head and transaction details
            const head = result.Head || {};
            const txn = result.Txn || {};
            const resp = txn.Resp || {};
            const exception = resp.Exception || {};

            // Extract tag details
            const tags = (exception.Tag || []).map(tag => ({
                tagId: tag.tagId || ''
            }));

            // Return structured response
            const exceptionDetails = {
                version: head.ver || '',
                timestamp: head.ts || '',
                organizationId: head.orgId || '',
                messageId: head.msgId || '',

                transaction: {
                    transactionId: txn.id || '',
                    referenceId: txn.refId || '',
                    referenceUrl: txn.refUrl || '',
                    transactionTimestamp: txn.ts || '',
                    type: txn.type || '',
                    originalTransactionId: txn.orgTxnId || '',

                    response: {
                        responseTimestamp: resp.ts || '',
                        responseCode: resp.respCode || '',
                        result: resp.result || '',
                        successRequestCount: resp.successReqCnt || '',
                        totalRequestCount: resp.totReqCnt || '',
                        totalMessages: resp.totalMsg || '',
                        totalTagsInMessage: resp.totalTagsInMsg || '',
                        totalTagsInResponse: resp.totalTagsInResponse || ''
                    },
                    exception: {
                        description: exception.desc || '',
                        errorCode: exception.errCode || '',
                        exceptionCode: exception.excCode || '',
                        lastUpdatedTime: exception.lastupdatedTime || '',
                        priority: exception.priority || '',
                        result: exception.result || '',
                        totalTagCount: exception.totalTag || '',
                        tags: tags
                    }
                }
            };

            resolve(exceptionDetails);
        });
    });
}

async function exceptionList(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseExceptionResponse(xmlData);
        const filePath = await constants.saveReceivedDataAsFile(xmlData);
        console.log(`Data saved to: ${filePath}`);

        res.json({
            status: 'success',
            data: parsedDetails
        });
    } catch (error) {
        console.error('XML Parsing Error:', error);
        res.status(400).json({
            status: 'error',
            message: 'Invalid XML format',
            error: error.message
        });
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
            const responseResult = constants.responseResultSMapping[resp.$.result];
            try {
                const dateFolder = constants.date_format_folder(timestamp);
                const saveDir = path.join(root_path, "Response",dateFolder,"Query",messageId);
                const name = constants.getMessageId(10)
                const filename = `query_${name}.xml`;
                constants.saveReceivedDataAsFile(xmlData, saveDir, filename);
            } catch (err) {
                errorlogMessage(err, 'query_ExceptionList_savefile');
            }
            const exceptions = Array.isArray(resp.Exception) ? resp.Exception : [resp.Exception];

            exceptions.forEach(async (exception) => {
                const desc = exception.$.desc;
                const errCode = exception.$.errCode;
                const excCode = exception.$.excCode;
                const tag_result = constants.responseResultSMapping[exception.$.result];
                const tags = Array.isArray(exception.Tag) ? exception.Tag : [exception.Tag];
                const xmlData = {
                    Tags: {
                        Tag: tags.reduce((acc, tag) => {
                            acc.push({
                                TagStatus: tag.$.op === 'ADD' ? 1 : 0,
                                TagId: tag.$.tagId,
                                UpdatedTime: tag.$.updatedTime
                            });
                            return acc;
                        }, [])
                    }
                };
                const builder = new xml2js.Builder({ headless: true });
                const xmlString = builder.buildObject(xmlData);
                try {
                    const pool = await database.getPool();
                    result = await pool.request().input('XmlData', sql.Xml, xmlString)
                        .input('Type', sql.VarChar(35), desc)
                        .input('MessageId', sql.VarChar(35), messageId)
                        .input('ResponseDateTime', sql.DateTimeOffset, timestamp)
                        .input('RespCode', sql.SmallInt, parseInt(respCode))
                        .input('ResponseResult', sql.SmallInt, responseResult)
                        .input('ErrCode', sql.SmallInt, parseInt(errCode))
                        .input('ExcCode', sql.SmallInt, parseInt(excCode))
                        .input('Result', sql.SmallInt, tag_result)
                        .execute('USP_ICDTagStatusProcess');
                    //console.log(result.recordset)
                } catch (error) {
                    errorlogMessage(error, 'query_ExceptionList_saveinDB');
                }
            });
            res.status(202).send();
        });

    } catch (error) {
        errorlogMessage(error, 'queryExceptionList');
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