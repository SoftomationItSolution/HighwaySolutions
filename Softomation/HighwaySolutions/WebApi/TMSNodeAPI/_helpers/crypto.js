const crypto = require('crypto');
const key = '0123456789abcdef0123456789abcdef'; // 32 bytes key for AES-256
const iv = '$0ft0m@ti0nTech$'; // 16 bytes IV for AES-256-CBC

function encrypt(plaintext) {
    const cipher = crypto.createCipheriv('aes-256-cbc', Buffer.from(key, 'hex'), Buffer.from(iv, 'hex'));
    let encrypted = cipher.update(plaintext, 'utf-8', 'base64');
    encrypted += cipher.final('base64');
    return encrypted;
}

function decrypt(ciphertext) {
    const decipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from(key, 'hex'), Buffer.from(iv, 'hex'));
    let decrypted = decipher.update(ciphertext, 'base64', 'utf-8');
    decrypted += decipher.final('utf-8');
    return decrypted;
}

module.exports = {
    encrypt,
    decrypt
  };