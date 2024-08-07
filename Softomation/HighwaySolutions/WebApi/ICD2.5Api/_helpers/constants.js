const fs = require('fs').promises;
const crypto = require('crypto');
const e = require('express');

const AppProvider = "Softomation";
const mkdirp = require('mkdirp');
const issuer = "http://www.softomation.com";
const passPhrase = "$0ft0m@ti0n";//Pas5pr@se        // can be any string
const saltValue = "HP5502@$";//s@1tValue        // can be any string
const hashAlgorithm = "SHA1";             // can be "MD5"
const passwordIterations = 2;                  // can be any number
const initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes
const keySize = 256;                // can be 192 or 128
const JWTkey = AppProvider + "HighwaySoluationsProvider";
const os = require('os');
//console.log(os.platform())
const root_path  = os.platform() === 'win32' ? 'C:\\ProjectConfig\\TMSv1\\' : '/home/ProjectConfig/TMSv1/';
//console.log(root_path )

const log_path = 'log/BackOfficeAPI/'
const db_path = 'MasterConfig/NodeDBConfiguration.json'
const pc_path = 'MasterConfig/ProjectConfiguration.json'
//#endregion

const TollingType =
{
    Normal: 0,
    AccessControl: 1,
    FreeFlow: 2
};

const AppUserType =
{
    SysAdmin: 0,
    Administrator: 1,
    Manager: 2,
    Auditor: 3,
    TollCollector: 4,
    Maintenance: 5
};
const LaneType =
{
    Dedicated: 0,
    Hybrid: 1,
    Handheld: 2
};
const LaneStatusType =
{
    Open: 0,
    Close: 1
};
const LaneModeType =
{
    Maintenance: 0,
    Normal: 1
};
const LanePointType =
{
    Normal: 0,
    Entry: 1,
    Exit: 2
};
const LanePositionType =
{
    LHS: 0,
    RHS: 1
};
const LaneDirectionType =
{
    East: 1,
    West: 2,
    North: 3,
    South: 4,
    North_East: 5,
    North_West: 6,
    South_West: 7,
    South_East: 8
};
const ICDRequestStatusType =
{
    Generated: 0,
    Send: 1,
    Received: 2,
    Send_Error: 3,
    Received_Error: 4
};

const ICDDirectionType =
{
    E: 1,
    W: 2,
    N: 3,
    S: 4
};
const ICDLaneStatusType =
{
    OPEN: 1,
    CLOSE: 2
};
const ICDLaneModeType =
{
    Maintenance: 1,
    Normal: 2
};
const ICDLaneType =
{
    Dedicated: 1,
    Hybrid: 2,
    Handheld: 3
};

const ICDRequestPayTxnType =
{
    DEBIT: 1,
    CREDIT: 2,
    NON_FIN: 3
};

const ICDSignAuthType =
{
    VALID: 1,
    INVALID: 2,
    NOT_VERIFIED: 3
};

const ICDTagVerifiedType =
{
    NETC_TAG: 1,
    NON_NETC_TAG: 2
};

const ICDVehicleAuthType =
{
    YES: 1,
    NO: 2,
    UNKNOWN: 3
};
const ICDTxnStatusType =
{
    SUCCESS: 1,
    FAILED: 2
};
const ICDPriceModeType =
{
    DISTANCE: 1,
    POINT: 2,
    CUSTOM: 3
};
const ICDPaymentModeType =
{
    Tag: 1,
    Cash: 2,
    Card: 3,
    QRCode: 4,
    Other: 5
};
const ICDFareType =
{
    DISCOUNTED: 1,
    EXEMPTED: 2,
    FULL: 3,
    RETURN: 4
};

function ResponseMessageList(model, Data) {
    let msg = [];
    for (let i = 0; i < model.length; i++) {
        if (model[i].hasOwnProperty('AlertData')) {
            msg.push({ AlertMessage: model[i].AlertMessage, AlertData: model[i].AlertData })

        } else {
            msg.push({ AlertMessage: model[i].AlertMessage })
        }
    }

    let out = {
        Message: msg,
        ResponseData: Data
    }
    return out;
}

function RandonString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
        counter += 1;
    }
    return result;
}

function ResponseMessage(model, Data) {
    let out = {
        Message: [{ AlertMessage: model }],
        ResponseData: Data
    }
    return out;
}

function randomUUID() {
    return crypto.randomUUID();
}

function CreateDirectory(directoryPath) {
    fs.mkdir(directoryPath, { recursive: true })
        .then(() => {
            console.log(`Directory created: ${directoryPath}`);
        })
        .catch((err) => {
            console.error(err);
        });
}

function SaveImage(base64String, filePath, filename, ext, path) {
    try {
        let preExt = "";
        let fileType = "";
        if (base64String != "") {
            filePath = filePath + filename + ext;
            if (base64String.startsWith("data:")) {
                preExt = base64String.split(',')[0];
                preExt = preExt.split(';')[0];
                preExt = preExt.replace("data:", "");
                const fileDetails = preExt.split('/');
                preExt = fileDetails[1];
                fileType = fileDetails[0];
                base64String = base64String.split(',')[1];
            }
            if (preExt != "")
                filePath = filePath.replace(ext, "." + preExt);
            const imageBuffer = Buffer.from(base64String, 'base64');
            fs.writeFile(filePath, imageBuffer, (err) => {
                if (err) {
                    filePath = "";
                }
            });
        }
        else
            filePath = "";
    } catch (error) {
        filePath = "";
    }
    return filePath
}

function MqttpublishData(mqttClient, topic, data) {
    mqttClient.publishData(topic, JSON.stringify(data), (err) => {
        if (err) {
            throw err
        }
    });
}

function INRFormat(number)
{
    return new Intl.NumberFormat('en-IN', {
      style: 'currency',
      currency: 'INR',
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
    }).format(number);
};

function plzazTxnNumber(PlazaId,laneId, tDateTime) {
    let dt=new Date()
    if(tDateTime==undefined){
        dt = new Date()
    }
    else{
        dt = new Date(tDateTime) 
    }
    const year = dt.getFullYear().toString();
    const month = ('0' + (dt.getMonth() + 1)).slice(-2);
    const day = ('0' + dt.getDate()).slice(-2);
    const hours = ('0' + dt.getHours()).slice(-2);
    const minutes = ('0' + dt.getMinutes()).slice(-2);
    const seconds = ('0' + dt.getSeconds()).slice(-2);
    const milliseconds = ('00' + dt.getMilliseconds()).slice(-3);
    const formattedNumber = `${year}${month}${day}${hours}${minutes}${seconds}${milliseconds}${laneId.toString().padStart(2, '0')}${PlazaId.toString().padStart(2, '0')}`;
    return formattedNumber;
}



module.exports = {
    ResponseMessageList,
    ResponseMessage,
    SaveImage,
    randomUUID,
    RandonString,
    CreateDirectory,
    MqttpublishData,
    plzazTxnNumber,
    INRFormat,
    AppProvider,
    JWTkey,
    root_path,
    log_path,
    db_path,
    pc_path
};