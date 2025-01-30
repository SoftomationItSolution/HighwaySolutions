const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const sql = require('mssql');
const xml2js = require('xml2js');

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
            constants.save_response_file_msgId(xmlData,timestamp, "RespPay", messageId, "RespPay")
            const fareType = constants.fate_type_mapping[resp.$.FareType];
            const cleanedResult = resp.$.result.replace('-', '');
            const responseResult = constants.responseResultMapping[cleanedResult];
            const ref = resp.Ref;
            const TollFare = ref.$.TollFare;
            const approvalNum = ref.$.approvalNum;
            const errCode = ref.$.errCode;
            const settCurrency = ref.$.settCurrency;
            const vehicle = resp.Vehicle
            const details = vehicle.VehicleDetails.Detail;
            let vehicleClass = 0
            let registrationNumber = ''
            let commercialVehicle = false
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
                const pool = await database.getPool();
                dataresult = await pool.request().input('MessageId', sql.VarChar(35), messageId)
                    .input('ResponseVehicleClass', sql.SmallInt, vehicleClass)
                    .input('ResponseRegistrationNumber', sql.VarChar(20), registrationNumber)
                    .input('ResponseCommercialVehicle', sql.SmallInt, commercialVehicle)
                    .input('ResponseErrCode', sql.VarChar(50), errCode)
                    .input('ResponseTollFare', sql.Decimal(18, 2), TollFare)
                    .input('ResponseApprovalNumber', sql.VarChar(10), approvalNum)
                    .input('ResponseCurrencyCode', sql.VarChar(10), settCurrency)
                    .input('ResponseFareType', sql.SmallInt, fareType)
                    .input('ResponseCode', sql.VarChar(50), respCode)
                    .input('ResponseResult', sql.SmallInt, responseResult)
                    .input('ResponseDateTime', sql.DateTimeOffset, timestamp)
                    .execute('USP_ICDRequestPayUpdateResponse');
            } catch (error) {
                constants.errorlogMessage(error, 'RespPay:SaveDB');
            }
            res.status(202).send();
        });

    } catch (error) {
        constants.errorlogMessage(error, 'RespPay:ResponseProcess');
        res.status(417).send('Expectation Failed');
    }
}

async function responseViolationResult(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                return res.status(400).send('Invalid XML data');
            }
            const head = result['ViolationProcessingResult'].Head;
            const messageId = head.$.msgId;
            const timestamp = head.$.ts;
            constants.save_response_file_msgId(xmlData,timestamp, "ViolationProcessingResult", messageId, "ViolationProcessingResult")
            res.status(202).send();
        });

    } catch (error) {
        constants.errorlogMessage(error, 'ViolationProcessingResult:ResponseProcess');
        res.status(417).send('Expectation Failed');
    }
}


module.exports = router;