const Onvif_old = require('onvif');
const Onvif = require('node-onvif');
const logger = require('../_helpers/logger');
const express = require('express');
const { resume } = require('pdfkit');
const router = express.Router();
router.get('/getAllCameraDetails', getAllCameraDetails);
router.get('/getAllCameras', getAllCameras);
router.post('/getDetailsByCamera', getDetailsByCamera);

async function getAllCameraDetails(req, res, next) {
    try {
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

async function get_macaddress(device) {
    try {
        const networkInterfaces = await device.services.device.getNetworkInterfaces();
        if (networkInterfaces && networkInterfaces.data && networkInterfaces.data.GetNetworkInterfacesResponse) {
            const interfaces = networkInterfaces.data.GetNetworkInterfacesResponse.NetworkInterfaces;
            if (interfaces.length > 0 && interfaces[0].Info) {
                return interfaces[0].Info.MACAddress || interfaces[0].Info.HwAddress;
            } else if (interfaces.Info) {
                return interfaces.Info.MACAddress || interfaces.Info.HwAddress;
            }
        }
    } catch (error) {
        logger.error(`Error getting camera macaddress for ${device.xaddr}:`, error);
    }
}

function get_encoding_details(profile) {
    let d = { Resolution: "", fps: 0, Encoding: "" }
    try {
        encoderConfig = profile.VideoEncoderConfiguration
        if (encoderConfig) {
            d.Resolution = encoderConfig.Resolution;
            d.fps = encoderConfig.RateControl.FrameRateLimit;
            d.Encoding = encoderConfig.Encoding

        }
    } catch (error) {
        logger.error(`Error getting camera media prodice for ${device.xaddr}:`, error);
    }
    finally {
        return d;
    }

}

async function get_media_details(device) {
    let StreamData = []
    try {
        // Get the media profiles and video encoder configurations
        const profilesResponse = await device.services.media.getProfiles();
        //const encoderConfigsResponse = await device.services.media.getVideoEncoderConfigurations();

        const mediaProfiles = profilesResponse?.data?.GetProfilesResponse?.Profiles || [];
        //const encoderConfigs = encoderConfigsResponse?.data?.GetVideoEncoderConfigurationsResponse?.Configurations || [];
        for (const profile of mediaProfiles) {
            let data = {
                profileName: profile.Name,
                streamUri: '',
                rtspUrl: "",
                Resolution: "", 
                fps: 0, 
                Encoding: ""
            }
            const streamUri = await device.services.media.getStreamUri({
                ProfileToken: profile.$.token,
                Protocol: 'RTSP'
            });
            data.streamUri = streamUri.data.GetStreamUriResponse.MediaUri.Uri
            if (streamUri && streamUri.data && streamUri.data.GetStreamUriResponse) {
                const uri = new URL(streamUri.data.GetStreamUriResponse.MediaUri.Uri);
                uri.username = device.user;
                uri.password = device.pass;
                const rtspUrl = uri.toString();
                data.rtspUrl = rtspUrl;
            }
            result=get_encoding_details(profile)
            data.Encoding=result.Encoding;
            data.Resolution=result.Resolution;
            data.fps=result.fps;
            StreamData.push(data);
        }
    } catch (error) {
        logger.error(`Error getting camera media prodice for ${device.xaddr}:`, error);
    }
    finally {
        return StreamData;
    }
}

// Endpoint to get details of a specific camera
async function getDetailsByCamera(req, res, next) {
    const requested_data = req.body;
    // const { ip: cameraIp, port = 80, user = 'admin', password = '' } = req.body;
    // if (!cameraIp) {
    //     return res.status(400).send('Camera IP is required');
    // }
    // else if (!password) {
    //     return res.status(400).send('Camera password is required');
    // }
    try {
        const device = new Onvif.OnvifDevice({ xaddr: requested_data.xaddrs, user: requested_data.userId, pass: requested_data.password });

        await device.init();

        // Get device information
        const details = {
            manufacturer: device.information.Manufacturer,
            model: device.information.Model,
            firmwareVersion: device.information.FirmwareVersion,
            serialNumber: device.information.SerialNumber,
            hardwareId: device.information.HardwareId,
            macAddress: "",
            profileDetails: []
        };
        details.macAddress = await get_macaddress(device);
        details.profileDetails = await get_media_details(device);
        res.json(details);
    } catch (error) {
        logger.error(`Error getting camera details for ${requested_data.xaddrs}:`, error);
        res.status(500).send(`Error getting camera details for ${requested_data.xaddrs}`);
    }
}

module.exports = router;