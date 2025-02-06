const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const path = require('path');
const fs = require('fs');
const sql = require('mssql');
const axios = require('axios');
const {
    root_path,
    icd_path
} = require("../_helpers/constants");
const icd_Directory = path.join(root_path, icd_path);
router.get('/IcdPlazaGetAll', IcdPlazaGetAll);
router.get('/IcdRequestStatus', IcdRequestStatus);
router.get('/ICRReuploadFailedData', ICRReuploadFailedData);
router.get('/ICDRequestUploadDiff', ICDRequestUploadDiff);
router.get('/ICDResponsePending', ICDResponsePending);
router.get('/ICDResponseDeclined', ICDResponseDeclined);
router.post('/IcdTransactionFilter', IcdTransactionFilter);
router.post('/ICDReProcessData', ICDReProcessData);
router.post('/ICDUpdatedforCheckStatus', ICDUpdatedforCheckStatus);
router.post('/ICDManualProcess', ICDManualProcess);
router.post('/UpdateIcdConfig', UpdateIcdConfig);

module.exports = router;
const tag_url = 'http://139.167.39.106:5003/tagRequest'
const allowed = ["00", "02", "04"]; // Allowed EXCCODE values
const not_allowed = ["01", "03", "05", "06"]; // Not allowed EXCCODE values
const statusDescriptions = {
    "00": "SUCCESS",
    "01": "HOT_LIST",
    "02": "EXEMPTED_VEHICLE_CLASS",
    "03": "LOW_BALANCE",
    "04": "INVALID_CARRIAGE",
    "05": "BLACKLIST",
    "06": "CLOSED_REPLACED",
};
async function IcdPlazaGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDPlazaGetAll');
        fs.readFile(icd_Directory, 'utf8', (err, data) => {
            if (err) {
                errorlogMessage(err, 'ICD Read File');
                let out = constants.ResponseMessage(err.message, null);
                res.status(500).json(out)
            }
            try {
                const jsonData = JSON.parse(data);
                data = {
                    "PlazaList": result.recordset,
                    "UATList": jsonData.UatApiDetails,
                    "ProdList": jsonData.ProdApiDetails,
                    "SftpList": jsonData.SftpDetails,
                }
                let out = constants.ResponseMessage("success", data);
                res.status(200).json(out)
            } catch (err) {
                errorlogMessage(err, 'ICD parsing File');
                let out = constants.ResponseMessage(err.message, null);
                res.status(500).json(out)
            }
        });

    } catch (error) {
        errorlogMessage(error, 'IcdPlazaGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function UpdateIcdConfig(req, res, next) {
    try {
        const reciveData = req.body;
        const pool = await database.getPool();
        const currentDateTime = new Date();
        const plaza = reciveData.PlazaDetail;
        result = await pool.request().input('PlazaId', sql.Int, plaza.PlazaId)
            .input('PlazaType', sql.VarChar(50), plaza.PlazaType)
            .input('PlazaSubType', sql.VarChar(50), plaza.PlazaSubType)
            .input('PlazaZoneId', sql.VarChar(50), plaza.PlazaZoneId)
            .input('PlazaAgencyCode', sql.VarChar(100), "")//plaza.PlazaAgencyCode
            .input('PlazaAcquirerId', sql.Int, 0)//plaza.PlazaAcquirerId
            .input('OrganizationId', sql.VarChar(4), plaza.OrganizationId)
            .input('IsProducation', sql.Bit, plaza.IsProducation)
            .input('CertificateName', sql.VarChar(250), plaza.CertificateName)
            .input('CertificatePassword', sql.VarChar(250), plaza.CertificatePassword)
            .input('CreatedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('CreatedBy', sql.Int, plaza.CreatedBy)
            .input('ModifiedDate', sql.DateTime, date_time_format(currentDateTime))
            .input('ModifiedBy', sql.Int, plaza.CreatedBy)
            .execute('USP_ICDPlazaInsertUpdate');
        const plazaresult = result.recordset[0].AlertMessage;
        if (plazaresult == "success") {
            fs.readFile(icd_Directory, 'utf8', (err, data) => {
                if (err) {
                    errorlogMessage(err, 'IcdConfiguration Read File');
                    let out = constants.ResponseMessage(err.message, null);
                    res.status(500).json(out)
                }
                try {
                    const jsonData = JSON.parse(data);
                    const updatedData = {
                        UatApiDetails: reciveData.UATDetail,
                        ProdApiDetails: reciveData.ProdDetail,
                        SftpDetails: reciveData.SftpDetail
                    }
                    Object.assign(jsonData, updatedData);
                    fs.writeFile(icd_Directory, JSON.stringify(jsonData, null, 2), 'utf8', (err) => {
                        if (err) {
                            errorlogMessage(err, 'IcdConfiguration write File');
                            let out = constants.ResponseMessage(err.message, null);
                            res.status(500).json(out)
                        }
                        let out = constants.ResponseMessage("success", null);
                        res.status(200).json(out);
                    });
                } catch (err) {
                    errorlogMessage(err, 'IcdConfiguration parsing File');
                    let out = constants.ResponseMessage(err.message, null);
                    res.status(500).json(out)
                }
            });
        }
        else {
            let out = constants.ResponseMessageList(result.recordset, null);
            res.status(200).json(out)
        }
    } catch (error) {
        errorlogMessage(error, 'UpdateIcdConfig');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function IcdRequestStatus(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDPostTransStatus');
        let out = constants.ResponseMessage("success", result.recordsets);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'IcdRequestStatus');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICRReuploadFailedData(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDReuploadFailedData');
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)

    } catch (error) {
        errorlogMessage(error, 'ICRReuploadFailedData');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICDRequestUploadDiff(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDRequestUploadDiff');
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)

    } catch (error) {
        errorlogMessage(error, 'ICDRequestUploadDiff');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICDResponsePending(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDResponsePending');
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)

    } catch (error) {
        errorlogMessage(error, 'ICDResponsePending');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICDResponseDeclined(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_ICDResponseDeclined');
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)

    } catch (error) {
        errorlogMessage(error, 'ICDResponseDeclined');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function IcdTransactionFilter(req, res, next) {
    try {
        let data = req.body;
        data.FilterQuery = "WHERE CONVERT(DATE,T.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,T.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
        if (data.VehicleClassFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND (T.VehicleClassId IN (" + data.VehicleClassFilterList + ") OR T.VehicleAvcClassId IN (" + data.VehicleClassFilterList + ")) ";
        }
        if (data.VehicleSubClassFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND (T.VehicleSubClassId IN (" + data.VehicleSubClassFilterList + ") OR T.TagClassId IN (" + data.VehicleSubClassFilterList + ")) ";
        }
        if (data.PlateNumber != "") {
            data.FilterQuery = data.FilterQuery + " AND (T.PlateNumber LIKE %'" + data.PlateNumber + "'% OR T.TagPlateNumber LIKE %'" + data.PlateNumber + "'%  OR P.ResponseRegistrationNumber LIKE %'" + data.PlateNumber + "'%)";
        }
        if (data.TransactionId != "") {
            data.FilterQuery = data.FilterQuery + " AND (P.TransactionId = '" + data.TransactionId + "')";
        }
        if (data.TagId != "") {
            data.FilterQuery = data.FilterQuery + " AND (T.TagEPC = '" + data.TagId + "')";
        }
        const pool = await database.getPool();
        result = await pool.request().input('FilterQuery', sql.VarChar(4000), data.FilterQuery).execute('USP_ICDTransactionFilter');
        let out = constants.ResponseMessage("success", result.recordset);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'IcdTransactionFilter');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICDReProcessData(req, res, next) {
    try {
        const receivedBatch = req.body;
        const processedBatch = await Promise.all(
            receivedBatch.map(async (record) => {
                try {
                    if (record.HoursDifference > 72) {
                        return {
                            ...record,
                            status: false, // true if all values are allowed, false otherwise
                            excCode: "UNKNOWN", // Include EXCCODE for debugging if needed
                            description: "SLA Exceed", // Status descriptions based on EXCCODE
                        };
                    }
                    else {
                        const response = await axios.post(tag_url, {
                            TagId: record.TagEPC,
                            TID: "",
                            VRN: ""
                        });
                        const excCode = response.data.VehicleDetails?.EXCCODE;
                        const excCodeArray = excCode ? excCode.split(",") : []; // Split comma-separated values into an array
                        const hasNotAllowed = excCodeArray.some((code) => not_allowed.includes(code));
                        const status = !hasNotAllowed;
                        const descriptions = excCodeArray.map((code) => statusDescriptions[code] || "UNKNOWN").join(", ");
                        return {
                            ...record,
                            status: status, // true if all values are allowed, false otherwise
                            excCode: excCode || "UNKNOWN", // Include EXCCODE for debugging if needed
                            description: descriptions, // Status descriptions based on EXCCODE
                        };
                    }
                } catch (error) {
                    errorlogMessage(error, `Error processing record ${record.PlazaTransactionId}:ICDReProcessData`);
                    return {
                        ...record,
                        status: false, // Default to false in case of an error
                        excCode: "ERROR",
                        description: "ERROR_FETCHING_DATA",
                    };
                }
            })
        );
        try {
            const pool = await database.getPool();
            result = await pool.request().input('ProcessedRecords', sql.VarChar(sql.MAX), JSON.stringify(processedBatch))
                .execute('USP_ICDReProcessCorrectionData');
            res.status(200).send(result.recordset);
        } catch (error) {
            errorlogMessage(error, 'ICDReProcessData-DB');
            let out = constants.ResponseMessage(error.message, null);
            res.status(400).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'ICDReProcessData');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICDUpdatedforCheckStatus(req, res, next) {
    try {
        const receivedBatch = req.body;
        const pool = await database.getPool();
        result = await pool.request().input('ProcessedRecords', sql.VarChar(sql.MAX), JSON.stringify(receivedBatch))
            .execute('USP_ICDUpdatedforCheckStatus');
        res.status(200).send(result.recordset);
    } catch (error) {
        errorlogMessage(error, 'ICDUpdatedforCheckStatus');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function ICDManualProcess(req, res, next) {
    try {
        const vrn = req.body.PlateNumber
        const Tagresult = await fetch_tag_details('', '', vrn);
        if (Tagresult.Allowed) {
            const pool = await database.getPool();
            const MasterTransactionId = '';
            const PlazaTransactionId = constants.plzazTxnNumber(req.body.PlazaId, req.body.LaneId, req.body.TransactionDateTime);
            const LaneTransactionId = constants.laneTxnNumber(req.body.LaneId, req.body.TransactionDateTime);
            const Cdt = new Date()
            result = await pool.request().input('MasterTransactionId', sql.VarChar(30), MasterTransactionId)
                .input('PlazaTransactionId', sql.VarChar(30), PlazaTransactionId)
                .input('LaneTransactionId', sql.VarChar(30), LaneTransactionId)
                .input('JourneyId', sql.SmallInt, 0)
                .input('PlazaId', sql.SmallInt, req.body.PlazaId)
                .input('LaneId', sql.SmallInt, req.body.LaneId)
                .input('ShiftId', sql.SmallInt, 0)
                .input('TransactionTypeId', sql.SmallInt, 1)
                .input('PaymentTypeId', sql.SmallInt, 0)
                .input('ExemptTypeId', sql.SmallInt, 0)
                .input('ExemptSubTypeId', sql.SmallInt, 0)
                .input('VehicleClassId', sql.SmallInt, req.body.VehicleClassId)
                .input('VehicleSubClassId', sql.SmallInt, req.body.VehicleSubClassId)
                .input('VehicleAvcClassId', sql.SmallInt, req.body.VehicleAvcClassId)
                .input('PlateNumber', sql.VarChar(20), req.body.PlateNumber)
                .input('RCTNumber', sql.VarChar(32), Tagresult.TID)
                .input('TagEPC', sql.VarChar(32), Tagresult.TAGID)
                .input('TagClassId', sql.SmallInt, req.body.VehicleSubClassId)
                .input('TagPlateNumber', sql.VarChar(20), req.body.PlateNumber)
                .input('TagReadDateTime', sql.DateTimeOffset, date_time_format(req.body.TransactionDateTime))
                .input('TagReadCount', sql.SmallInt, 0)
                .input('TagReadById', sql.Bit, 4)
                .input('PermissibleVehicleWeight', sql.Decimal, 0)
                .input('ActualVehicleWeight', sql.Decimal, 0)
                .input('IsOverWeightCharged', sql.Bit, false)
                .input('OverWeightAmount', sql.Decimal, 0)
                .input('TagPenaltyAmount', sql.Decimal, 0)
                .input('TransactionAmount', sql.Decimal, 0)
                .input('TransactionDateTime', sql.DateTimeOffset, date_time_format(req.body.TransactionDateTime))
                .input('TransactionFrontImage', sql.VarChar(255), '')
                .input('TransactionBackImage', sql.VarChar(255), '')
                .input('TransactionAvcImage', sql.VarChar(255), '')
                .input('TransactionVideo', sql.VarChar(255), '')
                .input('ExemptionProofImage', sql.VarChar(255), '')
                .input('UserId', sql.BigInt, req.body.UserId)
                .input('LoginId', sql.VarChar(20), req.body.LoginId)
                .input('IsReturnJourney', sql.Bit, false)
                .input('IsExcessJourney', sql.Bit, false)
                .input('IsBarrierAutoClose', sql.Bit, false)
                .input('IsTowVehicle', sql.Bit, false)
                .input('IsFleetTranscation', sql.Bit, false)
                .input('FleetCount', sql.SmallInt, 0)
                .input('TCRemark', sql.VarChar(255), '')
                .input('TxnCounter', sql.BigInt, 0)
                .input('ReceivedDateTime', sql.DateTimeOffset, date_time_format(Cdt))
                .execute('USP_LaneTransactionDataInsert');
            let out = constants.ResponseMessageList(result.recordset, null);
            res.status(200).json(out)
        }
        else {
            let msg = [];
            msg.push({ AlertMessage: Tagresult.DESCRIPTION })
            res.status(200).json(msg)
        }
    } catch (error) {
        errorlogMessage(error, 'ICDManualProcess');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function fetch_tag_details(TagEPC, TID, VRN) {
    try {
        const response = await axios.post(tag_url, {
            TagId: TagEPC,
            TID: TID,
            VRN: VRN
        });
        const data = response.data.VehicleDetails;
        const excCode = data?.EXCCODE;
        const excCodeArray = excCode ? excCode.split(",") : [];
        data.DESCRIPTION = excCodeArray.map((code) => statusDescriptions[code] || "UNKNOWN").join(", ");
        return data;
    } catch (error) {
        throw error;
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

function date_time_format(in_dateTime) {
    try {
        if (!moment(in_dateTime).isValid()) {
            throw new Error('Invalid date-time format');
        }
        return momentTz.tz(in_dateTime, 'Asia/Kolkata').format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}

