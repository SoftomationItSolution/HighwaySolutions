const path = require('path');
const fs = require('fs');
//const fs = require('fs').promises;
const os = require('os');
const root_path  = os.platform() === 'win32' ? 'C:\\ProjectConfig\\TMSv1\\' : '/home/ProjectConfig/TMSv1/';
//console.log(root_path )

const log_path = 'log/BackOfficeAPI/'
// const db_path = 'MasterConfig/NodeDBConfiguration.json'
// const pc_path = 'MasterConfig/ProjectConfiguration.json'
//#endregion

const saveDirectory = path.join(root_path, 'received_xmls');

// Create the directory if it doesn't exist
if (!fs.existsSync(saveDirectory)) {
    fs.mkdirSync(saveDirectory);
}

function saveReceivedDataAsFile(xmlData) {
    return new Promise((resolve, reject) => {
        const fileName = `response_${Date.now()}.xml`;
        const filePath = path.join(saveDirectory, fileName);

        fs.writeFile(filePath, xmlData, 'utf8', (err) => {
            if (err) {
                reject(err);
                return;
            }
            resolve(filePath);
        });
    });
}

module.exports = {
    saveReceivedDataAsFile,
    root_path,
    log_path
}