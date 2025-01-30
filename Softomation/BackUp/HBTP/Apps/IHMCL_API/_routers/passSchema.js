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

router.post('/response-set-pass-scheme', passScheme);

function parseSetPassSchemeResponse(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }

            // Extract head, transaction, command, and result details
            const head = result.Head || {};
            const txn = result.Txn || {};
            const command = result.Command || {};
            const resultElement = result.Result || {};
            const destination = result.Destination || {};
            const source = result.Source || {};

            // Extract parameter details
            const params = (command.Param || []).map(param => ({
                name: param.name || '',
                type: param.type || '',
                value: param.value || '',
                length: param.length || ''
            }));

            // Extract object list details
            const objectList = (command.ObjectList || {}).Object || [];
            const schemes = objectList.map(object => ({
                schemeName: object.name || '',
                items: (object.Item || []).map(item => ({
                    itemName: item.name || '',
                    itemType: item.type || '',
                    itemValue: item.value || ''
                }))
            }));

            // Construct the parsed response
            const responseDetails = {
                version: head.ver || '',
                timestamp: head.ts || '',
                organizationId: head.orgId || '',
                messageId: head.msgId || '',

                transaction: {
                    transactionId: txn.id || '',
                    transactionTimestamp: txn.ts || '',
                    type: txn.type || '',
                    originalTransactionId: txn.orgTxnId || '',

                    command: {
                        commandName: command.name || '',
                        commandType: command.type || '',
                        numParams: command.NumParams || '',
                        params: params
                    },

                    result: {
                        resultTimestamp: resultElement.ts || '',
                        resultStatus: resultElement.status || '',
                        resultCode: resultElement.code || ''
                    },

                    destination: {
                        address: destination.addr || '',
                        name: destination.name || '',
                        type: destination.type || ''
                    },

                    source: {
                        address: source.addr || '',
                        name: source.name || '',
                        type: source.type || ''
                    },

                    schemes: schemes
                }
            };

            resolve(responseDetails);
        });
    });
}


async function passScheme(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseSetPassSchemeResponse(xmlData);
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