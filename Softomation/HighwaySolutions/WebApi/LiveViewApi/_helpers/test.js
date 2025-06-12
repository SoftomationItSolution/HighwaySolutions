const crypto = require('crypto');
const key = '0123456789abcdef0123456789abcdef'; // 32 bytes key for AES-256
const encryptionIV = '$0ft0m@ti0nTech$';
function encryptData(data) {
    const cipher = crypto.createCipheriv('aes-256-cbc', key, encryptionIV)
    return Buffer.from(
      cipher.update(data, 'utf8', 'hex') + cipher.final('hex')
    ).toString('base64') // Encrypts data and converts to hex and base64
  }
  
  // Decrypt data
function decryptData(encryptedData) {
    const buff = Buffer.from(encryptedData, 'base64')
    const decipher = crypto.createDecipheriv('aes-256-cbc', key, encryptionIV)
    return (
      decipher.update(buff.toString('utf8'), 'hex', 'utf8') +
      decipher.final('utf8')
    ) // Decrypts data and converts to utf8
  }

// Example usage

//const iv = crypto.randomBytes(16).toString('hex');

try {
    const plaintext = 'Admin@123';
    // const ciphertext = encryptAes256Cbc(key, iv, plaintext);
    // const decryptedText = decryptAes256Cbc(key, iv, ciphertext);
    const ciphertext = encryptData(plaintext);
    const decryptedText = decryptData(ciphertext);
    console.log(`Plaintext: ${plaintext}`);
    console.log(`Ciphertext: ${ciphertext}`);
    console.log(`Decrypted Text: ${decryptedText}`);
} catch (error) {
    console.error('Example usage error:', error.message);
}