const express = require('express');
const constants = require("../_helpers/constants");
const xml2js = require('xml2js');
const router = express.Router();
// XML Parser configuration
const xmlParser = new xml2js.Parser({ 
    explicitArray: false,  // Prevent creating arrays for single elements
    trim: true,            // Trim whitespace
    explicitRoot: false,   // Don't keep root element
    mergeAttrs: true       // Merge attributes into parent object
});

router.post('/response-plaza-details', plazaDetails);

function parsePlazaDetails(xmlData) {
    return new Promise((resolve, reject) => {
        xmlParser.parseString(xmlData, (err, result) => {
            if (err) {
                reject(err);
                return;
            }

            // Safely extract head information
            const head = result.Head || {};

            // Safely extract plaza information
            const plaza = result.PLaza || {};

            // Transform the parsed XML into a more structured format
            const plazaDetails = {
                messageId: head.msgId || '',
                orgId: head.orgId || '',
                timestamp: head.ts || '',
                version: head.ver || '',
                plaza: {
                    id: plaza.id || '',
                    name: plaza.name || '',
                    geoCode: plaza.geoCode || '',
                    type: plaza.type || '',
                    subtype: plaza.subtype || ''
                },
                laneDetails: plaza.LaneDetails 
                    ? ensureArray(plaza.LaneDetails.Lane).map(lane => ({
                        id: lane.id || '',
                        direction: ensureArray(lane.Detail).find(d => d.name === 'Direction')?.value || '',
                        readerID: ensureArray(lane.Detail).find(d => d.name === 'ReaderID')?.value || '',
                        laneStatus: ensureArray(lane.Detail).find(d => d.name === 'LaneStatus')?.value || '',
                        mode: ensureArray(lane.Detail).find(d => d.name === 'Mode')?.value || '',
                        laneType: ensureArray(lane.Detail).find(d => d.type === 'LaneType')?.value || ''
                    }))
                    : [],
                vehicleClasses: plaza.PlazaVehicleClass 
                    ? ensureArray(plaza.PlazaVehicleClass.VehicleClass).map(vc => ({
                        id: vc.id || '',
                        name: vc.name || '',
                        description: vc.Detail?.name === 'Description' ? vc.Detail.value : null
                    }))
                    : [],
                tollFareRules: plaza.TollFareRules && plaza.TollFareRules.FareType
                    ? ensureArray(plaza.TollFareRules.FareType).map(fareType => ({
                        id: fareType.id || '',
                        name: fareType.name || '',
                        vehicleClasses: fareType.VehicleClass 
                            ? ensureArray(fareType.VehicleClass).map(vc => ({
                                id: vc.id || '',
                                name: vc.name || '',
                                commercialVehicle: ensureArray(vc.Detail).find(d => d.name === 'COMVEHICLE')?.value || '',
                                amount: ensureArray(vc.Detail).find(d => d.name === 'amount')?.value || '',
                                currency: ensureArray(vc.Detail).find(d => d.name === 'Currency')?.value || ''
                            }))
                            : []
                    }))
                    : [],
                passSchemes: plaza.PassSchemes && plaza.PassSchemes.Pass
                    ? ensureArray(plaza.PassSchemes.Pass).map(pass => ({
                        id: pass.id || '',
                        name: pass.name || '',
                        vehicleClassId: ensureArray(pass.Detail).find(d => d.name === 'VehicleClassId')?.value || '',
                        passType: ensureArray(pass.Detail).find(d => d.name === 'PassType')?.value || '',
                        allowedTrips: ensureArray(pass.Detail).find(d => d.name === 'ALLOWEDTRIPS')?.value || '',
                        entryPlazaId: ensureArray(pass.Detail).find(d => d.name === 'ENTRYPLAZAID')?.value || '',
                        exitPlazaId: ensureArray(pass.Detail).find(d => d.name === 'EXITPLAZAID')?.value || '',
                        description: ensureArray(pass.Detail).find(d => d.name === 'Description')?.value || '',
                        amount: ensureArray(pass.Detail).find(d => d.name === 'Amount')?.value || '',
                        currency: ensureArray(pass.Detail).find(d => d.name === 'Currency')?.value || ''
                    }))
                    : []
            };

            resolve(plazaDetails);
        });
    });
}

async function plazaDetails(req, res) {
    try {
        const xmlData = req.body;
        const parsedDetails = await parsePlazaDetails(xmlData);
        const filePath = await constants.saveReceivedDataAsFile(xmlData);
        console.log(`Data saved to: ${filePath}`);
        res.json({
            status: 'success',
            data: parsedDetails
        });
    } catch (error) {
        console.error('XML Parsing Error:', error);
        res.status(400).json({
            status: 'error',
            message: 'Invalid XML format',
            error: error.message
        });
    }
}

module.exports = router;