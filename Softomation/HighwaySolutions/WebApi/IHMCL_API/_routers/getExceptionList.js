const express = require('express');
const constants = require("../_helpers/constants");
const xml2js = require('xml2js');
const router = express.Router();

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

function parseQueryExceptionResponse(xmlData) {
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
                tagId: tag.tagId || '',
                operation: tag.op || '',
                updatedTime: tag.updatedTime || ''
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

async function queryExceptionList(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseQueryExceptionResponse(xmlData);
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

module.exports = router;