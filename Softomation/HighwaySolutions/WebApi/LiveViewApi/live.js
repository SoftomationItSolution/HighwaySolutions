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

// Static files
app.use(express.static(path.join(__dirname, 'public')));

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
  console.log(msg);
  logger.info(msg);
  logger.warn(msg);
  logger.error(msg);
}

// Server
const port = process.env.PORT || 5002;
const host = process.env.Host || '0.0.0.0';
app.listen(port, host, () => logMessage(`Server listening on http://${host}:${port}`));
