const ffmpeg = require('fluent-ffmpeg');
const stream = require('stream');
const express = require('express');
const app = express();
const cors = require('cors');
const path = require('path');
const { proxy } = require('rtsp-relay')(app);
const configManagerPath = path.resolve('configManager');
const corsOpts = require(path.join(configManagerPath, 'configCros.json'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors(corsOpts));
app.set("trust proxy", true);
const logger = require('./_helpers/logger');
const activeStreams = [];
//Route
let apiPrefix = '/Softomation/FastTrackHighway-TMS/'
let laneApiPrefix = '/Softomation/FTH-TMS-RSD/'
app.use('/EventMedia', express.static('EventMedia/'));
app.use(apiPrefix, require('./_routers/commonRoute'));
app.use(apiPrefix, require('./_routers/dashboardRoute'));
app.use(apiPrefix, require('./_routers/dbBackup'));
app.use(apiPrefix, require('./_routers/userRoute'));
app.use(apiPrefix, require('./_routers/rolesRoute'));
app.use(apiPrefix, require('./_routers/manufacturerRoute'));
app.use(apiPrefix, require('./_routers/systemIntegratorRoute'));
app.use(apiPrefix, require('./_routers/plazaRoute'));
app.use(apiPrefix, require('./_routers/icdConfig'));
app.use(apiPrefix, require('./_routers/vehicleClassRoute'));
app.use(apiPrefix, require('./_routers/tollFareRoute'));
app.use(apiPrefix, require('./_routers/laneRoute'));
app.use(apiPrefix, require('./_routers/transactionTypeRoute'));
app.use(apiPrefix, require('./_routers/paymentTypeRoute'));
app.use(apiPrefix, require('./_routers/exemptTypeRoute'));
app.use(apiPrefix, require('./_routers/equipmentRoute'));
app.use(apiPrefix, require('./_routers/floatProcessRoute'));
app.use(apiPrefix, require('./_routers/shiftRoute'));
app.use(apiPrefix, require('./_routers/transactionRoute'));
app.use(apiPrefix, require('./_routers/fasTagProcessRoute'));
app.use(apiPrefix, require('./_routers/reportRoute'));
app.use(apiPrefix, require('./_routers/cameraRoute'));
app.use(apiPrefix, require('./_routers/keyBoardRoute'));
//app.use(apiPrefix, require('./_routers/cameraRoutes'));
app.use(laneApiPrefix, require('./_routers/laneTransactionRoute'));
app.use(laneApiPrefix, require('./_routers/laneMasterDataRoute'));
app.get("/", (request, response) => {
   const status = {
      "Status": "Running"
   };
   response.send(status);
});

app.get('/video/:rtpsurl', (req, res) => {
   var input=req.params
   const rtspUrl=input['rtpsurl']
   console.log('RTSP URL:', rtspUrl);
   res.setHeader('Content-Type', 'multipart/x-mixed-replace; boundary=ffserver');
   const passThrough = new stream.PassThrough();
   const command = ffmpeg(rtspUrl)
       .inputOptions('-rtsp_transport', 'tcp')  // Use TCP for the RTSP transport
       .outputFormat('mjpeg')                   // Convert the output format to MJPEG
       .on('stderr', function(stderrLine) {
           console.log('FFmpeg Stderr output: ' + stderrLine);
       })
       .on('error', (err) => {
           console.error('Error during video stream processing: ' + err.message);
           passThrough.end();
       });

   command.pipe(res, { end: true });

   res.on('close', () => {
       console.log('Client closed the connection.');
       command.kill(); 
       passThrough.end();
   });
});

app.ws('/frame/:rtpsurl', (ws, req) => {
   let streamId;
   rtpsurl = req.params.rtpsurl
   if (activeStreams.length === 0) {
      streamId = addCameraStream(rtpsurl, false);
   } else {
      const index = activeStreams.findIndex(e => e.rtpsurl === rtpsurl);
      if (index < 0) {
         streamId = addCameraStream(rtpsurl, false);
      } else {
         streamId = index;
      }
   }
   const stream = activeStreams[streamId];
   const relay = proxy({
      transport: 'tcp',
      verbose: false,
      url: rtpsurl,
   });

   relay(ws).on('error', (err) => {
      logMessage(`Stream relay error: ${err.message}`);
   });

   ws.on('close', () => {
      ws.terminate(); // Terminate the WebSocket connection
      removeCameraStream(streamId);
   });
});

function addCameraStream(rtpsurl, proxystart) {
   const stream = { rtpsurl, proxystart };
   activeStreams.push(stream);
   return activeStreams.length - 1; // Return the stream ID
}

function removeCameraStream(streamId) {
   if (streamId >= 0 && streamId < activeStreams.length) {
      activeStreams.splice(streamId, 1);
   }
}

function logMessage(msg) {
   console.log(msg)
   logger.info(msg);
   logger.warn(msg);
   logger.error(msg);
}

let port = process.env.PORT || 5001;
let host = process.env.Host || "0.0.0.0";
app.listen(port, host, () => logMessage('Server listening on port ' + port));