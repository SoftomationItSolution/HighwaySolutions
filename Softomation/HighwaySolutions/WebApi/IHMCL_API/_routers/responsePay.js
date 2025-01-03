const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const path = require('path');
const database = require('../_helpers/dbSingleton');
const logger = require('../_helpers/logger');
const sql = require('mssql');
const xml2js = require('xml2js');
const { root_path } = require("../_helpers/constants");
const xmlParser = new xml2js.Parser({
    explicitArray: false,  // Prevent creating arrays for single elements
    trim: true,            // Trim whitespace
    explicitRoot: false,   // Don't keep root element
    mergeAttrs: true       // Merge attributes into parent object
});
router.post('/response-pay', responsePay);
router.post('/response-violation-result', responseViolationResult);


async function responsePay(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                return res.status(400).send('Invalid XML data');
            }
            const head = result['etc:RespPay'].Head;
            const messageId = head.$.msgId;
            const resp = result['etc:RespPay'].Resp;
            const respCode = resp.$.respCode
            const timestamp = resp.$.ts;
            const fareType = constants.fate_type_mapping[resp.$.FareType];
            const cleanedResult = resp.$.result.replace('-', '');
            const responseResult = constants.responseResultMapping[cleanedResult];
            const ref = resp.Ref;
            const TollFare = ref.$.TollFare;
            const approvalNum = ref.$.approvalNum;
            const errCode = ref.$.errCode;
            const settCurrency = ref.$.settCurrency;
            const vehicle=resp.Vehicle
            const details = vehicle.VehicleDetails.Detail;
            let vehicleClass=0
            let registrationNumber=''
            let commercialVehicle=false
            details.forEach(detail => {
                if (detail.$.name === 'VEHICLECLASS') {
                    let value = detail.$.value;
                    value = value.replace(/vc/gi, ''); 
                    vehicleClass = parseInt(value);
                }
                if (detail.$.name === 'REGNUMBER') registrationNumber = detail.$.value;
                
                if (detail.$.name === 'COMVEHICLE') {
                    commercialVehicle = detail.$.value === 'T' ? false : true;
                }
            });
            try {
                const dateFolder = constants.date_format_folder(timestamp);
                const saveDir = path.join(root_path, "Response", dateFolder);
                const filename = `responsePay_${messageId}.xml`;
                constants.saveReceivedDataAsFile(xmlData, saveDir, filename);
            } catch (err) {
                errorlogMessage(err, 'responsePay_savefile');
            }
            try {
                const pool = await database.getPool();
                result = await pool.request().input('MessageId', sql.VarChar(35), messageId)
                    .input('ResponseVehicleClass', sql.SmallInt, vehicleClass)
                    .input('ResponseRegistrationNumber', sql.VarChar(20), registrationNumber)
                    .input('ResponseCommercialVehicle', sql.SmallInt, commercialVehicle)
                    .input('ResponseErrCode', sql.VarChar(50), errCode)
                    .input('ResponseTollFare', sql.Decimal(18,2), TollFare)
                    .input('ResponseApprovalNumber', sql.VarChar(10), approvalNum)
                    .input('ResponseCurrencyCode', sql.VarChar(10), settCurrency)
                    .input('ResponseFareType', sql.SmallInt, fareType)
                    .input('ResponseCode', sql.VarChar(50), respCode)
                    .input('ResponseResult', sql.SmallInt, responseResult)
                    .input('ResponseDateTime', sql.DateTimeOffset, timestamp)
                    .execute('USP_ICDRequestPayUpdateResponse');
            } catch (error) {
                errorlogMessage(error, 'responsePay_saveinDB');
            }
            res.status(202).send();
        });

    } catch (error) {
        errorlogMessage(error, 'responsePay-time');
        res.status(417).send('Expectation Failed');
    }
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