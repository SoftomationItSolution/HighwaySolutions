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
router.post('/response-pay', responsePay);
router.post('/response-violation-result', responseViolationResult);

function parseResponsePay(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }
            const head = result.Head || {};
            const txn = result.Txn || {};
            const entryTxn = txn.EntryTxn || {};
            const resp = result.Resp || {};
            const vehicleDetails = resp.Vehicle?.VehicleDetails || {};
            const responsePayDetails = {
                messageId: head.msgId || '',
                organizationId: head.orgId || '',
                timestamp: head.ts || '',
                version: head.ver || '',

                transaction: {
                    id: txn.id || '',
                    note: txn.note || '',
                    originTransactionId: txn.orgTxnId || '',
                    referenceId: txn.refId || '',
                    referenceUrl: txn.refUrl || '',
                    transactionTimestamp: txn.ts || '',
                    transactionType: txn.type || '',
                    transactionLiability: txn.txnLiability || '',

                    // Entry Transaction Details
                    entryTransaction: {
                        id: entryTxn.id || '',
                        timestampRead: entryTxn.tsRead || '',
                        timestamp: entryTxn.ts || '',
                        type: entryTxn.type || ''
                    }
                },

                // Response Details
                response: {
                    plazaId: resp.plazaId || '',
                    responseCode: resp.respCode || '',
                    result: resp.result || '',
                    timestamp: resp.ts || '',
                    fareType: resp.FareType || '',

                    // Reference Details
                    reference: {
                        tollFare: resp.Ref?.TollFare || '',
                        approvalNumber: resp.Ref?.approvalNum || '',
                        errorCode: resp.Ref?.errCode || '',
                        settlementCurrency: resp.Ref?.settCurrency || ''
                    },

                    // Vehicle Details
                    vehicle: {
                        transactionId: resp.Vehicle?.TID || '',
                        tagId: resp.Vehicle?.tagId || '',
                        details: ensureArray(resp.Vehicle?.VehicleDetails?.Detail).reduce((acc, detail) => {
                            if (detail.name && detail.value) {
                                acc[detail.name] = detail.value;
                            }
                            return acc;
                        }, {})
                    }
                }
            };

            resolve(responsePayDetails);
        });
    });
}

function parseViolationPay(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }
            const head = result.Head || {};
            const txn = result.Txn || {};
            const entryTxn = txn.EntryTxn || {};
            const resp = result.Resp || {};
            const vehicleDetails = resp.Vehicle?.VehicleDetails || {};
            const responsePayDetails = {
                messageId: head.msgId || '',
                organizationId: head.orgId || '',
                timestamp: head.ts || '',
                version: head.ver || '',

                transaction: {
                    id: txn.id || '',
                    note: txn.note || '',
                    originTransactionId: txn.orgTxnId || '',
                    referenceId: txn.refId || '',
                    referenceUrl: txn.refUrl || '',
                    transactionTimestamp: txn.ts || '',
                    transactionType: txn.type || '',
                    transactionLiability: txn.txnLiability || '',

                    // Entry Transaction Details
                    entryTransaction: {
                        id: entryTxn.id || '',
                        timestampRead: entryTxn.tsRead || '',
                        timestamp: entryTxn.ts || '',
                        type: entryTxn.type || ''
                    }
                },

                // Response Details
                response: {
                    plazaId: resp.plazaId || '',
                    responseCode: resp.respCode || '',
                    result: resp.result || '',
                    timestamp: resp.ts || '',
                    fareType: resp.FareType || '',

                    // Reference Details
                    reference: {
                        tollFare: resp.Ref?.TollFare || '',
                        approvalNumber: resp.Ref?.approvalNum || '',
                        errorCode: resp.Ref?.errCode || '',
                        settlementCurrency: resp.Ref?.settCurrency || ''
                    },

                    // Vehicle Details
                    vehicle: {
                        transactionId: resp.Vehicle?.TID || '',
                        tagId: resp.Vehicle?.tagId || '',
                        details: ensureArray(resp.Vehicle?.VehicleDetails?.Detail).reduce((acc, detail) => {
                            if (detail.name && detail.value) {
                                acc[detail.name] = detail.value;
                            }
                            return acc;
                        }, {})
                    }
                }
            };

            resolve(responsePayDetails);
        });
    });
}

async function responsePay(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseResponsePay(xmlData);
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

async function responseViolationResult(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseViolationPay(xmlData);
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