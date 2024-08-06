const Onvif_old = require('onvif');
const Onvif = require('node-onvif');
const logger = require('../_helpers/logger');
const express = require('express');
const router = express.Router();
router.get('/getAllCameraDetails', getAllCameraDetails);
router.get('/getAllCameras_o', getAllCameras);
router.post('/getDetailsByCamera_o', getDetailsByCamera);

async function getAllCameraDetails(req, res, next) {
    try {
        // Initialize the library
        Onvif_old.Discovery.on('device', (device) => {
            logger.info(`Found device: ${device.name}`);
        });

        const cameras = await new Promise((resolve, reject) => {
            Onvif_old.Discovery.probe((err, cams) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(cams);
                }
            });
        });

        if (cameras.length === 0) {
            logger.info('No ONVIF cameras found.');
        }

        res.json(cameras);
    } catch (error) {
        logger.error('Error discovering cameras:', error);
        res.status(500).send('Error discovering cameras');
    }
}

// Discover ONVIF devices on the network
async function getAllCameras(req, res, next) {
    try {
        const devices = await Onvif.startProbe();
        logger.info(`Found ${devices.length} devices.`);
        res.json(devices);
    } catch (error) {
        logger.error('Error discovering cameras:', error);
        res.status(500).send('Error discovering cameras');
    }
}


// Endpoint to get details of a specific camera
async function getDetailsByCamera(req, res, next) {
    const { ip: cameraIp, port = 80, user = 'admin', password = '' } = req.body;
  
    if (!cameraIp) {
      return res.status(400).send('Camera IP is required');
    }
  
    try {
      const device = new Onvif.OnvifDevice({
        xaddr: `http://${cameraIp}:${port}/onvif/device_service`,
        user,
        pass: password
      });
  
      await device.init();
  
      // Get device information
      const details = {
        manufacturer: device.information.Manufacturer,
        model: device.information.Model,
        firmwareVersion: device.information.FirmwareVersion,
        serialNumber: device.information.SerialNumber,
        hardwareId: device.information.HardwareId,
        macAddress: "",
        rtspUrls: [], // Initialize as an empty array
        streams: [] // Initialize as an empty array
      };
  
      // Get the network interfaces to fetch MAC address
      const networkInterfaces = await device.services.device.getNetworkInterfaces();
      if (networkInterfaces && networkInterfaces.data && networkInterfaces.data.GetNetworkInterfacesResponse) {
        const interfaces = networkInterfaces.data.GetNetworkInterfacesResponse.NetworkInterfaces;
        if (interfaces.length > 0 && interfaces[0].Info) {
          details.macAddress = interfaces[0].Info.MACAddress || interfaces[0].Info.HwAddress;
        } else if (interfaces.Info) {
          details.macAddress = interfaces.Info.MACAddress || interfaces.Info.HwAddress;
        }
      }
  
      // Get the media profiles and video encoder configurations
      const profilesResponse = await device.services.media.getProfiles();
      const encoderConfigsResponse = await device.services.media.getVideoEncoderConfigurations();
  
      const mediaProfiles = profilesResponse?.data?.GetProfilesResponse?.Profiles || [];
      const encoderConfigs = encoderConfigsResponse?.data?.GetVideoEncoderConfigurationsResponse?.Configurations || [];
  
      // Create a map for video encoder configurations based on tokens
      const encoderConfigMap = new Map();
      encoderConfigs.forEach(config => {
        if (config.$.token.startsWith('VEncTok')) {
          encoderConfigMap.set(config.$.token, config);
        }
      });
  
      // Create a list of profiles with associated configurations
      for (const profile of mediaProfiles) {
        if (profile.$.token.startsWith('ProfTok')) {
          // Fetch RTSP URL
          const streamUri = await device.services.media.getStreamUri({
            ProfileToken: profile.$.token,
            Protocol: 'RTSP'
          });
  
          if (streamUri && streamUri.data && streamUri.data.GetStreamUriResponse) {
            const uri = new URL(streamUri.data.GetStreamUriResponse.MediaUri.Uri);
            uri.username = user;
            uri.password = password;
  
            const rtspUrl = uri.toString();
  
            // Get the corresponding video encoder configuration
            // Assuming profile token and encoder token are associated in a specific way, e.g., by an index or mapping
            let encoderConfig = null;
            for (const [key, config] of encoderConfigMap.entries()) {
              // Logic to match encoderConfig with profile
              // You might need specific logic to match profile and encoderConfig if not directly mappable
              encoderConfig = config; // Example logic; adjust as needed
            }
  
            if (encoderConfig) {
              const resolution = encoderConfig.Resolution;
              const fps = encoderConfig.RateControl.FrameRateLimit;
  
              details.rtspUrls.push({
                profileName: profile.Name,
                rtspUrl
              });
  
              details.streams.push({
                profileName: profile.Name,
                resolution: `${resolution.Width}x${resolution.Height}`,
                fps
              });
            } else {
              logger.debug(`No encoder configuration found for profile token ${profile.$.token}`);
            }
          }
        }
      }
  
      res.json(details);
    } catch (error) {
      logger.error(`Error getting camera details for ${cameraIp}:`, error);
      res.status(500).send(`Error getting camera details for ${cameraIp}`);
    }
  }

module.exports = router;
