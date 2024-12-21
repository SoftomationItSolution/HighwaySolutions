const express = require('express');
//const xml2js = require('xml2js');
// const fs = require('fs');
// const path = require('path');
const bodyParser = require('body-parser');
const logger = require('./_helpers/logger');

const app = express();

// Middleware to parse XML bodies
app.use(bodyParser.text({ type: 'application/xml' }));

function logMessage(msg) {
    console.log(msg)
    logger.info(msg);
    logger.warn(msg);
    logger.error(msg);
 }

let apiPrefix = '/cch/FastTrackHighway-TMS/'
app.use(apiPrefix, require('./_routers/checkTransactionStatus'));
app.use(apiPrefix, require('./_routers/getExceptionList'));
app.use(apiPrefix, require('./_routers/heartBeat'));
app.use(apiPrefix, require('./_routers/participants'));
app.use(apiPrefix, require('./_routers/passSchema'));
app.use(apiPrefix, require('./_routers/plazaDetails'));
app.use(apiPrefix, require('./_routers/responsePay'));
app.use(apiPrefix, require('./_routers/responseTagDetails'));
app.use(apiPrefix, require('./_routers/timeSync'));
app.get("/", (request, response) => {
    const status = {
       "Status": "Running"
    };
    response.send(status);
 });
let port = process.env.PORT || 5002;
let host = process.env.Host || "0.0.0.0";
app.listen(port, host, () => logMessage('Server listening on port ' + port));

module.exports = app;