const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const sql = require('mssql');
const xml2js = require('xml2js');

router.post('/notification', notification);


async function notification(req, res) {
    try {
        const xmlData = req.body;
        xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
            if (err) {
                return res.status(400).send('Invalid XML data');
            }
            const head = result['etc:Notification'].Head;
            const messageId = head.$.msgId;
            const txn = result['etc:Notification'].Txn;
            const notify = result['etc:Notification'].Notify;
            const vehicle = notify.Vehicle
            const details = vehicle.VehicleDetails.Detail;
            const notificationTypeId = constants.notificationMapping[txn.$.type]
            const notifyResult = constants.responseResultMapping[notify.$.result];
            const timestamp = notify.$.ts;
            const NPCIErrCode = parseInt(notify.$.NPCIErrCode);
            const VehicleTID = vehicle.$.TID;
            const VehicleTagId = vehicle.$.tagId;
            constants.save_response_file_msgId(xmlData,timestamp, "Notificition", messageId, "Notificition")
            let vehicleClass = 0
            let registrationNumber = ''
            let commercialVehicle = false
            let TollFare = 0;
            let fareType = 0
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
                if (detail.$.name === 'TOLLFARE') {
                    TollFare = detail.$.value === '' ? 0 : detail.$.value
                };
                if (detail.$.name === 'FARETYPE') fareType = constants.fate_type_mapping[detail.$.value];
            });
            try {
                const pool = await database.getPool();
                dataresult = await pool.request().input('MessageId', sql.VarChar(35), messageId)
                    .input('NotificationDateTime', sql.DateTimeOffset, timestamp)
                    .input('NotificationTypeId', sql.SmallInt, notificationTypeId)
                    .input('NotificationResult', sql.SmallInt, notifyResult)
                    .input('NPCIErrCode', sql.SmallInt, NPCIErrCode)
                    .input('VehicleTID', sql.VarChar(50), VehicleTID)
                    .input('VehicleTagId', sql.VarChar(50), VehicleTagId)
                    .input('VehicleClass', sql.SmallInt, vehicleClass)
                    .input('RegNumber', sql.VarChar(10), registrationNumber)
                    .input('IsComVehicle', sql.Bit, commercialVehicle)
                    .input('TollFare', sql.Decimal(18, 2), TollFare)
                    .input('TollFareTypeId', sql.SmallInt, fareType)
                    .execute('USP_ICDNotificationInsert');
            } catch (error) {
                constants.errorlogMessage(error, 'Notificition:SaveDB');
            }
            res.status(202).send();
        });

    } catch (error) {
        constants.errorlogMessage(error, 'Notificition:ResponseProcess');
        res.status(417).send('Expectation Failed');
    }
}

module.exports = router;