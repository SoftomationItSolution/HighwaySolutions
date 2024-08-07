
const express = require('express');
const router = express.Router();
const moment = require('moment');
const fs = require('fs');
const sql = require('mssql');
const database = require('../_helpers/dbSingleton');
const token = require("../_helpers/jwtToken");
const crypto = require("../_helpers/crypto");
const constants = require("../_helpers/constants");
const path = require('path');
const {root_path,pc_path} = require("../_helpers/constants");
const pc_Directory = path.join(root_path, pc_path);
const logger = require('../_helpers/logger');



// router.post('/ValidateUser', ValidateUser);
// router.post('/LogoutUser', LogoutUser);
// router.post('/RolePermissionGetByMenu', RolePermissionGetByMenu);
// router.post('/SystemSettingSetup', SystemSettingSetup);
// router.post('/UpdateProjectConfig', UpdateProjectConfig);

// router.get('/DataStatusMasterGetAll', DataStatusMasterGetAll);
// router.get('/GetMenu', GetMenu);
// router.get('/ProjectConfigGet', ProjectConfigGet);
// router.get('/SystemSettingGet', SystemSettingGet);
// router.get('/DenominationGetActive', DenominationGetActive);
// router.get('/FilterMasterGet', FilterMasterGet);
// router.get('/GetReportCategory', GetReportCategory);
// router.get('/GetReportCategoryById', GetReportCategoryById);

module.exports = router;


function errorlogMessage(error, method) {
    try {
        logger.error(`Caught an error in :${method} : ${error.message}`);
        logger.error(error.stack);
    }
    catch (error) {
        logger.error(`Caught an error in :${method}`);
    }
}