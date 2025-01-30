const express = require('express');
const router = express.Router();
const sql = require('mssql');
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const reports = require('../_reports/reportmaster');

router.post('/GetReport', ReportProcess);
module.exports = router;
async function ReportProcess(req, res, next) {
    try {
        let data = req.body;
        data.FilterQuery = "WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
        if (data.ShiftFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.ShiftId IN (" + data.ShiftFilterList + ") ";
        }
        if (data.TCUserFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.UserId IN (" + data.TCUserFilterList + ") ";
        }
        if (data.PlazaFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.PlazaId IN (" + data.PlazaFilterList + ") ";
        }
        if (data.LaneFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.LaneId IN (" + data.LaneFilterList + ") ";
        }
        if (data.VehicleClassFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.VehicleClassId IN (" + data.VehicleClassFilterList + ") ";
        }
        if (data.VehicleSubClassFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.VehicleSubClassId IN (" + data.VehicleSubClassFilterList + ") ";
        }
        if (data.TransactionTypeFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.TransactionTypeId IN (" + data.TransactionTypeFilterList + ") ";
        }
        if (data.AuditerFilterList != "0") {
            data.FilterQuery = data.FilterQuery + " AND L.ReveiwedBy IN (" + data.AuditerFilterList + ") ";
        }
        if (data.PlateNumber !='' && data.ReportId != 27) {
            data.FilterQuery = data.FilterQuery + " AND (L.PlateNumber LIKE %" + data.PlateNumber + "%)";
        }
        if (data.TransactionId != "0" && data.ReportId != 27) {
            data.FilterQuery = data.FilterQuery + " AND (L.MasterTransactionId = '" + data.TransactionId + "' OR L.PlazaTransactionId = '" + data.TransactionId + "' OR L.LaneTransactionId = '" + data.TransactionId + "')";
        }
        const pool = await database.getPool();
        result = await pool.request()
            .input('CategoryId', sql.SmallInt, data.CategoryId)
            .input('ReportId', sql.SmallInt, data.ReportId)
            .input('StartDateTime', sql.VarChar(50), data.StartDateTime)
            .input('EndDateTime', sql.VarChar(50), data.EndDateTime)
            .input('ShiftFilterList', sql.VarChar(4000), data.ShiftFilterList)
            .input('TCUserFilterList', sql.VarChar(4000), data.TCUserFilterList)
            .input('PlazaFilterList', sql.VarChar(4000), data.PlazaFilterList)
            .input('LaneFilterList', sql.VarChar(4000), data.LaneFilterList)
            .input('VehicleClassFilterList', sql.VarChar(4000), data.VehicleClassFilterList)
            .input('VehicleSubClassFilterList', sql.VarChar(4000), data.VehicleSubClassFilterList)
            .input('TransactionTypeFilterList', sql.VarChar(4000), data.TransactionTypeFilterList)
            .input('AuditerFilterList', sql.VarChar(4000), data.AuditerFilterList)
            .input('PlateNumber', sql.VarChar(20), data.PlateNumber)
            .input('TransactionId', sql.VarChar(50), data.TransactionId)
            .input('FilterQuery', sql.VarChar(4000), data.FilterQuery)
            .execute('USP_GetReportData');

        if (result.recordsets.length > 1) {
            const headerData = result.recordset[0]
            const ReportData = result.recordsets[1]
            const ReportDataList = result.recordsets
            const ReportName = generateReceiptNumber(headerData.ReportType)
            if (data.ReportId == 23 || data.ReportId == 27 || data.ReportId == 31 || data.ReportId == 11 || data.ReportId == 13 || data.ReportId == 16) {
                reports.generateDateWiseCountPdf(data.GeneratedBy, headerData, ReportDataList, ReportName)
            }
            else if (data.ReportId == 22 || data.ReportId == 30 || data.ReportId == 32) {
                if (ReportData.length > 0) {
                    reports.generateTransPdf(data.GeneratedBy, headerData, ReportData, ReportName)
                }
                else {
                    let out = constants.ResponseMessage("No record found", null);
                    res.status(200).json(out)
                }
            }
            else if (data.ReportId == 6 || data.ReportId == 7) {
                reports.generateAVCPdf(data.GeneratedBy, headerData, ReportDataList, ReportName)
            }
            else if(data.ReportId == 9){
                reports.generateCashUpPdf(data.GeneratedBy, headerData, ReportDataList, ReportName)
            }
            else if (data.ReportId == 33) {
                reports.generateMisPdf(data.GeneratedBy, headerData, ReportDataList, ReportName)
            }
            else {
                if (ReportData.length > 0) {
                    reports.generateTransLandPdf(data.GeneratedBy, headerData, ReportData, ReportName)

                }
                else {
                    let out = constants.ResponseMessage("No record found", null);
                    res.status(200).json(out)
                }
            }
            let out = constants.ResponseMessage(ReportName, result.recordset);
            res.status(200).json(out)
            // if (result.recordsets[1].length > 0) {
            //     const ReportName = generateReceiptNumber(headerData.ReportType)
            //     if(data.ReportId==23 || data.ReportId==27  || data.ReportId==31 || data.ReportId==11 || data.ReportId==13 || data.ReportId==16){
            //         reports.generateDateWiseCountPdf(data.GeneratedBy, headerData,ReportDataList, ReportName)
            //     }
            //     else if(data.ReportId==22 || data.ReportId==30 || data.ReportId==32){
            //         reports.generateTransPdf(data.GeneratedBy, headerData,ReportData, ReportName)
            //     }
            //     else if (data.ReportId==6 || data.ReportId==7){
            //         reports.generateAVCPdf(data.GeneratedBy, headerData,ReportDataList, ReportName)
            //     }
            //     else if (data.ReportId==33){
            //         reports.generateTransLandPdf(data.GeneratedBy, headerData,ReportDataList, ReportName)
            //     }
            //     else{
            //         reports.generateTransLandPdf(data.GeneratedBy, headerData,ReportData, ReportName)
            //     }
            //     let out = constants.ResponseMessage(ReportName, result.recordset);
            //     res.status(200).json(out)
            // }
            // else {
            //     let out = constants.ResponseMessage("No record found", null);
            //     res.status(200).json(out)
            // }
        }
        else {
            let out = constants.ResponseMessage("No record found", null);
            res.status(200).json(out)
        }
    } catch (error) {
        errorlogMessage(error, 'ReportProcess');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
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


function generateReceiptNumber(name) {
    const timestamp = Date.now(); // Get current timestamp
    const random = Math.floor(Math.random() * 10000); // Generate random number between 0 and 9999
    const receiptNumber = `${name.replace(/\s/g, '')}_${timestamp}.pdf`; // Concatenate timestamp and padded random number
    return receiptNumber; // Ensure the length is 20 characters
}