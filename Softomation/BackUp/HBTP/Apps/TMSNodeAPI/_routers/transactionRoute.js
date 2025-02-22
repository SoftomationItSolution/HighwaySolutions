const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const moment = require('moment');
const momentTz = require('moment-timezone');
router.get('/LaneTransactionGetLatest', LaneTransactionGetLatest);
router.get('/ReviewPendingGetLatest', ReviewPendingGetLatest);
router.get('/ReviewedGetLatest', ReviewedGetLatest);
router.post('/LaneTransactionGetByFilter', LaneTransactionGetByFilter);
router.post('/LaneTransactionValidation', LaneTransactionValidation);
router.post('/LaneTransactionCancel', LaneTransactionCancel);

module.exports = router;

async function LaneTransactionGetLatest(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneTransactionGetLatest');
        
        let dataarray = result.recordset;
        let dataset = []
        for (let i = 0; i < dataarray.length; i++) {
            dataset.push(CreateObjectForLaneData(dataarray[i]))
        }
        let out = constants.ResponseMessage("success", dataset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTransactionGetLatest');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ReviewPendingGetLatest(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneTransactionUnReviewedGetLatest');
        
        let dataarray = result.recordset;
        let dataset = []
        for (let i = 0; i < dataarray.length; i++) {
            dataset.push(CreateObjectForLaneData(dataarray[i]))
        }
        let out = constants.ResponseMessage("success", dataset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ReviewPendingGetLatest');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ReviewedGetLatest(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_LaneTransactionReviewedGetLatest');
        
        let dataarray = result.recordset;
        let dataset = []
        for (let i = 0; i < dataarray.length; i++) {
            dataset.push(CreateObjectForLaneData(dataarray[i]))
        }
        let out = constants.ResponseMessage("success", dataset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'ReviewedGetLatest');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneTransactionGetByFilter(req, res, next) {
    try {
        let data = req.body;
        if (data.IsReviewedRequired && data.IsReviewedStatus) {
            data.FilterQuery = "WHERE L.IsReviewedRequired=1 AND L.ReviewedStatus=1 AND CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
        }
        else if (data.IsReviewedRequired && data.IsReviewedStatus == false) {
            data.FilterQuery = "WHERE L.IsReviewedRequired=1 AND L.ReviewedStatus=0 AND CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
        }
        else {
            data.FilterQuery = "WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
        }
        if (data.ShiftFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.ShiftId IN (" + data.ShiftFilterList + ") ";
        }
        if (data.TCUserFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.UserId IN (" + data.TCUserFilterList + ") ";
        }
        if (data.AuditerFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.ReveiwedBy IN (" + data.AuditerFilterList + ") ";
        }
        if (data.PlazaFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.PlazaId IN (" + data.PlazaFilterList + ") ";
        }
        if (data.LaneFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.LaneId IN (" + data.LaneFilterList + ") ";
        }
        if (data.TransactionTypeFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.TransactionTypeId IN (" + data.TransactionTypeFilterList + ") ";
        }
        if (data.VehicleClassFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.VehicleClassId IN (" + data.VehicleClassFilterList + ") ";
        }
        if (data.VehicleSubClassFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.VehicleSubClassId IN (" + data.VehicleSubClassFilterList + ") ";
        }
        if (data.PlateNumber != "") {
            data.FilterQuery = data.FilterQuery + " AND (L.PlateNumber ='" + data.PlateNumber + "' OR L.TagPlateNumber ='" + data.PlateNumber + "')";
        }
        if (data.TransactionId != "") {
            data.FilterQuery = data.FilterQuery + " AND (L.MasterTransactionId = '" + data.TransactionId + "' OR L.PlazaTransactionId = '" + data.TransactionId + "' OR L.LaneTransactionId = '" + data.TransactionId + "' OR L.RCTNumber ='"+data.TransactionId+"')";
        }
        const pool = await database.getPool();
        result = await pool.request().input('FilterQuery', sql.VarChar(4000), data.FilterQuery).execute('USP_LaneTransactionGetByFilter');
        
        let dataarray = result.recordset;
        let dataset = []
        for (let i = 0; i < dataarray.length; i++) {
            dataset.push(CreateObjectForLaneData(dataarray[i]))
        }
        let out = constants.ResponseMessage("success", dataset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTransactionGetByFilter');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneTransactionValidation(req, res, next) {
    try {
        const currentDateTime = new Date();
        let data = req.body;
        const pool = await database.getPool();
        result = await pool.request()
            .input('PlazaTransactionId', sql.VarChar(30), data.PlazaTransactionId)
            .input('LaneTransactionId', sql.VarChar(30), data.LaneTransactionId)
            .input('ReviewedPlateNumber', sql.VarChar(20), data.ReviewedPlateNumber)
            .input('ReviewedClassCorrectionId', sql.SmallInt, data.ReviewedClassCorrectionId)
            .input('ReviewedSubClassId', sql.SmallInt, data.ReviewedSubClassId)
            .input('ReviewedTransactionTypeId', sql.SmallInt, data.ReviewedTransactionTypeId)
            .input('ReviewedTransactionAmount', sql.Decimal, data.ReviewedTransactionAmount)
            .input('DifferenceAmount', sql.Decimal, data.DifferenceAmount)
            .input('ReviewedById', sql.BigInt, data.ReviewedById)
            .input('ReviewedDateTime', sql.DateTime, date_time_format(currentDateTime))
            .input('ReviewedRemark', sql.VarChar(255), data.ReviewedRemark)
            .execute('USP_LaneTransactionReviewUpdate');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTransactionValidation');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function LaneTransactionCancel(req, res, next) {
    try {
        const currentDateTime = new Date();
        let data = req.body;
        const pool = await database.getPool();
        result = await pool.request()
            .input('PlazaTransactionId', sql.VarChar(30), data.PlazaTransactionId)
            .input('LaneTransactionId', sql.VarChar(30), data.LaneTransactionId)
            .input('ReviewedById', sql.BigInt, data.ReviewedById)
            .input('ReviewedDateTime', sql.DateTime, date_time_format(currentDateTime))
            .input('ReviewedRemark', sql.VarChar(255), data.ReviewedRemark)
            .execute('USP_LaneTransactionReviewCancel');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'LaneTransactionValidation');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}



function CreateObjectForLaneData(row) {
    try {
        const data = {
            MasterTransactionId: row.MasterTransactionId,
            PlazaTransactionId: row.PlazaTransactionId,
            LaneTransactionId: row.LaneTransactionId,
            SystemIntegratorId: parseInt(row.SystemIntegratorId),
            JourneyId: parseInt(row.JourneyId),
            PlazaId: parseInt(row.PlazaId),
            PlazaName: row.PlazaName,
            LaneNumber: "Lane-" + row.LaneNumber,
            LaneTypeId: parseInt(row.LaneTypeId),
            LaneStatusId: parseInt(row.LaneStatusId),
            LaneDirectionId: parseInt(row.LaneDirectionId),
            ShiftId: parseInt(row.ShiftId),
            ShiftNumber: "Shift-" + row.ShiftId,
            PlateNumber: row.PlateNumber,
            VehicleClassId: parseInt(row.VehicleClassId),
            VehicleClassName: row.VehicleClassName,
            VehicleSubClassId: parseInt(row.VehicleSubClassId),
            VehicleSubClassName: row.VehicleSubClassName,
            VehicleAvcClassId: parseInt(row.VehicleAvcClassId),
            VehicleAvcClassName: row.VehicleAvcClassName,
            TransactionTypeId: parseInt(row.TransactionTypeId),
            TransactionTypeName: row.TransactionTypeName,
            PaymentTypeId: parseInt(row.PaymentTypeId),
            PaymentTypeName: row.PaymentTypeName,
            ExemptTypeId: parseInt(row.ExemptTypeId),
            ExemptTypeName: row.ExemptTypeName,
            ExemptSubTypeId: parseInt(row.ExemptSubTypeId),
            RCTNumber: row.RCTNumber,
            TagClassId: row.TagClassId,
            TagClassName: row.TagClassName,
            TagPlateNumber: row.TagPlateNumber,
            TagEPC: row.TagEPC,
            TagReadDateTime: row.TagReadDateTime,
            TagReadBy: row.TagReadBy,
            PermissibleVehicleWeight: row.PermissibleVehicleWeight,
            ActualVehicleWeight: row.ActualVehicleWeight,
            OverWeightAmount: row.OverWeightAmount,
            TagPenaltyAmount: row.TagPenaltyAmount,
            TransactionAmount: row.TransactionAmount,
            TransactionDateTime: row.TransactionDateTime,
            TransactionDateTimeStamp: date_time_format_display(row.TransactionDateTime),
            TransactionFrontImage: row.TransactionFrontImage,
            TransactionBackImage: row.TransactionBackImage,
            TransactionAvcImage: row.TransactionAvcImage,
            TransactionVideo: row.TransactionVideo,
            ExemptionProofImage: row.ExemptionProofImage,
            DestinationPlazaId: row.DestinationPlazaId,
            UserId: row.UserId,
            LoginId: row.LoginId,
            ReturnJourney: row.ReturnJourney,
            ExcessJourney: row.ExcessJourney,
            BarrierAutoClose: row.BarrierAutoClose,
            TowVehicle: row.TowVehicle,
            FleetTranscation: row.FleetTranscation,
            FleetCount: row.FleetCount,
            TransactionStatus: row.TransactionStatus,
            IsReviewedRequired: row.IsReviewedRequired,
            ReviewedStatus: row.ReviewedStatus,
            ReviewedPlateNumber: row.ReviewedPlateNumber,
            ReviewedClassCorrectionId: row.ReviewedClassCorrectionId,
            ReviewedClassCorrectionName: row.ReviewedClassCorrectionName,
            ReviewedSubClassId: row.ReviewedSubClassId,
            ReviewedSubClassName: row.ReviewedSubClassName,
            ReviewedTransactionTypeId: row.ReviewedTransactionTypeId,
            ReviewedTransactionTypeName: row.ReviewedTransactionTypeName,
            ReviewedTransactionAmount: row.ReviewedTransactionAmount,
            DifferenceAmount: row.DifferenceAmount,
            ReviewedById: row.ReviewedById,
            ReviewedLoginId: row.ReviewedLoginId,
            ReviewedDateTime: row.ReviewedDateTime,
            ReviewedRemark: row.ReviewedRemark,
            ReceivedDateTime: row.ReceivedDateTime
        }
        return data;
    } catch (error) {
        throw error;
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

function date_time_format_display(in_dateTime) {
    try {
         // Parse the input date-time string as UTC
        const utcDate = moment.utc(in_dateTime);
        return utcDate.format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
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