const express = require('express');
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const constants = require("../_helpers/constants");
const logger = require('../_helpers/logger');
const sql = require('mssql');
const mqttClient = require('../_helpers/mqttHandler');
router.post('/TollFareSetUp', TollFareSetUp);

router.get('/TollFareGetByEffectedFrom', TollFareGetByEffectedFrom);


module.exports = router;

async function TollFareSetUp(req, res, next) {
    try {
        const currentDateTime = new Date();
        const SessionId = constants.RandonString(10)
        const array = req.body.TollFareConfigurations;
        const table = new sql.Table('temp_TollFareConfiguration');
        table.create = true;
        table.columns.add('JourneyId', sql.BigInt, { nullable: false });
        table.columns.add('SystemVehicleClassId', sql.SmallInt, { nullable: false });
        table.columns.add('SubVehicleClassId', sql.SmallInt, { nullable: false });
        table.columns.add('TollFare', sql.Float, { nullable: false });
        table.columns.add('ReturnFare', sql.Float, { nullable: false });
        table.columns.add('FasTagPenalty', sql.Float, { nullable: false });
        table.columns.add('OverweightPenalty', sql.Float, { nullable: false });
        table.columns.add('MonthlyPass', sql.Float, { nullable: false });
        table.columns.add('SessionId', sql.VarChar(20), { nullable: false });
        for (let i = 0; i < array.length; i++) {
            table.rows.add(
                parseInt(array[i].JourneyId),
                parseInt(array[i].SystemVehicleClassId),
                parseInt(array[i].SubVehicleClassId),
                parseFloat(array[i].TollFare),
                parseFloat(array[i].ReturnFare),
                parseFloat(array[i].FasTagPenalty),
                parseFloat(array[i].OverweightPenalty),
                parseFloat(array[i].MonthlyPass),
                SessionId);
        }
        const pool = await database.getPool();
        const resultU = await pool.request().bulk(table);
        result = await pool.request().input('EffectedFrom', sql.VarChar(20), req.body.EffectedFrom)
            .input('SessionId', sql.VarChar(20), SessionId)
            .input('DataStatus', sql.Int, req.body.DataStatus)
            .input('CreatedBy', sql.Int, req.body.CreatedBy)
            .input('ModifiedBy', sql.Int, req.body.CreatedBy)
            .input('CreatedDate', sql.DateTime, currentDateTime)
            .input('ModifiedDate', sql.DateTime, currentDateTime)
            .execute('USP_TollFareSetup');
        
        let out = constants.ResponseMessageList(result.recordset, null);
        pubData(out)
        res.status(200).json(out)
    } catch (error) {
        errorlogMessage(error, 'TollFareSetUp');
        let out = constants.ResponseMessage(error.message, null);
        res.status(400).json(out);
    }
}

async function TollFareGetByEffectedFrom(req, res, next) {
    try {
        const pool = await database.getPool();
        result = await pool.request().input('EffectedFrom', sql.Date, req.query.EffectedFrom)
            .execute('USP_TollFareGetByEffectedFrom');
        
        if (result.recordset == [] || result.recordset.length==0) {
            let out = constants.ResponseMessage("No data found", null);
            res.status(200).json(out);
        }
        else {
            let mainTable = result.recordset[0];
            let ResponseData = {
                TollFareId: mainTable.TollFareId,
                EffectedFrom: mainTable.EffectedFrom,
                CreatedDate: mainTable.CreatedDate,
                CreatedBy: mainTable.CreatedBy,
                ModifiedDate: mainTable.ModifiedDate,
                ModifiedBy: mainTable.ModifiedBy,
                DataStatus: mainTable.DataStatus,
                DataStatus: mainTable.DataStatus,
                TollFareConfigurations: result.recordsets[1]
            }
            //result.recordsets[0].TollFareConfigurations=result.recordsets[1];
            let out = constants.ResponseMessage("success", ResponseData);
            res.status(200).json(out);
        }
    } catch (error) {
        errorlogMessage(error, 'TollFareGetByEffectedFrom');
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

function pubData(out){
    try {
     if(out.Message[0].AlertMessage=='success'){
         let d={ "update": "fare","data": JSON.parse(out.Message[0].AlertData)}
         constants.MqttpublishData(mqttClient,'system/update',d)
     }
    } catch (error) {
     errorlogMessage(error, 'TollFareSetUp_pubData');
    }
 }