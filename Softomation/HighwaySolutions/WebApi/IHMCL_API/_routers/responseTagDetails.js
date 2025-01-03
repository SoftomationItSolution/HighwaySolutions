const express = require('express');
const constants = require("../_helpers/constants");
const router = express.Router();
const database = require('../_helpers/dbSingleton');
const logger = require('../_helpers/logger');
const sql = require('mssql');
const xml2js = require('xml2js');
const xmlbuilder = require('xmlbuilder');
const fs = require('fs').promises;
const fs_old = require('fs');
const axios = require('axios');
const SignedXml = require('xml-crypto').SignedXml;
const forge = require('node-forge');
const {
    root_path,
    icd_path
} = require("../_helpers/constants");
const path = require('path');
const icd_Directory = path.join(root_path, icd_path);
router.post('/response-tag-details', responseTagDetail);
router.post('/check-tag-details', checkTagDetail);

async function sendDataToAnotherApi(data) {
    try {
        const response = await axios.post('http://localhost:5003/tagRequest', data, {
            headers: { 'Content-Type': 'application/json' },
            timeout: 5000 // optional timeout setting
        });

        return response.data; // Return the response body
    } catch (error) {
        return {"status":"error","message":error.message}
    }
}

async function sendXmlToApi(xmlData, apiUrl) {
    try {
        const response = await axios.post(apiUrl, xmlData, {
            headers: { 'Content-Type': 'application/xml' },
            timeout: 5000,
            httpsAgent: new (require('https')).Agent({ rejectUnauthorized: false }) // Skip certificate validation
        });

        return response.data;
    } catch (error) {
        throw new Error(`Error in sending XML: ${error.message}`);
    }
}

async function checkTagDetail(req, res) {
    const { TagId, TID, VRN } = req.body;
    const responseFromAnotherApi = await sendDataToAnotherApi({ TagId, TID, VRN });
    if(responseFromAnotherApi["status"]=="success"){
        const signed_xml=responseFromAnotherApi["signed_xml"]
        const signed_url=responseFromAnotherApi["url"]
        console.log(signed_xml)
        console.log(signed_url)
        res.status(200).send(responseFromAnotherApi["status"]);
    }
    else
        res.status(200).send(responseFromAnotherApi);
}

function createXml(data) {
    const current_date = new Date();
    let plazaList = data.combinedData.PlazaList;
    let bankDetails = data.combinedData.bankDetails;
    const namespace = "http://npci.org/etc/schema/";
    const root = xmlbuilder.create("etc:ReqTagDetails", { version: '1.0', encoding: 'UTF-8' }).att("xmlns:etc", namespace);
    const head = root.ele("Head")
        .att("ver", bankDetails["Version"])
        .att("ts", constants.date_format_folder(current_date))
        .att("orgId", plazaList["OrganizationId"])
        .att("msgId", data.combinedData["MessageId"]);
    const txn = root.ele("Txn")
        .att("id", constants.getMessageId(22))
        .att("note", '')
        .att("refId", '')
        .att("refUrl", '')
        .att("ts", constants.date_format_folder(current_date))
        .att("type", "FETCH")
        .att("orgTxnId", "");

    const vehicle = txn.ele("Vehicle")
        .att("TID", data.TID)
        .att("vehicleRegNo", data.VRN)
        .att("tagId", data.TagId);

    return root.end({ pretty: true });
}

function extractPfxInfo(pfxPath, password) {
    const pfxData = fs_old.readFileSync(pfxPath);
    const p12Asn1 = forge.asn1.fromDer(pfxData.toString('binary'));
    const p12 = forge.pkcs12.pkcs12FromAsn1(p12Asn1, password);
    const keyBag = p12.getBags({ bagType: forge.pki.oids.pkcs8ShroudedKeyBag });
    const certBag = p12.getBags({ bagType: forge.pki.oids.certBag });
    const keyObj = Object.values(keyBag)[0][0];
    const privateKeyPem = forge.pki.privateKeyToPem(keyObj.key);
    const certObj = Object.values(certBag)[0][0];
    const certificatePem = forge.pki.certificateToPem(certObj.cert);
    return { privateKey: privateKeyPem, certificate: certificatePem };
}

