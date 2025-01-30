const crypto = require('crypto');
const key = '0123456789abcdef0123456789abcdef'; // 32 bytes key for AES-256
const encryptionIV = '$0ft0m@ti0nTech$'; // 16 bytes IV for AES-256-CBC

function encrypt(data) {
  try {
    const cipher = crypto.createCipheriv('aes-256-cbc', key, encryptionIV)
    return Buffer.from(
      cipher.update(data, 'utf8', 'hex') + cipher.final('hex')
    ).toString('base64') // Encrypts data and converts to hex and base64
  } catch (error) {
    return data;
  }
}

function decrypt(encryptedData) {
  try {
    const buff = Buffer.from(encryptedData, 'base64')
    const decipher = crypto.createDecipheriv('aes-256-cbc', key, encryptionIV)
    return (
      decipher.update(buff.toString('utf8'), 'hex', 'utf8') +
      decipher.final('utf8')
    )
  } catch (error) {
    return encryptedData;
  }
}

module.exports = {
  encrypt,
  decrypt
};