const express = require('express');
const app = express();
const cors = require('cors');
const path = require('path');
const http = require('http');
const WS = require('ws');  // ✅ add this
const { proxy } = require('rtsp-relay')(app);

const configManagerPath = path.resolve('configManager');
const corsOpts = require(path.join(configManagerPath, 'configCros.json'));

const server = http.createServer(app);
require('express-ws')(app, server);

const wsClients = new Set();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors(corsOpts));
app.set("trust proxy", true);

const logger = require('./_helpers/logger');
const activeStreams = [];

// Static files
app.use(express.static(path.join(__dirname, 'public')));

// ---- WebSocket chat ----
app.ws('/ws', (ws) => {
   console.log(`WebSocket client connected`);
   wsClients.add(ws);

   ws.on('message', (msg) => {
      console.log(`[SERVER] Received: ${msg}`);

      // Broadcast to all OTHER clients (skip the sender)
      wsClients.forEach((client) => {
         if (client !== ws && client.readyState === WS.OPEN) {
            client.send(msg);
         }
      });
   });

   ws.on('close', () => {
      wsClients.delete(ws);
      console.log(`WebSocket client disconnected`);
   });
});

// ---- Broadcast helper ----
app.set('broadcast', (data) => {
   const msg = JSON.stringify(data);
   wsClients.forEach((client) => {
      if (client.readyState === WS.OPEN) {
         client.send(msg);
      }
   });
});

// ---- RTSP relay ----
app.ws('/frame/:rtpsurl', (ws, req) => {
   const rtpsurl = req.params.rtpsurl;   // ✅ fixed
   let streamId;

   const index = activeStreams.findIndex(e => e.rtpsurl === rtpsurl);
   if (index < 0) {
      streamId = addCameraStream(rtpsurl, false);
   } else {
      streamId = index;
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
      ws.terminate();
      removeCameraStream(streamId);
   });
});

function addCameraStream(rtpsurl, proxystart) {
   const stream = { rtpsurl, proxystart };
   activeStreams.push(stream);
   return activeStreams.length - 1;
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

// ---- Server ----
const port = process.env.PORT || 5001;
const host = process.env.Host || '0.0.0.0';
server.listen(port, host, () => logMessage(`Server listening on http://${host}:${port}`));