function signXml(xmlString, pfxPath, password) {
    const { privateKey, certificate } = extractPfxInfo(pfxPath, password);
    if (!privateKey || !certificate) {
        throw new Error("Invalid private key or certificate.");
    }
    const signedXml = new SignedXml();

    // Set canonicalization and signature algorithms
    signedXml.canonicalizationAlgorithm = "http://www.w3.org/2001/10/xml-exc-c14n#"; // Exclusive XML Canonicalization
    signedXml.signatureAlgorithm = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"; // RSA-SHA256

    // Correctly set reference and transforms
    signedXml.addReference({
        uri: "#", // Sign the whole document
        transforms: [
            "http://www.w3.org/2000/09/xmldsig#enveloped-signature"
        ],
        digestAlgorithm: "http://www.w3.org/2001/04/xmlenc#sha256",
        xpath: "//*[local-name(.)='Txn']",
        namespaces: {
            "etc": "http://npci.org/etc/schema/" // Explicitly define the namespace
        }
    });
    signedXml.privateKey = privateKey;
    try {
        signedXml.computeSignature(xmlString);
        let signedXmlString = signedXml.getSignedXml();
        const subjectName = extractSubjectName(certificate);
        const cleanCert = certificate
            .replace(/(-----(BEGIN|END) CERTIFICATE-----|\n)/g, "")
            .trim(); // Clean certificate string
        const keyInfoXml = `
            <KeyInfo>
                <X509Data>
                    <X509SubjectName>${subjectName}</X509SubjectName>
                    <X509Certificate>${cleanCert}</X509Certificate>
                </X509Data>
            </KeyInfo>
        `;
        signedXmlString = signedXmlString.replace('</Signature>', `${keyInfoXml}</Signature>`);
        return signedXmlString;
    } catch (error) {
        throw error;
    }
}

function extractSubjectName(certificate) {
    const matches = certificate.match(/(?<=CN=)([^,]+)/); // Extract the Common Name (CN)
    return matches ? matches[0] : "Unknown Subject"; // Return the CN or "Unknown Subject" if not found
}

async function sendXmlToApi(xmlData, apiUrl) {
    try {
        const response = await axios.post(apiUrl, xmlData, {
            headers: { 'Content-Type': 'application/xml' },
            timeout: 5000,
            httpsAgent: new (require('https')).Agent({ rejectUnauthorized: false }) // Skip certificate validation
        });

        return response.data;
    } catch (error) {
        throw new Error(`Error in sending XML: ${error.message}`);
    }
}

async function checkTagDetail_bkp(req, res) {
    const { TagId, TID, VRN } = req.body;
    try {
        const pool = await database.getPool();
        const result = await pool.request().execute('USP_ICDPlazaGetAll');
        const data = await fs.readFile(icd_Directory, 'utf8');
        const jsonData = JSON.parse(data);
        const messageId = constants.getMessageId(32);
        let plazaList = result.recordset;
        let bankDetails = jsonData.UatApiDetails;
        if (plazaList.length > 0) {
            plazaList = plazaList[0];
            if (plazaList.IsProducation) {
                bankDetails = jsonData.ProdApiDetails;
            }
            const combinedData = {
                "PlazaList": result.recordset,
                "bankDetails": bankDetails,
                "MessageId": messageId
            };
            const xmlData = createXml({ TagId, TID, VRN, combinedData });
            const certificatePath = constants.ourCrtFilePath;
            const signedXml = signXml(xmlData, certificatePath, "mcube@123");
            const apiUrl=bankDetails["BaseUrl"]+bankDetails["RequestTagDetailsURL"];
            const apiResponse = await sendXmlToApi(signedXml, apiUrl);
            console.log(apiResponse)
        }
        // Return success response
        //let out = constants.ResponseMessage("success", combinedData);
        res.status(200);
    } catch (err) {
        // Log and handle any errors
        errorlogMessage(err, 'Error in checkTagDetail function');
        //let out = constants.ResponseMessage(err.message, null);
        res.status(500);
    }
}

