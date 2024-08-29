const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const reports = require('../_reports/reportmaster');
const sql = require('mssql');
const moment = require('moment');


router.post('/FloatProcessSetUp', FloatProcessSetup);
router.get('/FloatProcessGetAll', FloatProcessGetAll);
router.get('/FloatProcessGetById', FloatProcessGetById);

module.exports = router;

async function FloatProcessSetup(req, res, next) {
    try {
        const array = req.body.FloatProcessDenominationList;
        const table = new sql.Table('temp_DenominationDetails');
        table.create = true;
        table.columns.add('DenominationId', sql.SmallInt, { nullable: false });
        table.columns.add('DenominationValue', sql.SmallInt, { nullable: false });
        table.columns.add('DenominationCount', sql.SmallInt, { nullable: false });
        table.columns.add('SessionId', sql.VarChar(20), { nullable: false });
        for (let i = 0; i < array.length; i++) {
            table.rows.add(parseInt(array[i].DenominationId), array[i].DenominationValue, array[i].DenominationCount, req.body.ReceiptNumber);
        }
        const pool = await database.getPool();
        const resultU = await pool.request().bulk(table);
        const currentDateTime = new Date();
        const result = await pool.request().input('FloatProcessId', sql.BigInt, req.body.FloatProcessId)
            .input('PlazaId', sql.SmallInt, req.body.PlazaId)
            .input('LaneId', sql.SmallInt, req.body.LaneId)
            .input('ShiftId', sql.SmallInt, req.body.ShiftId)
            .input('FloatTransactionTypeId', sql.SmallInt, req.body.FloatTransactionTypeId)
            .input('TransactionDate', sql.VarChar(20), req.body.TransactionDateStamp)
            .input('TransactionAmount', sql.Decimal, req.body.TransactionAmount)
            .input('ReceiptNumber', sql.VarChar(20), req.body.ReceiptNumber)
            .input('AssignedBy', sql.BigInt, req.body.AssignedBy)
            .input('AssignedTo', sql.BigInt, req.body.AssignedTo)
            .input('LaneTransactionCount', sql.BigInt, req.body.LaneTransactionCount)
            .input('DataStatus', sql.SmallInt, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, currentDateTime)
            .input('ModifiedDate', sql.DateTime, currentDateTime)
            .execute('USP_FloatProcessInsertUpdate');
        const ds = result.recordsets;
        let out = constants.ResponseMessageList(ds[0], null);
        if (req.body.FloatTransactionTypeId >= 3 && req.body.FloatTransactionTypeId <= 6) {
            let returnMessage = out.Message[0].AlertMessage;
            if (returnMessage.indexOf('success') > -1) {
                generateReceipt(req.body, ds[1]);
            }
        }
        res.status(200).json(out);
    } catch (error) {
        errorlogMessage(error, 'FloatProcessSetUp');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out)
    }
}

async function FloatProcessGetAll(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().execute('USP_FloatProcessGetAll');
        
        var dataresult = [];
        let dataarray = result.recordset;
        for (let index = 0; index < dataarray.length; index++) {
            //const d=await Getdata(dataarray[index]);
            dataresult.push(await Getdata(dataarray[index]));
        }
        let out = constants.ResponseMessage("success", dataresult);
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'FloatProcessGetAll');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FloatProcessGetById(req, res, next) {
    try {
        const FloatProcessId = req.query.FloatProcessId | 0;
        const pool = await database.getPool();
        result = await pool.request().input('FloatProcessId', sql.Int, FloatProcessId)
            .execute('USP_FloatProcessGetById');
        
        if (result.recordset == []) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            data = await Getdata(result.recordset[0]);
            let out = constants.ResponseMessage("success", data);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'FloatProcessGetById');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function FloatProcessDenominationDetails(FloatProcessId) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('FloatProcessId', sql.BigInt, FloatProcessId).execute('USP_FloatProcessDenominationGetById');
        
        return result.recordset;
    } catch (error) {
        throw error;
    }

}

async function Getdata(dataarray) {
    try {
        const data = {
            FloatProcessId: dataarray.FloatProcessId,
            PlazaId: dataarray.PlazaId,
            PlazaName: dataarray.PlazaName,
            LaneId: dataarray.LaneId,
            LaneNumber: "Lane-" + dataarray.LaneNumber,
            ShiftId: dataarray.ShiftId,
            ShiftNumber: "Shift-" + dataarray.ShiftId,
            ShiftTimining: dataarray.StartTimmng + "-" + dataarray.EndTimming,
            FloatTransactionTypeId: dataarray.FloatTransactionTypeId,
            FloatTransactionTypeName: dataarray.FloatTransactionTypeName,
            TransactionDate: dataarray.TransactionDate,
            TransactionDateStamp: moment(dataarray.TransactionDate).format('DD-MMM-YYYY HH:mm:ss'),
            TransactionAmount: dataarray.TransactionAmount,
            ReceiptNumber: dataarray.ReceiptNumber,
            AssignedBy: dataarray.AssignedBy,
            AssignedByLoginId: dataarray.AssignedByLoginId,
            AssignedTo: dataarray.AssignedTo,
            AssignedToLoginId: dataarray.AssignedToLoginId,
            DataStatus: dataarray.DataStatus,
            CreatedDate: dataarray.CreatedDate,
            CreatedBy: dataarray.CreatedBy,
            ModifiedDate: dataarray.ModifiedDate,
            ModifiedBy: dataarray.ModifiedBy,
            FloatProcessDenominationList: await FloatProcessDenominationDetails(dataarray.FloatProcessId),
        }
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

function generateReceipt(input, headerDetails) {
    jsonData = headerDetails[0];
    const pdfName = input.ReceiptNumber + ".pdf";
    const tableRows = input.FloatProcessDenominationList.map(item => {
        const total = item.DenominationValue * item.DenominationCount;
        return [
            { text: '₹' + item.DenominationValue.toString(), alignment: 'right' },
            { text: item.DenominationCount.toString(), alignment: 'right' },
            { text: '₹' + total.toString(), alignment: 'right' }
        ];
    });
    const totalAmount = input.FloatProcessDenominationList.reduce((acc, item) => {
        return acc + (item.DenominationValue * item.DenominationCount);
    }, 0);
    const totalRow = [
        { text: 'Total', colSpan: 2, alignment: 'right', bold: true },
        {},
        { text: '₹' + totalAmount.toString(), alignment: 'right', bold: true }
    ];

    let tab = {
        headerRows: 1,
        widths: ['*', '*', '*'],
        body: [
            [{ text: 'Denomination', style: 'tableHeader' }, { text: 'Count', style: 'tableHeader' }, { text: 'Total', style: 'tableHeader' }],
            ...tableRows,
            totalRow
        ]
    }
    reports.generateFloatPdf(jsonData["FloatType"]+" Receipt", input["GeneratedBy"], tab, jsonData, pdfName);
}