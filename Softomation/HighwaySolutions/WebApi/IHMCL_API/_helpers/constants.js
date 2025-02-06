const path = require('path');
const fs = require('fs');
const os = require('os');
const root_path = os.platform() === 'win32' ? 'C:\\ProjectConfig\\TMSv1\\' : '/home/ProjectConfig/TMSv1/';
const log_path = 'logs/IcdAPI/'
const db_path = 'MasterConfig/NodeDBConfiguration.json'
const saveDirectory = path.join(root_path,'ICDDataFiles' ,'Response');
const { SignedXml } = require('xml-crypto');
const { v4: uuidv4 } = require('uuid');
const logger = require('./logger');
const crtFilePath = '/home/ProjectConfig/TMSv1/MasterConfig/BankKeys/etc_uat.crt'
const ourCrtFilePath = '/home/ProjectConfig/TMSv1/MasterConfig/PlazaKeys/certificate.pfx'
const icd_path = 'MasterConfig/BankAPIPath.json'
if (!fs.existsSync(saveDirectory)) {
    fs.mkdirSync(saveDirectory);
}

function saveReceivedDataAsFile(xmlData, saveDir, filename) {
    if (typeof xmlData !== 'string') {
        return Promise.reject(new Error('Invalid XML data'));
    }
    try {
        if (!fs.existsSync(saveDir)) {
            fs.mkdirSync(saveDir, { recursive: true });
        }
    } catch (err) {
        return Promise.reject(new Error('Failed to create directory: ' + err.message));
    }
    return new Promise((resolve, reject) => {
        let saveLoc = path.join(saveDir, filename); // Use let here
        try {
            if (fs.existsSync(saveLoc)) {
                const fileExt = path.extname(filename);
                const baseName = path.basename(filename, fileExt);
                const randomSuffix = '_' + Math.floor(1000 + Math.random() * 9000);
                const newFileName = baseName + randomSuffix + fileExt;
                saveLoc = path.join(saveDir, newFileName);
            }
        } catch (err) {
            return reject(new Error('Error checking file existence: ' + err.message));
        }
        fs.writeFile(saveLoc, xmlData, 'utf8', (err) => {
            if (err) {
                reject(new Error('Failed to write file: ' + err.message));
                return;
            }
            resolve(saveLoc);
        });
    });

}

function validateXmlSignature(xmlData) {
    try {
        const publicKey = fs.readFileSync(crtFilePath, 'utf-8');
        const sig = new SignedXml();
        sig.loadSignature(xmlData);
        const isValid = sig.checkSignature(xmlData, publicKey);
        return isValid;
    } catch (error) {
        throw error;
    }
}

function getMessageId(size) {
    return uuidv4().replace(/-/g, '').substring(0, size).toUpperCase();
}

function date_format_folder(timestamp) {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}_${month}_${day}`;
}

function save_response_file(xmlData,timestamp,responseType,messageId,apiname) {
    try {
        const dateFolder = date_format_folder(timestamp);
        const saveDir = path.join(root_path, "ICDDataFiles" ,"Response", dateFolder, responseType, messageId);
        const name = getMessageId(10)
        const filename = `${name}.xml`;
        saveReceivedDataAsFile(xmlData, saveDir, filename);
    } catch (err) {
        errorlogMessage(err, apiname+'_savefile');
    }
}
function save_response_file_msgId(xmlData,timestamp,responseType,messageId,apiname) {
    try {
        const dateFolder = date_format_folder(timestamp);
        const saveDir = path.join(root_path, "ICDDataFiles" ,"Response", dateFolder, responseType);
        const filename = `${messageId}.xml`;
        saveReceivedDataAsFile(xmlData, saveDir, filename);
    } catch (err) {
        errorlogMessage(err, apiname+'_savefile');
    }
}
function errorlogMessage(error, method) {
    try {
        logger.error(`Caught an error in :${method} : ${error.message}`);
        logger.error(error.stack);
    }
    catch (error) {
        logger.error(`Caught an error in :${method}`);
    }
}

const responseResultMapping = {
    ACCEPTED: 1,
    DECLINED: 0,
    INPROCESS: 2,
};

const fate_type_mapping = {
    '': 0,
    DISCOUNTED: 1,
    EXEMPTED: 2,
    FULL: 3,
    RETURN: 4,
    SINGLEJOURNEY: 5
}

const responseResultSMapping = {
    SUCCESS: 1,
    FAILURE: 0
};

const notificationMapping = {
    CREDIT: 1,
    DEBIT: 2,
    NON_FIN: 3
};

module.exports = {
    saveReceivedDataAsFile,
    validateXmlSignature,
    date_format_folder,
    getMessageId,
    save_response_file,
    save_response_file_msgId,
    errorlogMessage,
    root_path,
    icd_path,
    db_path,
    log_path,
    saveDirectory,
    ourCrtFilePath,
    responseResultMapping,
    responseResultSMapping,
    fate_type_mapping,
    notificationMapping
}