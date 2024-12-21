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

router.post('/response-sync-time', responseTime);

function parseSyncTimeResponse(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }

            // Safely extract head information
            const head = result.Head || {};

            // Safely extract response information
            const resp = result.Resp || {};

            // Transform the parsed XML into a more structured format
            const syncTimeDetails = {
                // Head Information
                messageId: head.msgId || '',
                organizationId: head.orgId || '',
                timestamp: head.ts || '',
                version: head.ver || '',

                // Response Details
                response: {
                    responseCode: resp.respCode || '',
                    result: resp.result || '',
                    timestamp: resp.ts || '',

                    // Server Time Details
                    serverTime: resp.Time?.serverTime || ''
                }
            };

            resolve(syncTimeDetails);
        });
    });
}

async function responseTime(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parseSyncTimeResponse(xmlData);
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