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

router.post('/response-tag-details', responseTagDetail);

function parseResponseTagDetails(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }

            // Safely extract head information
            const head = result.Head || {};

            // Safely extract transaction information
            const txn = result.Txn || {};
            const resp = txn.Resp || {};
            const vehicle = resp.Vehicle || {};
            const vehicleDetails = vehicle.VehicleDetails || [];

            // Transform the parsed XML into a structured format
            const responseTagDetails = {
                // Head Information
                messageId: head.msgId || '',
                organizationId: head.orgId || '',
                timestamp: head.ts || '',
                version: head.ver || '',

                // Transaction Details
                transaction: {
                    id: txn.id || '',
                    note: txn.note || '',
                    originTransactionId: txn.orgTxnId || '',
                    referenceId: txn.refId || '',
                    referenceUrl: txn.refUrl || '',
                    transactionTimestamp: txn.ts || '',
                    transactionType: txn.type || '',
                },

                // Response Details
                response: {
                    responseCode: resp.respCode || '',
                    result: resp.result || '',
                    successRequestCount: resp.successReqCnt || 0,
                    totalRequestCount: resp.totReqCnt || 0,
                    timestamp: resp.ts || '',

                    // Vehicle Details
                    vehicles: ensureArray(vehicleDetails).map(detail => {
                        const vehicleInfo = {};
                        ensureArray(detail.Detail).forEach(d => {
                            if (d.name && d.value) {
                                vehicleInfo[d.name] = d.value;
                            }
                        });
                        return vehicleInfo;
                    })
                }
            };

            resolve(responseTagDetails);
        });
    });
}


async function responseTagDetail(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseResponseTagDetails(xmlData);
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