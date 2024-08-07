const express = require('express');
const cors = require('cors');
const path = require('path');
const bodyParser = require('body-parser');
const xml2js = require('xml2js');
const configManagerPath = path.resolve('configManager');
const corsOpts = require(path.join(configManagerPath, 'configCros.json'));
const logger = require('./_helpers/logger');
const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(cors(corsOpts));
app.use(bodyParser.text({ type: 'application/xml' }));
let apiPrefix = '/Softomation/FastTrackHighway-ICD-2.5/'


function logMessage(msg) {
    console.log(msg)
    logger.info(msg);
    logger.warn(msg);
    logger.error(msg);
 }
 
 let port = process.env.PORT || 5002;
 let host = process.env.Host || "0.0.0.0";
 app.listen(port, host, () => logMessage('IDC 2.5 Server listening on port ' + port));