const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
router.post('/LaneTranscationInsert', LaneTranscationInsert);
router.post('/LaneTranscationDataInsert', LaneTranscationDataInsert);
router.post('/AvcTransactionInsert', AvcTransactionInsert);
router.post('/WimTransactionInsert', WimTransactionInsert);
router.post('/WimTransactionAxleDetailsInsert', WimTransactionAxleDetailsInsert);
module.exports = router;
async function LaneTranscationInsert(req, res, next) {
    try {
        const pool = await database.getPool();
        const MasterTransactionId = '';
        const PlazaTransactionId = constants.plzazTxnNumber(req.body.PlazaId, req.body.LaneId, req.body.TransactionDateTime);
        const Cdt = new Date()
        result = await pool.request().input('MasterTransactionId', sql.VarChar(30), MasterTransactionId)
            .input('PlazaTransactionId', sql.VarChar(30), PlazaTransactionId)
            .input('LaneTransactionId', sql.VarChar(30), req.body.LaneTransactionId)
            .input('SystemIntegratorId', sql.SmallInt, req.body.SystemIntegratorId)
            .input('JourneyId', sql.SmallInt, req.body.JourneyId)
            .input('PlazaId', sql.SmallInt, req.body.PlazaId)
            .input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('LaneStatusId', sql.Bit, req.body.LaneStatusId)
            .input('LaneModeId', sql.Bit, req.body.LaneModeId)
            .input('LaneDirectionId', sql.SmallInt, req.body.LaneDirectionId)
            .input('ShiftId', sql.SmallInt, req.body.ShiftId)
            .input('TransactionTypeId', sql.SmallInt, req.body.TransactionTypeId)
            .input('PaymentTypeId', sql.SmallInt, req.body.PaymentTypeId)
            .input('ExemptTypeId', sql.SmallInt, req.body.ExemptTypeId)
            .input('ExemptSubTypeId', sql.SmallInt, req.body.ExemptSubTypeId)
            .input('VehicleClassId', sql.SmallInt, req.body.VehicleClassId)
            .input('VehicleSubClassId', sql.SmallInt, req.body.VehicleSubClassId)
            .input('VehicleAvcClassId', sql.SmallInt, req.body.VehicleAvcClassId)
            .input('PlateNumber', sql.VarChar(20), req.body.PlateNumber)
            .input('RCTNumber', sql.VarChar(32), req.body.RCTNumber)
            .input('TagEPC', sql.VarChar(32), req.body.TagEPC)
            .input('TagClassId', sql.SmallInt, req.body.TagClassId)
            .input('TagPlateNumber', sql.VarChar(20), req.body.TagPlateNumber)
            .input('TagReadDateTime', sql.DateTime2, date_time_format(req.body.TagReadDateTime))
            .input('TagReadCount', sql.SmallInt, req.body.TagReadCount)
            .input('TagReadById', sql.Bit, req.body.TagReadById)
            .input('PermissibleVehicleWeight', sql.Decimal(18,3), req.body.PermissibleVehicleWeight)
            .input('ActualVehicleWeight', sql.Decimal(18,3), req.body.ActualVehicleWeight)
            .input('IsOverWeightCharged', sql.Bit, req.body.IsOverWeightCharged)
            .input('OverWeightAmount', sql.Decimal(18,2), req.body.OverWeightAmount)
            .input('TagPenaltyAmount', sql.Decimal(18,2), req.body.TagPenaltyAmount)
            .input('TransactionAmount', sql.Decimal(18,2), req.body.TransactionAmount)
            .input('TransactionDateTime', sql.DateTime2, date_time_format(req.body.TransactionDateTime))
            .input('TransactionFrontImage', sql.VarChar(255), req.body.TransactionFrontImage)
            .input('TransactionBackImage', sql.VarChar(255), req.body.TransactionBackImage)
            .input('TransactionAvcImage', sql.VarChar(255), req.body.TransactionAvcImage)
            .input('TransactionVideo', sql.VarChar(255), req.body.TransactionVideo)
            .input('ExemptionProofImage', sql.VarChar(255), req.body.ExemptionProofImage)
            .input('DestinationPlazaId', sql.SmallInt, req.body.DestinationPlazaId)
            .input('UserId', sql.BigInt, req.body.UserId)
            .input('LoginId', sql.VarChar(20), req.body.LoginId)
            .input('IsReturnJourney', sql.Bit, req.body.IsReturnJourney)
            .input('IsExcessJourney', sql.Bit, req.body.IsExcessJourney)
            .input('IsBarrierAutoClose', sql.Bit, req.body.IsBarrierAutoClose)
            .input('IsTowVehicle', sql.Bit, req.body.IsTowVehicle)
            .input('IsFleetTranscation', sql.Bit, req.body.IsFleetTranscation)
            .input('FleetCount', sql.SmallInt, req.body.FleetCount)
            .input('TCRemark', sql.VarChar(255), req.body.TCRemark)
            .input('ReceivedDateTime', sql.DateTime2, date_time_format(Cdt))
            .execute('USP_LaneTransactionInsert');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTranscationInsert');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneTranscationDataInsert(req, res, next) {
    try {
        const pool = await database.getPool();
        const MasterTransactionId = '';
        const PlazaTransactionId = constants.plzazTxnNumber(req.body.PlazaId, req.body.LaneId, req.body.TransactionDateTime);
        const Cdt = new Date()
        result = await pool.request().input('MasterTransactionId', sql.VarChar(30), MasterTransactionId)
            .input('PlazaTransactionId', sql.VarChar(30), PlazaTransactionId)
            .input('LaneTransactionId', sql.VarChar(30), req.body.LaneTransactionId)
            .input('JourneyId', sql.SmallInt, req.body.JourneyId)
            .input('PlazaId', sql.SmallInt, req.body.PlazaId)
            .input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('ShiftId', sql.SmallInt, req.body.ShiftId)
            .input('TransactionTypeId', sql.SmallInt, req.body.TransactionTypeId)
            .input('PaymentTypeId', sql.SmallInt, req.body.PaymentTypeId)
            .input('ExemptTypeId', sql.SmallInt, req.body.ExemptTypeId)
            .input('ExemptSubTypeId', sql.SmallInt, req.body.ExemptSubTypeId)
            .input('VehicleClassId', sql.SmallInt, req.body.VehicleClassId)
            .input('VehicleSubClassId', sql.SmallInt, req.body.VehicleSubClassId)
            .input('VehicleAvcClassId', sql.SmallInt, req.body.VehicleAvcClassId)
            .input('PlateNumber', sql.VarChar(20), req.body.PlateNumber)
            .input('RCTNumber', sql.VarChar(32), req.body.RCTNumber)
            .input('TagEPC', sql.VarChar(32), req.body.TagEPC)
            .input('TagClassId', sql.SmallInt, req.body.TagClassId)
            .input('TagPlateNumber', sql.VarChar(20), req.body.TagPlateNumber)
            .input('TagReadDateTime', sql.DateTime2, date_time_format(req.body.TagReadDateTime))
            .input('TagReadCount', sql.SmallInt, req.body.TagReadCount)
            .input('TagReadById', sql.Bit, req.body.TagReadById)
            .input('PermissibleVehicleWeight', sql.Decimal, req.body.PermissibleVehicleWeight)
            .input('ActualVehicleWeight', sql.Decimal, req.body.ActualVehicleWeight)
            .input('IsOverWeightCharged', sql.Bit, req.body.IsOverWeightCharged)
            .input('OverWeightAmount', sql.Decimal, req.body.OverWeightAmount)
            .input('TagPenaltyAmount', sql.Decimal, req.body.TagPenaltyAmount)
            .input('TransactionAmount', sql.Decimal, req.body.TransactionAmount)
            .input('TransactionDateTime', sql.DateTime2, date_time_format(req.body.TransactionDateTime))
            .input('TransactionFrontImage', sql.VarChar(255), req.body.TransactionFrontImage)
            .input('TransactionBackImage', sql.VarChar(255), req.body.TransactionBackImage)
            .input('TransactionAvcImage', sql.VarChar(255), req.body.TransactionAvcImage)
            .input('TransactionVideo', sql.VarChar(255), req.body.TransactionVideo)
            .input('ExemptionProofImage', sql.VarChar(255), req.body.ExemptionProofImage)
            .input('UserId', sql.BigInt, req.body.UserId)
            .input('LoginId', sql.VarChar(20), req.body.LoginId)
            .input('IsReturnJourney', sql.Bit, req.body.IsReturnJourney)
            .input('IsExcessJourney', sql.Bit, req.body.IsExcessJourney)
            .input('IsBarrierAutoClose', sql.Bit, req.body.IsBarrierAutoClose)
            .input('IsTowVehicle', sql.Bit, req.body.IsTowVehicle)
            .input('IsFleetTranscation', sql.Bit, req.body.IsFleetTranscation)
            .input('FleetCount', sql.SmallInt, req.body.FleetCount)
            .input('TCRemark', sql.VarChar(255), req.body.TCRemark)
            .input('TxnCounter', sql.BigInt, req.body.TxnCounter)
            .input('ReceivedDateTime', sql.DateTime2, date_time_format(Cdt))
            .execute('USP_LaneTransactionDataInsert');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTranscationInsert');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function AvcTransactionInsert(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('TransactionCount', sql.BigInt, req.body.TransactionCount)
            .input('AvcSensorClassId', sql.SmallInt, req.body.AvcSensorClassId)
            .input('AvcClassId', sql.SmallInt, req.body.AvcClassId)
            .input('AxleCount', sql.SmallInt, req.body.AxleCount)
            .input('IsReverseDirection', sql.Bit, req.body.IsReverseDirection)
            .input('WheelBase', sql.BigInt, req.body.WheelBase)
            .input('ImageName', sql.VarChar(255), req.body.ImageName)
            .input('TransactionDateTime', sql.DateTime2, date_time_format(req.body.TransactionDateTime))
            .input('LaneTransactionId', sql.VarChar(45), req.body.LaneTransactionId)
            .execute('USP_AvcTransactionInsert');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'USP_AvcTransactionInsert');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function WimTransactionInsert(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('TransactionId', sql.BigInt, req.body.TransactionId)
            .input('TotalWeight', sql.Decimal, req.body.TotalWeight)
            .input('AxleCount', sql.SmallInt, req.body.AxleCount)
            .input('IsReverseDirection', sql.Bit, req.body.IsReverseDirection)
            .input('TransactionDateTime', sql.DateTime2, date_time_format(req.body.TransactionDateTime))
            .execute('USP_WimTransactionInsert');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'USP_WimTransactionInsert');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function WimTransactionAxleDetailsInsert(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('TransactionId', sql.BigInt, req.body.TransactionId)
            .input('AxleNumber', sql.SmallInt, req.body.AxleNumber)
            .input('AxleWeight', sql.Decimal, req.body.AxleWeight)
            .input('Speed', sql.Decimal, req.body.Speed)
            .input('AxleDistance', sql.Decimal, req.body.AxleDistance)
            .execute('USP_WimTransactionAxleDetailsInsert');
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'USP_WimTransactionAxleDetailsInsert');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

function date_time_format(in_dateTime) {
    try {
        if (!moment(in_dateTime).isValid()) {
            throw new Error('Invalid date-time format');
        }
        return momentTz.tz(in_dateTime,'Asia/Kolkata').format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}

// function date_time_format(in_dateTime) {
//     try {
//         if (!in_dateTime) return null;

//         const parsed = moment.tz(in_dateTime, 'DD-MMM-YYYY HH:mm:ss.SSS', 'Asia/Kolkata');
//         if (!parsed.isValid()) throw new Error('Invalid date-time format');

//         return parsed.toDate(); // return actual Date object for SQL input
//     } catch (error) {
//         errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
//         return null;
//     }
// }


function errorlogMessage(error, method) {
    try {
        logger.error(`Caught an error in :${method} : ${error.message}`);
        logger.error(error.stack);
    }
    catch (error) {
        logger.error(`Caught an error in :${method}`);
    }
}