async function responseTagDetail(req, res) {
    try {
        const xmlData = req.body;
        const isSignatureValid = constants.validateXmlSignature(xmlData);
        if (isSignatureValid) {
            xml2js.parseString(xmlData, { explicitArray: false }, async (err, result) => {
                if (err) {
                    return res.status(400).send('Invalid XML data');
                }

                const head = result['etc:RespTagDetails'].Head;
                const MessageId = head.$.msgId;
                const resp = result['etc:RespTagDetails'].Txn[0].Resp;
                const respCode = resp.$.respCode;
                const successReqCnt = resp.$.successReqCnt;
                const totReqCnt = resp.$.totReqCnt;
                const timestamp = resp.$.ts;
                const responseResult = constants.responseResultSMapping[resp.$.result];
                let errCode = -1
                const detailsByName = {
                    TAGID: '',
                    REGNUMBER: '',
                    TID: '',
                    VEHICLECLASS: 'VC0',
                    TAGSTATUS: 'B',
                    EXCCODE: "01",
                    COMVEHICLE: "F"
                };
                if (responseResult == 1) {
                    const Vehicle = result['etc:RespTagDetails'].Txn[0].Resp[0].Vehicle;
                    errCode = parseInt(Vehicle.$.errCode)
                    const vehicleDetails = result['etc:RespTagDetails'].Txn[0].Resp[0].Vehicle[0].VehicleDetails[0].Detail;
                    vehicleDetails.forEach(detail => {
                        const name = detail.$.name;
                        if (detailsByName.hasOwnProperty(name)) {
                            detailsByName[name] = detail.$.value;
                        }
                    });
                }
                try {
                    const dateFolder = date_format_folder(timestamp);
                    const saveDir = path.join(icd_path, dateFolder);
                    const filename = `tag_details_${msgId}.xml`;
                    constants.saveReceivedDataAsFile(xmlData, saveDir, filename);
                } catch (err) {
                    errorlogMessage(err, 'tag_details_savefile');
                }

                try {
                    const pool = await database.getPool();
                    result = await pool.request().input('MessageId', sql.VarChar(35), MessageId)
                        .input('ResponseCode', sql.SmallInt, parseInt(respCode))
                        .input('ResponseResult', sql.SmallInt, responseResult)
                        .input('ResponseSuccessRequestCount', sql.Int, successReqCnt)
                        .input('ResponseTotalRequestCount', sql.Int, totReqCnt)
                        .input('ResponseDateTime', sql.DateTime, timestamp)
                        .input('ResponseErrorCode', sql.Int, errCode)
                        .input('ResponseVehicleClass', sql.SmallInt, parseInt(detailsByName.VEHICLECLASS.replace("VC", "")))
                        .input('ResponseTagId', sql.VarChar(50), detailsByName.TAGID)
                        .input('ResponseTID', sql.VarChar(50), detailsByName.TID)
                        .input('ResponseVRN', sql.VarChar(20), detailsByName.REGNUMBER)
                        .input('ResponseTagStatus', sql.Bit, detailsByName.TAGSTATUS === 'A' ? true : false)
                        .input('IsCommercialVehicle', sql.Bit, detailsByName.COMVEHICLE === 'F' ? false : true)
                        .input('ResponseExcCode', sql.Int, parseInt(detailsByName.EXCCODE))
                        .execute('USP_ICDRequestTagDetailUpdateResponse');
                    let out = constants.ResponseMessageList(result.recordset, null);
                } catch (error) {
                    errorlogMessage(error, 'responsePay_saveinDB');
                }
                res.status(202).send();
            });
        }
        else {
            res.status(417).send('Expectation Failed');
        }
    } catch (error) {
        console.error('XML Parsing Error:', error);
        res.status(400).json({
            status: 'error',
            message: 'Invalid XML format',
            error: error.message
        });
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

module.exports = router;