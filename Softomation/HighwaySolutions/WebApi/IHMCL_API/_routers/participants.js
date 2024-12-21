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

router.post('/response-participants-list', participantsResponse);

function parseParticipantsListResponse(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }

            // Extract head, transaction, and response details
            const head = result.Head || {};
            const txn = result.Txn || {};
            const resp = txn.Resp || {};
            const participantList = resp.ParticipantList || [];

            // Extract participant details
            const participants = (participantList.Participant || []).map(participant => ({
                name: participant.name || '',
                errCode: participant.errCode || '',
                issuerIin: participant.issuerIin || ''
            }));

            // Return structured response
            const responseDetails = {
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
                        numberOfParticipants: resp.NoOfParticipant || '',
                        participants: participants
                    }
                }
            };

            resolve(responseDetails);
        });
    });
}


async function participantsResponse(req, res) {
    try {
        const xmlData = req.body;
       
        const parsedDetails = await parseParticipantsListResponse(xmlData);
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