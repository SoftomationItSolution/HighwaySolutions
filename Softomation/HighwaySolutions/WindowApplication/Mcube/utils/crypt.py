from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from base64 import b64encode, b64decode
import jwt
from datetime import datetime, timedelta
from utils.constants import Utilities


class CryptoUtils:
    @staticmethod
    def encrypt_aes_256_cbc(plaintext):
        plaintext_bytes = plaintext.encode('utf-8')
        padder = padding.PKCS7(algorithms.AES.block_size).padder()
        padded_data = padder.update(plaintext_bytes) + padder.finalize()
        cipher = Cipher(algorithms.AES(Utilities.key), modes.CBC(Utilities.iv), backend=default_backend())
        encryptor = cipher.encryptor()
        ciphertext = encryptor.update(padded_data) + encryptor.finalize()
        return b64encode(ciphertext).decode('utf-8')

    @staticmethod
    def decrypt_aes_256_cbc(ciphertext):
        ciphertext = b64decode(ciphertext)
        cipher = Cipher(algorithms.AES(Utilities.key), modes.CBC(Utilities.iv), backend=default_backend())
        decryptor = cipher.decryptor()
        decrypted_data = decryptor.update(ciphertext) + decryptor.finalize()
        unpadder = padding.PKCS7(algorithms.AES.block_size).unpadder()
        plaintext_bytes = unpadder.update(decrypted_data) + unpadder.finalize()
        plaintext = plaintext_bytes.decode('utf-8')
        return plaintext

    @staticmethod
    def get_token(user_id,hours):
        expiration_time = datetime.utcnow() + timedelta(hours=hours)
        payload = {
            'exp': expiration_time,
            'iat': datetime.utcnow(),
            'sub': user_id  # You can include additional claims as needed
        }
        token = jwt.encode(payload, Utilities.iv, algorithm='HS256')
        res={"token": token,"expiresIn": expiration_time.strftime(Utilities.json_date_time_format)}
        return res