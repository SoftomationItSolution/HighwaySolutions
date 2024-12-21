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

router.post('/response-transaction-status', checkTransactionStatus);

function parseTransactionStatusResponse(xmlData) {
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

            // Parse transaction status list if present
            const statusList = txn.TxnStatusReqList?.Status || [];
            const txnStatusList = statusList.map(status => ({
                txnId: status.txnId || '',
                txnDate: status.txnDate || '',
                plazaId: status.plazaId || '',
                laneId: status.laneId || '',
                result: status.result || '',
                errCode: status.errCode || '',
                settleDate: status.settleDate || '',
                txnList: (status.TxnList || []).map(txnDetail => ({
                    txnStatus: txnDetail.txnStatus || '',
                    txnReaderTime: txnDetail.txnReaderTime || '',
                    txnType: txnDetail.txnType || '',
                    txnReceivedTime: txnDetail.txnReceivedTime || '',
                    tollFare: txnDetail.TollFare || '',
                    fareType: txnDetail.FareType || '',
                    vehicleClass: txnDetail.VehicleClass || '',
                    regNumber: txnDetail.RegNumber || '',
                    errCode: txnDetail.errCode || ''
                }))
            }));

            // Return structured response
            const transactionDetails = {
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
                        result: resp.result || '',
                        responseCode: resp.respCode || '',
                        totalRequestCount: resp.totReqCnt || '',
                        successRequestCount: resp.sucessReqCnt || ''
                    },
                    txnStatusReqList: txnStatusList
                }
            };

            resolve(transactionDetails);
        });
    });
}


async function checkTransactionStatus(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseTransactionStatusResponse(xmlData);
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